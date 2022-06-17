package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.dao.database.connection.UserDaoForSetting;
import com.flashcards.model.Card;
import com.flashcards.model.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

@WebServlet(urlPatterns = "/forgetpass")
public class ForgetPassDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName=request.getParameter("user_name");
        String email=request.getParameter("email");
        boolean result=false;
        if(userName!=null&&email!=null){
            String generatePass=UserDaoForSetting.generatePassword(8);

            //sending mail start
            // Recipient's email ID needs to be mentioned.
            String to =email;

            // Sender's email ID needs to be mentioned
            String from = "trinhtien6236@gmail.com";

            // Assuming you are sending email from through gmails smtp
            String host = "smtp.gmail.com";

            // Get system properties
            Properties properties = System.getProperties();

            // Setup mail server
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "465");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.auth", "true");

            // Get the Session object.// and pass username and password
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                protected PasswordAuthentication getPasswordAuthentication() {
                    //use this email for temporary
                    return new PasswordAuthentication("trinhtien6236@gmail.com", "ftnobneiwiizgjwh");

                }

            });

            // Used to debug SMTP issues
            session.setDebug(true);

            try {
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session);

                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));

                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                // Set Subject: header field
                message.setSubject("Update your password");

                // Now set the actual message
                message.setText("Hello "+userName+", "+"Your new password is:"+ generatePass);

                System.out.println("sending...");
                // Send message
                Transport.send(message);
                System.out.println("Sent message successfully....");
            } catch (MessagingException mex) {
                mex.printStackTrace();
            }
            //end
            User user=UserDaoForSetting.loadUserByEmailAddress(email);
            result=UserDaoForSetting.updatePassWord(user.getId(),generatePass);

            if(result){
                request.getRequestDispatcher("reset_pass_successfully.jsp").forward(request,response);
            }else {
                System.out.println("userName and email"+userName+"/"+email);
                request.getRequestDispatcher("reset_pass_faild.jsp").forward(request,response);
            }
        } else {
            System.out.println("userName and email"+userName+"/"+email);
            request.getRequestDispatcher("reset_pass.jsp").forward(request,response);


    }
    }
}
