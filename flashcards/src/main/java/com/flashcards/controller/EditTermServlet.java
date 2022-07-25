package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Card;
import com.flashcards.model.Course;
import com.flashcards.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/edit-term")
public class EditTermServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("course_id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        boolean isDeleteCard = CardDAO.deleteCardByCourseId(id);
        String courseName = request.getParameter("title");
        String description = request.getParameter("description");
        String[] words = request.getParameterValues("word");
        String[] means = request.getParameterValues("mean");
        boolean isUpdate = CourseDAO.updateCourse(courseName, description,id);

        if(isUpdate) {
            System.out.println("Sửa học phần thành công");
            if (words != null && means != null) {
                System.out.println("Kiểm tra words và means != null");
                int count = 0;
                for (int i = 0; i < words.length; i++) {
                    if (CardDAO.insertCard(words[i], means[i], null, id, user.getId())) {
                        count++;
                    }
                }
                if (count == words.length) {
                    // nếu đúng thì chuyển sang trang chi tiết
                    Course course = CourseDAO.loadCourseById(id);
                    List<Card> cards = CardDAO.loadListCardByCourseId(id);
                    request.setAttribute("course", course);
                    request.setAttribute("cards", cards);
                    System.out.println(course);
                    System.out.println(cards.get(0));
                    request.getRequestDispatcher("term_details.jsp").forward(request, response);
                }
            } else {
                System.out.println("word hoac mean la null");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
