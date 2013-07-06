package com.bupt.pcncad.service.comment;

import com.bupt.pcncad.domain.ResourceComment;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-20
 * Time: 下午5:27
 * To change this template use File | Settings | File Templates.
 */
public interface IResourceCommentService {

    public List<ResourceComment> getCommentsByResourceId(String resourceId) throws Exception;

    public void saveComment(String resourceId,String content)throws Exception;
}
