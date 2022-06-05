package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(urlPatterns = "/created-card")
public class CreateCardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] words = request.getParameterValues("word");
        String[] means = request.getParameterValues("mean");

        System.out.println("In do post of Create card servlet");
        Part file = request.getPart("image");

        String imageFileName = file.getSubmittedFileName(); // get selected image file name
        System.out.println("Selected image file name: " + imageFileName);

        String uploadPath = "D:\\Study\\Special Project\\github\\DoAnChuyenNganh_WebsiteStudyVocabulary\\flashcards\\src\\main\\webapp\\uploads\\"
                + imageFileName; // upload path where we have to upload our actual image

        // Uploading our selected image into the images folder
        try
        {
            FileOutputStream fos=new FileOutputStream(uploadPath);
            InputStream is=file.getInputStream();

            byte[] data=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        boolean isInsert = CardDAO.insertCard("Agree", "Đồng ý", imageFileName,12345, 1);
        if(isInsert){
            request.getRequestDispatcher("index.jsp").forward(request,response);
            System.out.println("Them anh thanh cong");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
