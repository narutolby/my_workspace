package com.bupt.pcncad.dao.comment;

import com.bupt.pcncad.dao.HibernateGenericDaoImpl;
import com.bupt.pcncad.dao.IHibernateGenericDao;
import com.bupt.pcncad.domain.ResourceComment;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-20
 * Time: 下午10:24
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class ResourceCommentDaoImpl extends HibernateGenericDaoImpl<ResourceComment, String> implements IResourceCommentDao{
}
