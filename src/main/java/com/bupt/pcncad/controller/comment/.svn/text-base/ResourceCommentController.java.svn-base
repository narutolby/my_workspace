package com.bupt.pcncad.controller.comment;

import com.bupt.pcncad.dao.resource.IResourceDao;
import com.bupt.pcncad.domain.Resource;
import com.bupt.pcncad.domain.ResourceComment;
import com.bupt.pcncad.domain.User;
import com.bupt.pcncad.service.comment.IResourceCommentService;
import com.bupt.pcncad.service.resource.IResourceOperationService;
import com.bupt.pcncad.webContext.WebContextThreadLocal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-20
 * Time: 下午5:16
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "/r_comm")
public class ResourceCommentController {

    @Autowired
    private IResourceCommentService resourceCommentService;

    @RequestMapping(value = "/get_comments")
    public void getCommentsByResourceId(@RequestParam(value = "resource_id") String resourceId, ModelMap modelMap) throws Exception {
        modelMap.put("comments", this.resourceCommentService.getCommentsByResourceId(resourceId));

    }


    @RequestMapping(value = "/save_comment")
    public void saveComment(@RequestParam(value = "comment") String comment, @RequestParam(value = "resource_id") String resourceId, ModelMap modelMap) throws Exception {
        this.resourceCommentService.saveComment(resourceId, comment);
        modelMap.put("comments", this.resourceCommentService.getCommentsByResourceId(resourceId));
    }

}

