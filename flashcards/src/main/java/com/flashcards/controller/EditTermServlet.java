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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/edit-term")
public class EditTermServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("course_id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String courseName = request.getParameter("title");
        String description = request.getParameter("description");
        String[] words = request.getParameterValues("word");
        String[] means = request.getParameterValues("mean");
        List<Card> cards = CardDAO.loadListCardByCourseId(id);
        List<String> oldWords = new ArrayList<>();
        for(Card c: cards){
            oldWords.add(c.getTerm());
        }
        List<String> oldMeans = new ArrayList<>();
        for(Card c: cards){
            oldMeans.add(c.getMeaning());
        }
//        boolean isUpdate = CourseDAO.updateCourse(courseName, description, id);
//        System.out.println("isUpdate trong EditTerm: " + isUpdate);

            if(words != null && means != null){
                for(int i=0; i< words.length; i++){
                   if(oldWords.contains(words[i])){
                       boolean isUpdateCard = CardDAO.updateCardByTerm(means[i],words[i]);
                   } else if(oldMeans.contains(means[i])){
                       boolean isUpdateCard = CardDAO.updateCardByMean(words[i],means[i]);
                   } else{
                       boolean isInsert = CardDAO.insertCard(words[i],means[i],null,id, user.getId());
                   }
                }
                request.getRequestDispatcher("detail-term?course_id="+id);
            }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
