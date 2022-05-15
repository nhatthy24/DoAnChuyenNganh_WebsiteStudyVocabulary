package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Card;
import com.flashcards.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/created-term")
public class CreateTermServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("title", "Tạo học phần");
        String courseName = req.getParameter("title");
        String description = req.getParameter("description");
        String[] words = req.getParameterValues("word");
        String[] means = req.getParameterValues("mean");
        boolean isInsert = CourseDAO.insertCourse(courseName, description, 1);
        if(isInsert){
            System.out.println("Tạo học phần thành công");
            if(words != null && means != null){
                System.out.println("Kiểm tra words và means != null");
                int count=0;
                int courseId= CourseDAO.loadCourseId();
                for(int i=0; i< words.length; i++){
                    if(CardDAO.insertCard(words[i],means[i],null,courseId, 1 )){
                        count++;
                    }
                }
                if(count == words.length){
                  // nếu đúng thì chuyển sang trang chi tiết
                    // load dữ liệu trang chi tiết
                    Course course = CourseDAO.loadCourseById(CourseDAO.loadCourseId());
                    List<Card> cards = CardDAO.loadListCardByCourseId(CourseDAO.loadCourseId());
                    req.setAttribute("course", course);
                    req.setAttribute("cards", cards);
                    System.out.println(course);
                    System.out.println(cards.get(0));
                    req.getRequestDispatcher("term_details.jsp").forward(req,resp);
                }
            }
        } else{
            System.out.println("Chưa tạo thành công");
            req.getRequestDispatcher("create_term.jsp").forward(req,resp);
        }
    }
}
