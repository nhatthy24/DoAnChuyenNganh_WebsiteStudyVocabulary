package com.flashcards.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.model.Classroom;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;
import com.flashcards.model.User;
import com.flashcards.until.ValidEmail;

@WebServlet(urlPatterns = "/ProcessLogIn")
public class ProcessLogIn extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProcessLogIn() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String username = request.getParameter("username");
        String email = request.getParameter("username");
        String pass = request.getParameter("password");

        boolean isEmail = new ValidEmail().isValid(email);

        boolean isLogin = false;
        User kh = new User();

        if (isEmail) {
            isLogin = new UserDAO().checkLoginEmail(email, pass);
            kh = new UserDAO().getAccountInformationByEmail(email);
        } else {
            isLogin = new UserDAO().checkLoginUsername(email, pass);
            kh = new UserDAO().getAccountInformation(email);
        }

        // header thư viện của tôi
        List<Course> listcourses = CourseDAO.loadCourseByCreatorId(kh.getId());
        List<Folder> listfolders = FolderDAO.loadFolderByCreatorId(kh.getId());
        List<Classroom> listclassrooms = ClassroomDAO.loadClassByCreatorId(kh.getId());

        if (isLogin) {
            HttpSession session = request.getSession();
            session.setAttribute("user", kh);
            session.setAttribute("user_id", kh.getId());
            session.setAttribute("listcourses", listcourses);
            session.setAttribute("listfolders", listfolders);
            session.setAttribute("listclassrooms", listclassrooms);
//            response.sendRedirect("index.jsp");
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
