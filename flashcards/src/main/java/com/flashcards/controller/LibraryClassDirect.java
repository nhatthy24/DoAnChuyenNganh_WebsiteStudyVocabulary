package com.flashcards.controller;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Classroom;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;
import com.flashcards.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/library-class")
public class LibraryClassDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("class_id"));
        request.setAttribute("title", "Lớp");
        Classroom classroom = ClassroomDAO.loadClassById(id);
//        List<Course> courses = classroom.getCourses();
//        List<Folder> folders = classroom.getFolders();
//        List<User> members = classroom.getMembers();
        request.setAttribute("classroom", classroom);
//        request.setAttribute("courses", courses);
        request.getRequestDispatcher("library_class.jsp").forward(request, response);

    }
}
