package com.bupt.pcncad.util;

import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: zhang
 * Date: 13-7-16
 * Time: 上午10:55
 * To change this template use File | Settings | File Templates.
 */
public class PDF2JPG {
    public void generateBookIamge(String inputFile, String outputFile) {
        Document document = null;

        try {
            float rotation = 0f;
            //缩略图显示倍数，1表示不缩放，0.5表示缩小到50%
            float zoom = 1f;

            document = new Document();
            document.setFile(inputFile);
            // maxPages = document.getPageTree().getNumberOfPages();

            BufferedImage image = (BufferedImage)document.getPageImage(0, GraphicsRenderingHints.SCREEN,
                    Page.BOUNDARY_CROPBOX, rotation, zoom);

            Iterator iter = ImageIO.getImageWritersBySuffix("jpg");
            ImageWriter writer = (ImageWriter)iter.next();

            FileOutputStream out = new FileOutputStream(new File(outputFile));
            ImageOutputStream outImage = ImageIO.createImageOutputStream(out);

            writer.setOutput(outImage);
            writer.write(new IIOImage(image, null, null));
            System.out.println("------------pdf2jpg is ok--------------");
        } catch(Exception e) {
//            log.warn("to generate thumbnail of a book fail : " + inputFile);
//            log.warn(e);
        }
    }
}
