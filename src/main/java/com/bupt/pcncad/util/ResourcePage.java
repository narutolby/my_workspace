package com.bupt.pcncad.util;

import com.bupt.pcncad.dao.IHibernateGenericDao;
import com.bupt.pcncad.domain.Resource;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.bupt.pcncad.util.Constants.PAGE_NO;

/**
 * Created with IntelliJ IDEA.
 * User: zhang
 * Date: 13-6-17
 * Time: 上午11:18
 * To change this template use File | Settings | File Templates.
 */
public class ResourcePage<T extends Serializable> {
    private IHibernateGenericDao<Resource, String> hibernateGenericDao = null;

    private DetachedCriteria detachedCriteria;

    private int pageNo = PAGE_NO;

    private int pageCount;

    private int pageSize;

    private long totalCount;

    private List<ResourceSizeUtil> resourcelist = new ArrayList<ResourceSizeUtil>();

    public ResourcePage(String path, int pageNo, int pageSize, IHibernateGenericDao<Resource, String> hibernateGenericDao, DetachedCriteria detachedCriteria) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.hibernateGenericDao = hibernateGenericDao;
        this.detachedCriteria = detachedCriteria;
        try {
            this.init(path);
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }
    private void init(String path) throws IOException {
        this.totalCount = this.hibernateGenericDao.getCount(detachedCriteria);
        this.pageCount = (int) (this.totalCount % this.pageSize == 0 ? this.totalCount / this.pageSize : this.totalCount / this.pageSize + 1);
        if(pageNo<1){
            pageNo = 1;
        }else if(pageNo>pageCount){
            pageNo = pageCount;
        }
        detachedCriteria.setProjection(null);
        detachedCriteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
        List<Resource> resources = this.hibernateGenericDao.findByHql("from Resource r where r.deleteFlag=?", (pageNo - 1)*this.pageSize, this.pageSize, 0);

        Iterator it = resources.iterator();
        while(it.hasNext()){
            Resource resource = (Resource)it.next();
            String resourceId = resource.getId();
            String type = resource.getResourceType();
            String sourcePath = ResourceUtil.getRealSavePathByResourceId(resourceId);
            String sourceFile = sourcePath + resourceId + "." + type;
            String destFile = null;
            if(resource.getHaveSwf() == 0){
                boolean ispdf = resource.getResourceType().equals("pdf");
                boolean isdoc = resource.getResourceType().equals("doc");
                boolean isdocx = resource.getResourceType().equals("docx");
                boolean isppt = resource.getResourceType().equals("ppt");
                boolean ispptx = resource.getResourceType().equals("pptx");
                if(ispdf || isdoc || isdocx || isppt || ispptx) {
                    if(!ispdf){
                        destFile = sourcePath + resourceId + ".pdf";
                        System.out.println(Office2PDF.office2PDF(sourceFile, destFile));
                    }
                    sourceFile = sourcePath + resourceId + ".pdf";
                    destFile = path + resourceId + ".swf";
                    PDF2JPG pdf2jpg = new PDF2JPG();
                    pdf2jpg.generateBookIamge(sourceFile,path + resourceId + ".jpg");
                    System.out.println(PDF2SWF.pdf2SWF(sourceFile, destFile));
                    resource.setHaveSwf(1);
                    this.hibernateGenericDao.save(resource);
                }
            }

            long size = resource.getResourceSize();
            long realSize = size;
            String unit = "B";
            if(size > 1024 && size < 1024*1024){
                realSize = size / 1024;
                unit = "KB";
            }
            else if(size > 1024*1024){
                realSize = size / 1024 / 1024;
                unit = "MB";
            }
            ResourceSizeUtil resourceSizeUtil = new ResourceSizeUtil(unit,realSize,resource);
            this.resourcelist.add(resourceSizeUtil);
        }
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public List<ResourceSizeUtil> getResourcelist() {
        return resourcelist;
    }

    public void setResourcelist(List<ResourceSizeUtil> resourcelist) {
        this.resourcelist = resourcelist;
    }
}
