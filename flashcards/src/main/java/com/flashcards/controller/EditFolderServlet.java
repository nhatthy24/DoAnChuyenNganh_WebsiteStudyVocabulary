package com.flashcards.controller;

import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Folder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/edit-folder")
public class EditFolderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int folder_id = Integer.parseInt(request.getParameter("fid"));
        String folderName = request.getParameter("fname");
        String folderDescription = request.getParameter("fdescription");
        boolean isUpdate = FolderDAO.updateFolder(folderName,folderDescription,folder_id);
        if(isUpdate){
            Folder folder = FolderDAO.loadFolderById(folder_id);
            request.setAttribute("title", "Thư mục");
            request.setAttribute("folder",folder);
            response.sendRedirect("library-folder?folder_id="+folder_id);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
