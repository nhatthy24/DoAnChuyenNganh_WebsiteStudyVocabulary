package com.flashcards.until;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UploadFile {
    public static Iterator<FileItem> uploadFile(HttpServletRequest request, HttpServletResponse response) {
        int maxMemSize = 1024 * 1024;//1MB
        int maxFileSize = 1024 * 1024;
        List<String> imgUrls = new ArrayList<String>();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {

        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        Iterator<FileItem> i = null;
        try {
            // Parse the request to get file items.
            List<FileItem> fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            i = fileItems.iterator();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return i;
    }

    public static String getUrlFileFromUpload(FileItem fi, String name, String url) {
        File file;
        System.out.println(fi==null?false:true);
        // Get the uploaded file parameters
        String fieldName = fi.getFieldName();
        String fileName = fi.getName();
        String contentType = fi.getContentType();
        boolean isInMemory = fi.isInMemory();
        long sizeInBytes = fi.getSize();
        String ext;
        // Write the file
        name=name.replaceAll("\\?|!|\\.|,","");
        String fileNameSave = name;
        if (fileName.lastIndexOf(".") >= 0 && !fileName.isEmpty()) {
            ext = fileName.substring(fileName.lastIndexOf("."));
        } else {
            return null;
        }

        fileNameSave += ext;
        File folder= new File("..\\webapps\\thegioidochoi.vn/" + url);
        if(!folder.exists()) folder.mkdirs();
        file = new File("..\\webapps\\thegioidochoi.vn/" + url + "/" + fileNameSave);
//                    System.out.println(file.getCanonicalFile());
        try {
            fi.write(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
//                    out.println("Uploaded Filename: " + fileName + "<br>");
        return url + "/" + fileNameSave;
    }
}
