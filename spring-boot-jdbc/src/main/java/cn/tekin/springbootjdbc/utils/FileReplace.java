package cn.tekin.springbootjdbc.utils;

import java.io.*;

public class FileReplace {
    public static void main(String[] args) {
        String filePath = "D:/data_lf.sql";
        FileReplace processData = new FileReplace();
        processData.writeFile(filePath, processData.readFileContent(filePath));
    }

    public String readFileContent(String filePath) {
        BufferedReader br = null;
        String line = null;
        //保存修改过后的所有内容，不断增加
        StringBuffer bufAll = new StringBuffer();
        try {
            br = new BufferedReader(new FileReader(filePath));
            while ((line = br.readLine()) != null) {
                StringBuffer buf = new StringBuffer();
                //修改内容核心代码 替换空串，加入表名
                // 将INSERT INTO ` ` 替换为 INSERT INTO mydb
                if (line.startsWith("INSERT INTO")) {
                    buf.append(line);
                    buf.replace(12, 14, "mydb");
                    buf.append(System.getProperty("line.separator"));
                    bufAll.append(buf);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    br = null;
                }
            }
        }
        return bufAll.toString();
    }

    //写回文件
    public void writeFile(String filePath, String content) {
        BufferedWriter bw = null;

        try {
            bw = new BufferedWriter(new FileWriter(filePath));
            bw.write(content);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bw != null) {
                try {
                    bw.close();
                } catch (IOException e) {
                    bw = null;
                }
            }
        }
    }
}
