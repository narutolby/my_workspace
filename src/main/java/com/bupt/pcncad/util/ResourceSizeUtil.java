package com.bupt.pcncad.util;

import com.bupt.pcncad.domain.Resource;

/**
 * Created with IntelliJ IDEA.
 * User: zhang
 * Date: 13-6-15
 * Time: 上午10:35
 * To change this template use File | Settings | File Templates.
 */
public class ResourceSizeUtil {
    private String unit;
    private long size;
    private Resource resource;

    public ResourceSizeUtil(String unit,long size,Resource resource){
        this.unit = unit;
        this.size = size;
        this.resource = resource;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }
}
