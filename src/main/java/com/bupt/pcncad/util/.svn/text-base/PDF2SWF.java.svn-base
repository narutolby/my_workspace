package com.bupt.pcncad.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created with IntelliJ IDEA.
 * User: zhang
 * Date: 13-7-15
 * Time: 下午5:29
 * To change this template use File | Settings | File Templates.
 */
public class PDF2SWF {
    public static int pdf2SWF(String sourceFile, String destFile) {

        File dest = new File(destFile);
        if (!dest.getParentFile().exists())
            dest.getParentFile().mkdirs();

        File source = new File(sourceFile);
        if (!source.exists())
            return -1;

        try {
            //String command = "/usr/local/swftools/bin/pdf2swf" +" \""+sourceFile+"\" -o "+destFile+" -T 9 -f -p 1-10";
            //String command = "C:\\Program Files\\SWFTools\\pdf2swf.exe" +" \""+sourceFile+"\" -o "+destFile+" -T 9 -f -p 1-10";
            String command = "/usr/local/swftools/bin/pdf2swf" +" \""+sourceFile+"\" -o "+destFile+" -T 9 -f -p 1-10";
            Process pro = Runtime.getRuntime().exec(command);

            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(pro.getInputStream()));
            while (bufferedReader.readLine() != null);
            pro.waitFor();
            System.out.println("----------pdf2swf is ok--------------");
            return pro.exitValue();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return 1;
    }
}
