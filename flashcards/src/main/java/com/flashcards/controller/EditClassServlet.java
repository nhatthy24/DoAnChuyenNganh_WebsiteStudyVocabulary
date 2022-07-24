package com.flashcards.controller;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Classroom;
import com.flashcards.model.Folder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/edit-class")
public class EditClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int class_id = Integer.parseInt(request.getParameter("cid"));
        String className = request.getParameter("cname");
        String classDescription = request.getParameter("cdescription");
        String schoolName = request.getParameter("schoolname");
        boolean isUpdate = ClassroomDAO.updateClassroom(className,classDescription,schoolName,class_id);
        if(isUpdate){
            Classroom classroom = ClassroomDAO.loadClassById(class_id);
            request.setAttribute("title", "Thư mục");
            request.setAttribute("folder",classroom);
            response.sendRedirect("library-class?class_id="+class_id);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
