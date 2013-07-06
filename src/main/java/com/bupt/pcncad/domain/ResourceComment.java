package com.bupt.pcncad.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-13
 * Time: 上午10:27
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "RESOURCE_COMMENT")
@JsonIgnoreProperties({"pubUser","resource"})
public class ResourceComment implements Serializable {

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;
    @Column(name = "content")
    private String content;
    @ManyToOne(cascade = {CascadeType.DETACH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "pub_user_id")
    private User pubUser;
    @ManyToOne(cascade = {CascadeType.DETACH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "resource_id")
    private Resource resource;
    @Column(name = "pub_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date pubDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPubDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(pubDate);
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }

    public User getPubUser() {
        return pubUser;
    }

    public void setPubUser(User pubUser) {
        this.pubUser = pubUser;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }
}
