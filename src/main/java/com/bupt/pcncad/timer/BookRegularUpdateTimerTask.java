package com.bupt.pcncad.timer;

import com.bupt.pcncad.dao.resource.IResourceDao;
import com.bupt.pcncad.domain.Resource;
import com.bupt.pcncad.service.fetch.IFetchBookInfoService;
import com.bupt.pcncad.service.index.AbstractIndexProcess;
import com.bupt.pcncad.util.*;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-4-23
 * Time: 下午3:19
 * To change this template use File | Settings | File Templates.
 */
@Component
public class BookRegularUpdateTimerTask implements InitializingBean {

    private Timer timer = new Timer(true);
    @Autowired
    private BookInfoCrawler bookInfoCrawler;
    @Autowired
    private IFetchBookInfoService fetchBookInfoService;
    @Autowired
    private IResourceDao resourceDao;

    @Autowired
    @Qualifier("resourceIndexProcess")
    private AbstractIndexProcess resourceIndexProcess;
    @Autowired
    @Qualifier("communityIndexProcess")
    private AbstractIndexProcess communityIndexProcess;

    @Override
    public void afterPropertiesSet() throws Exception {
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    bookInfoCrawler.fetchBookInfo();
                    fetchBookInfoService.fetchAndSaveDoubanBookInfo(bookInfoCrawler.getAllBooks());
                    bookInfoCrawler.fetchBookInfoByHotSearchQuery();
                    fetchBookInfoService.getBooksByHotQueryWord(bookInfoCrawler.getHotWordSet());
                    LoggerUtil.debug(this.getClass(), Calendar.getInstance().toString() + " fetch book info");
                } catch (IOException e) {
                    LoggerUtil.error(this.getClass(), "Timer Error");
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
            }
        }, Calendar.getInstance().getTime(), 60 * 60 * 1000 * 24);
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    System.out.println("***********************index begain****************");
                    resourceIndexProcess.createIndex();
                    communityIndexProcess.createIndex();
                    System.out.println("***********************index end****************");
                } catch (Exception e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }

            }
        }, Calendar.getInstance().getTime(), 60*1000 * 24);
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    Resource resource = resourceDao.findEntity("from Resource r where r.haveSwf=0");
                    if(resource==null){
                        return;
                    }
                    String resourceId = resource.getId();
                    String type = resource.getResourceType();
                    String sourcePath = ResourceUtil.getRealSavePathByResourceId(resourceId);
                    String sourceFile =  sourcePath + resourceId + "." + type;
                    String destFile = null;
                    boolean ispdf = resource.getResourceType().equals("pdf");
                    boolean isdoc = resource.getResourceType().equals("doc");
                    boolean isdocx = resource.getResourceType().equals("docx");
                    boolean isppt = resource.getResourceType().equals("ppt");
                    boolean ispptx = resource.getResourceType().equals("pptx");
                    String temp = this.getClass().getResource("/").getPath();
                    String path = temp.substring(0,temp.length()-16);
                    path = path + "swf/";
                    System.out.println(path);
                    int office2pdf = -1;
                    int pdf2swf = -1;
                    if(ispdf || isdoc || isdocx || isppt || ispptx) {
                        if(!ispdf){
                            destFile = sourcePath + resourceId + ".pdf";
                            System.out.println("**********************type to pdfl****************");
                            office2pdf = Office2PDF.office2PDF(sourceFile, destFile);
                        }
                        else
                            office2pdf = 0;
                        sourceFile = sourcePath + resourceId + ".pdf";
                        destFile = path + resourceId + ".swf";
                        if(office2pdf == 0){
                            PDF2JPG pdf2jpg = new PDF2JPG();
                            System.out.println("**********************pdf to jpg****************");
                            pdf2jpg.generateBookIamge(sourceFile,path + resourceId + ".jpg");
                            resource.setCoverJpg(1);
                            resourceDao.update(resource);
                            System.out.println("**********************pdf to swf****************");
                            pdf2swf = PDF2SWF.pdf2SWF(sourceFile, destFile);
                            if(pdf2swf == 0){
                                resource.setHaveSwf(1);
                                resourceDao.update(resource);
                                System.out.println("**********************resource is done****************");
                            }
                            else {
                                resource.setHaveSwf(2);
                                resourceDao.update(resource);
                                System.out.println("**********************resource is fail to swf****************");
                            }
                        }
                        else {
                            resource.setHaveSwf(2);
                            resourceDao.update(resource);
                            System.out.println("***************resource is fail to pdf************************");
                        }
                    }
                    else {
                        System.out.println("****************resource is other type******************");
                        resource.setHaveSwf(1);
                        resourceDao.update(resource);
                    }

                } catch (Exception e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }

            }
        }, Calendar.getInstance().getTime(), 60*1000 * 5);
    }

    /*  public static void main(String[] args) throws Exception {
        BookInfoCrawler bookInfoCrawler = new BookInfoCrawler();
        IFetchBookInfoService fetchBookInfoService = new FetchBookInfoServiceImpl();
        bookInfoCrawler.fetchBookInfo();
        bookInfoCrawler.fetchBookInfoByHotSearchQuery();
        fetchBookInfoService.fetchAndSaveDoubanBookInfo(bookInfoCrawler.getAllBooks());
        fetchBookInfoService.getBooksByHotQueryWord(bookInfoCrawler.getHotWordSet());
    }*/
}
