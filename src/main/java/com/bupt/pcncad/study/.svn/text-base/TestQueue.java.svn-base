package com.bupt.pcncad.study;

import com.sun.servicetag.SystemEnvironment;

import java.util.LinkedList;
import java.util.Queue;

/**
 * Created with IntelliJ IDEA.
 * User: liboyang01
 * Date: 12-9-30
 * Time: 下午1:13
 * To change this template use File | Settings | File Templates.
 */
public class TestQueue {
    public static void main(String[] args) {
        Queue<String> queue = new LinkedList<String>();
        queue.offer("Hello");
        queue.offer("World!");
        queue.offer("你好！");
        System.out.println(queue.size());
        String str;
        while((str=queue.poll())!=null){
            System.out.print(str);
        }
        System.out.println();
        System.out.println(queue.size());
        Queue q = new LinkedList();
        System.out.println(Integer.MAX_VALUE);
        System.out.println(Integer.MIN_VALUE);
        int i=  2147483647;
        int j = -2147483648;
        System.out.println(Integer.toBinaryString(i));
        System.out.println(Integer.toBinaryString(j));
    }
}
