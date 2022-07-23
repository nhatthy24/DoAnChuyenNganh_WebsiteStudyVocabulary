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

@WebServlet(urlPatterns = "/delete-class")
public class DeleteClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("class_id"));
        Classroom classroom = ClassroomDAO.loadClassById(id);
        boolean isDelete=false;
        if(classroom.getCourses()==null && classroom.getFolders()==null && classroom.getMembers().size()==1){
            isDelete = ClassroomDAO.deleteClassroom(id);
        }
        if(isDelete==true){
            request.getRequestDispatcher("home").forward(request, response);
        }

    }
}
