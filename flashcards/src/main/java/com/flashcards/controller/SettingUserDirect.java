package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.dao.database.connection.UserDaoForSetting;
import com.flashcards.model.Card;
import com.flashcards.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/settinguser")
public class SettingUserDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        HttpSession session_user = request.getSession();
        User user_session=(User)session_user.getAttribute("user");
        int user_id_session=user_session.getId();
        System.out.println("User id cua session hien tai la"+user_session.getId());
        if(type!=null){
            if(type.equalsIgnoreCase("avatar")){
                String avatarUpdate = request.getParameter("avatarupdate");
                UserDaoForSetting.updateAvartar(user_id_session,avatarUpdate);
            }
            if(type.equalsIgnoreCase("delete")){
                UserDaoForSetting.deleteUser(3);
            }


        }
        String userNameUpdate = request.getParameter("usernameupdate");
        if(userNameUpdate!=null&&!userNameUpdate.equalsIgnoreCase("")){
            UserDaoForSetting.updateUserName(user_id_session,userNameUpdate);
        }
        String emailUpdate = request.getParameter("emailupdate");
        if(emailUpdate!=null&&!emailUpdate.equalsIgnoreCase("")){
            UserDaoForSetting.updateEmail(user_id_session,emailUpdate);
        }
        String roleIdUpdate = request.getParameter("roleidupdate");
        if(roleIdUpdate!=null){
            UserDaoForSetting.updateRoleId(user_id_session,roleIdUpdate);
        }
        User user= UserDaoForSetting.loadUserById(user_id_session);
        request.setAttribute("user", user);
        int role_id=Integer.parseInt(user.getRole());
        request.setAttribute("role_id", role_id);
        request.getRequestDispatcher("setting_user.jsp").forward(request, response);
    }
}
