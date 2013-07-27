package com.bupt.pcncad.service.comment;

import com.bupt.pcncad.dao.comment.IResourceCommentDao;
import com.bupt.pcncad.dao.resource.IResourceDao;
import com.bupt.pcncad.domain.Resource;
import com.bupt.pcncad.domain.ResourceComment;
import com.bupt.pcncad.domain.User;
import com.bupt.pcncad.webContext.WebContextThreadLocal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-20
 * Time: 下午5:30
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ResourceCommentServiceImpl  implements IResourceCommentService{

    @Autowired
    private IResourceCommentDao resourceCommentDao;
    @Autowired
    private IResourceDao resourceDao;

    @Override
    public List<ResourceComment> getCommentsByResourceId(String resourceId) throws Exception {
        List<ResourceComment> list = this.resourceCommentDao.find("from ResourceComment r where r.resource.id=?",resourceId);
        return list;
    }

    @Override
    public void saveComment(String resourceId,String content) throws Exception {
        ResourceComment resourceComment = new ResourceComment();
        Resource resource = this.resourceDao.load(resourceId);
        User user = WebContextThreadLocal.getCurrentUser();
        resourceComment.setPubUser(user);
        resourceComment.setResource(resource);
        resourceComment.setPubDate(new Date());
        resourceComment.setContent(content);
        this.resourceCommentDao.save(resourceComment);
        //To change body of implemented methods use File | Settings | File Templates.
    }
}

