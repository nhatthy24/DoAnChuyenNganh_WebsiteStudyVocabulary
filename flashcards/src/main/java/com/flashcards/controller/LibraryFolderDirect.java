package com.flashcards.controller;

import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/library-folder")
public class LibraryFolderDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("folder_id"));
        request.setAttribute("title", "Thư mục");
        Folder folder = FolderDAO.loadFolderById(id);
        List<Course> courses = folder.getCourseList();
        request.setAttribute("folder", folder);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("library_folder.jsp").forward(request, response);

    }
}
