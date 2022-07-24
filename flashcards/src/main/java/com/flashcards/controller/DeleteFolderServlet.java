package com.flashcards.controller;

import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Folder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/delete-folder")
public class DeleteFolderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("folder_id"));
        Folder folder = FolderDAO.loadFolderById(id);
        boolean isDelete=false;
        if(folder.getCourseList().size()==0){
            isDelete = FolderDAO.deleteFolder(id);
        } else {
            boolean isDeleteHasCourse = FolderDAO.deleteFolderHasCourse(id);
            if(isDeleteHasCourse){
                isDelete = FolderDAO.deleteFolder(id);
            }
        }
        if(isDelete){
            request.getRequestDispatcher("home").forward(request, response);
        }

    }
}
