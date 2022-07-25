package com.flashcards.dao.database.connection;

import com.flashcards.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.flashcards.dao.database.connection.*;

public class UserDAO implements ObjectDAO {


    public boolean checkEmailExists(String email) {
        String sql = "SELECT * FROM user u WHERE email=?";
        try {
            PreparedStatement ps = DBCPDataSource.preparedStatement(sql);
            ps.setString(1, email);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean checkUsernameExists(String username) {
        String sql = "SELECT * FROM user u WHERE name=?";
        try {
            PreparedStatement ps = DBCPDataSource.preparedStatement(sql);
            ps.setString(1, username);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static User loadUserById(int creatorId) {
        User user = new User();
        String sql = "SELECT `Name`, Avatar FROM `user` WHERE UserID=?";
        try {
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, creatorId);
            synchronized (preparedStatement) {
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    user.setUsername(resultSet.getString(1));
                    user.setAvatar(resultSet.getString(2));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    // them tai khoan
    @Override
    public boolean addAccount(Object obj) {
        User kh = (User) obj;
        try {
            new DBCPDataSource().thucThiSQL("insert into user values('" + kh.getId() + "','" + kh.getPassword() + "','"
                    + kh.getEmail() + "','" + kh.getDate() + "','" + kh.getRole() + "','" + kh.getUsername() + "','')");
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    // lay thong tin tai khoan
    public User getAccountInformation(String username) {
        try {
            ResultSet rs = new DBCPDataSource().chonDuLieu("select * from user where Name='" + username + "'");
            while (rs.next()) {
                int id = rs.getInt(1);
                String pass = rs.getString(2);
                String email = rs.getString(3);
                String date = rs.getString(4);
                String role = rs.getString(5);
                String name = rs.getString(6);
                String avatar = rs.getString(7);
                return new User(id, pass, email, date, role, name, avatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return null;

    }

    public User getAccountInformationByEmail(String em) {
        try {
            ResultSet rs = new DBCPDataSource().chonDuLieu("select * from user where email='" + em + "'");
            while (rs.next()) {
                int id = rs.getInt(1);
                String pass = rs.getString(2);
                String email = rs.getString(3);
                String date = rs.getString(4);
                String role = rs.getString(5);
                String name = rs.getString(6);
                String avatar = rs.getString(7);
                return new User(id, pass, email, date, role, name, avatar);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return null;

    }


    // kiem tra dang nhap
    @Override
    public boolean checkLogIn(String username, String email, String pass) {
        try {
            ResultSet rs = new DBCPDataSource().chonDuLieu("select * from user where Password='" + pass + "'");
            while (rs.next()) {
                if (rs.getString(6).equals(username) && rs.getString(2).equals(pass)) {
                    return true;
                }
                if (rs.getString(2).equals(pass) && rs.getString(3).equals(email)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return false;
    }

    public  boolean checkLoginEmail(String email, String pass){
        String sql = "SELECT * FROM user u WHERE email=? AND password=?";
        try {
            PreparedStatement ps = DBCPDataSource.preparedStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public  boolean checkLoginUsername(String username, String pass){
        String sql = "SELECT * FROM user u WHERE name=? AND password=?";
        try {
            PreparedStatement ps = DBCPDataSource.preparedStatement(sql);
            ps.setString(1, username);
            ps.setString(2, pass);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
//        System.out.println(checkLoginEmail("dukhanh2k@gmail.com", "dukhanh00"));
//		System.out.println(new UserDAO().addAccount(kh));
//		System.out.println(new UserDAO().checkLogIn("Quoc", "huynhaiquoc@gmail.com", "123456789"));
//		System.out.println(new UserDAO().getAccountInformation("Quoc"));
    }

}
