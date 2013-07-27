package com.bupt.pcncad.service.resource;

import com.bupt.pcncad.dao.resource.IResourceDao;
import com.bupt.pcncad.dao.user.IUserDao;
import com.bupt.pcncad.domain.Course;
import com.bupt.pcncad.domain.Resource;
import com.bupt.pcncad.domain.User;
import com.bupt.pcncad.util.*;
import com.bupt.pcncad.webContext.WebContextThreadLocal;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: liboyang01
 * Date: 12-7-27
 * Time: 下午9:00
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ResourceOperationServiceImpl implements IResourceOperationService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IResourceDao resourceDao;

    private static final int PAGE_SIZE = 13;

    @Override
    public File uploadResource(MultipartFile file,String userId,StringBuilder resourceId,String...keywords) throws Exception {
        if (!file.isEmpty()) {
            Resource resource = new Resource();
            User user = this.userDao.get(userId);
            int role = user.getRole();

            String realName = file.getOriginalFilename();
            LoggerUtil.info(this.getClass(), WebContextThreadLocal.getCurrentUser().getUserName() + ":上传文件" + realName);
            String type = realName.substring(realName.lastIndexOf(".") + 1);
            resource.setResourceRealName(file.getOriginalFilename());
            resource.setUploadUser(user);
            resource.setUploadTime(new Date());
            for(String keyword: keywords){
                resource.setKeyWords(keyword);
            }
            resource.setResourceSize(file.getSize());
            resource.setResourceType(type);
            if (role == 0)
                resource.setResourceMark(0);
            else if (role == 1)
                resource.setResourceMark(1);
            this.resourceDao.save(resource);
            resourceId.append(resource.getId());
            String savePath = ResourceUtil.getRealSavePathByResourceId(resourceId.toString());
            File directory = new File(savePath);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            InputStream from = file.getInputStream();
            File uploadFile = new File(directory, resourceId + "." + type);
            OutputStream to = new FileOutputStream(uploadFile);
            FileUtil.copy(from, to);
            return uploadFile;
        } else {
            LoggerUtil.error(this.getClass(), "文件不能为空！");
            throw new RuntimeException("文件内容不能为空");
        }
    }

    @Override
    public String uploadImage(MultipartFile file,String imgRootPath) throws Exception {
        String realName = file.getOriginalFilename();
        LoggerUtil.info(this.getClass(), WebContextThreadLocal.getCurrentUser().getUserName() + ":添加图片" + realName);
        String type = realName.substring(realName.lastIndexOf(".") + 1);
        long time = Calendar.getInstance().getTime().getTime();
        String imgName = String.valueOf(time)+"."+type;
        String savePath = imgRootPath+File.separator+"topicImg";
        File directory = new File(savePath);
        if(!directory.exists()){
            directory.mkdirs();
        }
        InputStream from= file.getInputStream();
        File img = new File(directory,imgName);
        OutputStream to = new FileOutputStream(img);
        FileUtil.copy(from,to);
        return imgName;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void downloadResource(String resourceId, HttpServletResponse response) throws Exception {
        Resource resource = this.resourceDao.get(resourceId, LockMode.UPGRADE);
        resource.setDownloadTimes(resource.getDownloadTimes() + 1);
        String fileName = resource.getResourceRealName();
        String savePath = ResourceUtil.getRealSavePathByResourceId(resourceId);
        response.setContentType("application/octet-stream ");
        response.setHeader("Content-disposition", "attachment; filename="
                + new String(fileName.getBytes(), "ISO-8859-1"));
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(new File(savePath, resourceId + "." + resource.getResourceType()));
            os = response.getOutputStream();
            byte[] buff = new byte[1024];
            int length = -1;
            while ((length = is.read(buff)) != 0) {
                os.write(buff, 0, length);
                os.flush();
            }
            LoggerUtil.info(this.getClass(), WebContextThreadLocal.getCurrentUser().getUserName() + "下载:" + resource.getResourceRealName() + ":" + resource.getDownloadTimes());
        } catch (FileNotFoundException e) {
            LoggerUtil.error(this.getClass(), "downLoadResource时没有找到下载文件" + e);
            e.printStackTrace();
        } catch (IOException e) {
            LoggerUtil.error(this.getClass(), "IOException" + e);
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
            }
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
            }
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void shareResource(String resourceId, String... targetId) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Map<String, String> getTop4ShareUser() throws Exception {
        final String sql = " select t.sum,user_name from USER u join (select count(id) sum,upload_user_id from RESOURCE where delete_flag=0 group by upload_user_id) as t on u.id=t.upload_user_id order by t.sum desc limit 0,4;";
        Map<String, String> map = new LinkedHashMap<String, String>();
        List list = this.resourceDao.getByCustom(new HibernateCallback<List>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createSQLQuery(sql);
                return query.list();

            }
        });
        Iterator iterator = list.iterator();
        while (iterator.hasNext()) {
            Object[] row = (Object[]) iterator.next();
            map.put((String)row[1],String.valueOf(row[0]));
        }
        return map;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void collectResource(String resourceId) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void saveResourceWithUser(String resourceId, String category, String keyWords) {
        Resource resource = this.resourceDao.get(resourceId);
        User currentUser = WebContextThreadLocal.getCurrentUser();
        resource.setUploadUser(currentUser);
        resource.setCategory(category);
        resource.setKeyWords(keyWords);
        this.resourceDao.update(resource);
    }

    @Override
    public Pager<Resource> loadResource(int pageNo, int pageSize, DetachedCriteria detachedCriteria) {
        return new Pager<Resource>(pageNo, pageSize, this.resourceDao, detachedCriteria);
    }

    @Override
    public List<Resource> map(String[] resourceIds) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resource.class);
        detachedCriteria.add(Restrictions.in("id", resourceIds));
        List<Resource> list = this.resourceDao.findByDetachedCriteria(detachedCriteria, 0, resourceIds.length);
        return list;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean deleteResource(String resourceId) {
        Resource resource = this.resourceDao.get(resourceId, LockMode.UPGRADE);
        if (resource != null) {
            resource.setDeleteFlag(1);
            return true;
        }
        LoggerUtil.debug(this.getClass(), "资源不存在！");
        return false;

    }

    @Override
    public void saveResource(String[] resourceIdArray, String courseIds, String description,int mark) throws Exception {
        String[] courseIdArray = courseIds.split(",");
        for (String resourceId : resourceIdArray) {
            Resource resource = this.resourceDao.get(resourceId);
            resource.setDescription(description);
            resource.setMark(mark);
            for (String courseId : courseIdArray) {
                Course course = new Course();
                course.setId(courseId);
                resource.getResourceCourses().add(course);
                this.resourceDao.update(resource);
            }
        }
    }

    public Resource updateResource(String resourceId) throws Exception {
        Resource resource = this.resourceDao.findEntity("from Resource resource where resource.id=?", resourceId);
        //  Set<Course> courseSet = user.getCourses();
        resource.setResourceMark(1);
        this.resourceDao.update(resource);
        if (resource == null) {
            return null;
        } else {
            return resource;
        }
    }

    public Pager<Resource> getReviewResource(int pageNo) throws Exception {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resource.class);
        detachedCriteria.addOrder(Order.desc("uploadTime"));
        detachedCriteria.add(Restrictions.eq("deleteFlag", 0));
        detachedCriteria.createAlias("uploadUser", "user");
        detachedCriteria.add(Restrictions.eq("resourceMark", 0));
        detachedCriteria.add(Restrictions.not(Restrictions.like("user.userId", "20108%")));
        Pager<Resource> pager = new Pager<Resource>(pageNo, PAGE_SIZE, resourceDao, detachedCriteria);
        return pager;

    }

    public Pager<Resource> getPassResource(int pageNo) throws Exception {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resource.class);
        detachedCriteria.addOrder(Order.desc("uploadTime"));
        detachedCriteria.add(Restrictions.eq("deleteFlag", 0));
        detachedCriteria.createAlias("uploadUser", "user");
        detachedCriteria.add(Restrictions.eq("resourceMark", 1));
        detachedCriteria.add(Restrictions.not(Restrictions.like("user.userId", "20108%")));
        Pager<Resource> pager = new Pager<Resource>(pageNo, PAGE_SIZE, resourceDao, detachedCriteria);
        return pager;

    }

    public Pager<Resource> getRefusedResource(int pageNo) throws Exception {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resource.class);
        detachedCriteria.addOrder(Order.desc("uploadTime"));
        detachedCriteria.add(Restrictions.eq("deleteFlag", 1));
        detachedCriteria.createAlias("uploadUser", "user");
        detachedCriteria.add(Restrictions.eq("resourceMark", 0));
        detachedCriteria.add(Restrictions.not(Restrictions.like("user.userId", "20108%")));
        Pager<Resource> pager = new Pager<Resource>(pageNo, PAGE_SIZE, resourceDao, detachedCriteria);
        return pager;

    }

    public ResourcePage<ResourceSizeUtil> getAllResource(String path, int pageNo) throws Exception{
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Resource.class);
        detachedCriteria.add(Restrictions.eq("deleteFlag", 0));
        ResourcePage pager = new ResourcePage(path,pageNo,10,resourceDao,detachedCriteria);
        return pager;
    }

    public String getResourcePerview(String resourceId,String path) throws Exception{
//        Resource resource = this.resourceDao.get(resourceId);
//        String type = resource.getResourceType();
//        String sourcePath = ResourceUtil.getRealSavePathByResourceId(resourceId);
//        String sourceFile = sourcePath + resourceId + "." + type;
//        String destFile = null;
//        if(resource.getHaveSwf() == 0){
//            if(!(resource.getResourceType().equals("pdf"))){
//                destFile = sourcePath + resourceId + ".pdf";
//                System.out.println(Office2PDF.office2PDF(sourceFile, destFile));
//            }
//            sourceFile = sourcePath + resourceId + ".pdf";
//            destFile = path + resourceId + ".swf";
//            System.out.println(PDF2SWF.pdf2SWF(sourceFile, destFile));
//            //resource.setHaveSwf(1);
//            this.resourceDao.save(resource);
//        }
        Resource resource = this.resourceDao.get(resourceId);
        String type = resource.getResourceType();
        String sourcePath = ResourceUtil.getRealSavePathByResourceId(resourceId);
        String sourceFile = sourcePath + resourceId + "." + type;
        String destFile = null;
        if(resource.getHaveSwf() == 0 || resource.getHaveSwf() == 2){
            boolean ispdf = resource.getResourceType().equals("pdf");
            boolean isdoc = resource.getResourceType().equals("doc");
            boolean isdocx = resource.getResourceType().equals("docx");
            boolean isppt = resource.getResourceType().equals("ppt");
            boolean ispptx = resource.getResourceType().equals("pptx");

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
        }

        return "swf/" + resourceId + ".swf";
    }

    public Resource getResource() throws Exception{
        Resource resource = this.resourceDao.findEntity("from Resource r where r.haveSwf=0");
        return resource;
    }

}
