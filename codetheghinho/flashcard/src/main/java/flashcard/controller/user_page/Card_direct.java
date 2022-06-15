package flashcard.controller.user_page;

import flashcard.model.card.Card;
import flashcard.model.card.Card_Con_DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/card_detail")
public class Card_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Card> cards=Card_Con_DB.getAllCard();
        request.setAttribute("count",cards.size());
        request.setAttribute("title","Thẻ ghi nhớ");
        request.setAttribute("cards", Card_Con_DB.getAllCard());
        request.getRequestDispatcher("user_page/card-detail.jsp").forward(request,response);
    }
}
