package com.flashcards.controller;

import com.flashcards.dao.database.connection.FolderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/create-folder")
public class CreateFolderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");
        System.out.println("user id: " + user_id);
        String folderName = request.getParameter("fname");
        String folderDescription = request.getParameter("fdescription");
        boolean isCreate = FolderDAO.insertFolder(folderName, folderDescription, user_id);
        if(isCreate){
            System.out.println("Đã tạo học phần thành công");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
