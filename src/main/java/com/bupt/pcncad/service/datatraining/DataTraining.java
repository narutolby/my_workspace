package com.bupt.pcncad.service.datatraining;

import jeasy.analysis.MMAnalyzer;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenStream;
import org.pdfbox.pdmodel.PDDocument;
import org.pdfbox.util.PDFTextStripper;
import org.textmining.text.extraction.WordExtractor;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: naruto
 * Date: 13-6-23
 * Time: 下午3:52
 * To change this template use File | Settings | File Templates.
 */
public class DataTraining {

    private static Map<String, Integer> dfMap = new HashMap<String, Integer>();
    private static int count = 17911;

    public static void trainingData(File directory) throws Exception {
        if (directory.isDirectory()) {
            File[] listFile = directory.listFiles();
            for (File tmpFile : listFile) {
                if (tmpFile.isDirectory()) {
                    trainingData(tmpFile);
                } else {
                    trainingDataFromSingleFile(tmpFile);
                }
            }
        }
    }

    public static String[] extractiongkeyWordsFromInputFile(File file) throws Exception {
        File ylfile = new File("trainingData", "out.txt");
        BufferedReader br1 = new BufferedReader(new InputStreamReader(new FileInputStream(ylfile)));
        String line1 = null;
        while ((line1 = br1.readLine()) != null) {
            String[] key_value = line1.split("\\|&\\|");
            String key = key_value[0].trim();
            int value = Integer.valueOf(key_value[1].trim());
            dfMap.put(key, value);
        }
        br1.close();
        Map<String, Double> map = new HashMap<String, Double>();
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "GBK"));
        MMAnalyzer mmAnalyzer = new MMAnalyzer();
        String line = null;
        while ((line = br.readLine()) != null) {
            TokenStream tokenStream = mmAnalyzer.tokenStream("", new StringReader(line.trim()));
            for (Token t = tokenStream.next(); t != null; t = tokenStream.next()) {
                String key = t.termText();
                if (map.get(key) == null) {
                    map.put(key, 1.0);
                } else {
                    map.put(key, map.get(key).doubleValue() + 1);
                }
            }
        }
        List<MyEntry> list = new ArrayList<MyEntry>();
        for (Map.Entry<String, Double> entry : map.entrySet()) {
            String key = entry.getKey();
            int df = dfMap.get(key)==null ? 0 : dfMap.get(key);
            Double value = entry.getValue() * Math.log(count / (df + 1));
            map.put(key, value);
            list.add(new MyEntry(key, value));
        }
        Collections.sort(list);
        int sum = 0;
        for (MyEntry myEntry : list) {
            sum++;
            System.out.println(myEntry.getKey() + " : " + myEntry.getValue());
            if (sum > 30) {
                break;
            }
        }
        return null;
    }

    private static class MyEntry implements Map.Entry<String, Double>, Comparable<MyEntry> {

        private String key;
        private Double value;

        MyEntry(String key, Double value) {
            this.key = key;
            this.value = value;
        }

        @Override
        public String getKey() {
            return this.key;
        }

        @Override
        public Double getValue() {
            return this.value;
        }

        @Override
        public Double setValue(Double value) {
            this.value = value;
            return value;
        }

        public void setKey(String key) {
            this.key = key;
        }

        @Override
        public int compareTo(MyEntry o) {
            if (this.getValue() > o.getValue()) {
                return -1;
            } else {
                return 1;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        //File file = new File("trainingData");
        //File file = new File("trainingData/C000008");
        //File file1 = new File(file, "33.txt");
        //extractiongkeyWordsFromInputFile(file1);
        /* DataTraining.trainingData(file);
        File outFile = new File(file, "out.txt");
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
        for (Map.Entry<String, Integer> entry : dfMap.entrySet()) {
            bw.write(entry.getKey() + " |&| " + entry.getValue());
            bw.newLine();
        }
        bw.close();
        System.out.println(count);*/
        //trainingDataFromPdfFile("tmp/linux1.pdf");
        extractiongkeyWordsFromInputFile(trainingDataFromWordFile("tmp/1.doc"));
    }

    private static void trainingDataFromSingleFile(File file) throws Exception {
        Map<String, Integer> tmpMap = new HashMap<String, Integer>();
        MMAnalyzer mmAnalyzer = new MMAnalyzer();
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "GBK"));
        String line = null;
        System.out.println(file.getAbsolutePath());
        while ((line = br.readLine()) != null) {
            TokenStream tokenStream = mmAnalyzer.tokenStream("", new StringReader(line.trim()));
            for (Token t = tokenStream.next(); t != null; t = tokenStream.next()) {
                String termText = t.termText();
                if (tmpMap.get(termText) == null) {
                    tmpMap.put(termText, 1);
                }
            }

        }
        for (Map.Entry<String, Integer> entry : tmpMap.entrySet()) {
            String key = entry.getKey();
            if (dfMap.get(key) == null) {
                dfMap.put(key, 1);
            } else {
                dfMap.put(key, dfMap.get(key).intValue() + 1);
            }
        }
        br.close();
    }

    public static File trainingDataFromPdfFile(String file)throws Exception{
        boolean sort = false;
        String pdfFile = file;
        String textFile = null;
        String encoding = "GBK";
        int startPage = 1;
        int endPage = Integer.MAX_VALUE;
        Writer output = null;
        PDDocument document = null;
        File outputFile = null;
        try {
            try {
                URL url = new URL("file:"+pdfFile);
                document = PDDocument.load(url);
                String fileName = url.getFile();
                if (fileName.length() > 4) {
                    outputFile = new File(fileName.substring(0, fileName
                            .length() - 4)
                            + ".txt");
                }
            } catch (MalformedURLException e) {
                document = PDDocument.load(pdfFile);
                if (pdfFile.length() > 4) {
                    textFile = pdfFile.substring(0, pdfFile.length() - 4)
                            + ".txt";
                }
            }
            output = new OutputStreamWriter(new FileOutputStream(outputFile),
                    encoding);
            PDFTextStripper stripper = null;
            stripper = new PDFTextStripper();
            stripper.setSortByPosition(sort);
            stripper.setStartPage(startPage);
            stripper.setEndPage(endPage);
            stripper.writeText(document, output);
            return outputFile;
        } finally {
            if (output != null) {
                output.close();
            }
            if (document != null) {
                document.close();
            }
        }
    }

    public static File trainingDataFromWordFile(String path)throws Exception{
        String encoding = "GBK";
        File wordFile = new File(path);
        FileInputStream in = new FileInputStream(wordFile);
        WordExtractor extractor = null;
        String fileName = wordFile.getAbsolutePath();
        File outputFile = new File(fileName.substring(0, fileName
                .length() - 4)
                + ".txt");
        extractor = new WordExtractor();
        String text = extractor.extractText(in);
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outputFile),encoding));
        bw.write(text);
        bw.close();
        return outputFile;
    }

    public static File trainingDataFromPptFile(String path){
      /*  StringBuilder sb = new StringBuilder();
        SlideShow ppt = new SlideShow(new HSLFSlideShow(file));
        Slide[] slides = ppt.getSlides();
//提取文本信息
        for (Slide each : slides) {
            TextRun[] textRuns = each.getTextRuns();
            for (int i=0 ;i< textRuns.length; i++ ) {
                RichTextRun[] richTextRuns = textRuns.getRichTextRuns();
                for (int j = 0; j < richTextRuns.length; j++) {
                    sb.append(richTextRuns[j].getText());
                }
                sb.append("\n");
            }
            sb.append("\n");
        }

        return sb.toString();*/
        return null;
    }
}
