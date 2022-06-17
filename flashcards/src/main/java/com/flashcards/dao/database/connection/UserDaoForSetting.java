package com.flashcards.dao.database.connection;

import com.flashcards.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class UserDaoForSetting {
    public static User loadUserById(int id) {
        User user = new User();
        String sql = "SELECT * FROM user WHERE UserID=?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    user.setId(id);
                    user.setPassword(resultSet.getString(2));
                    user.setEmail(resultSet.getString(3));
                    user.setDate(resultSet.getString(4));
                    user.setRole(resultSet.getString(5));
                    user.setUsername(resultSet.getString(6));
                    user.setAvatar(resultSet.getString(7));

                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }
    public static boolean  updateUserName(int userID,String userName){
        String sql = "UPDATE user SET name = ? WHERE userID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, userName);
            preparedStatement.setInt(2, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean  updateAvartar(int userID,String avatar){
        String sql = "UPDATE user SET avatar = ? WHERE userID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, avatar);
            preparedStatement.setInt(2, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean  updateEmail(int userID,String email){
        String sql = "UPDATE user SET email = ? WHERE userID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setInt(2, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean  updateRoleId(int userID,String roleId){
        String sql = "UPDATE user SET role = ? WHERE userID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, roleId);
            preparedStatement.setInt(2, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean  updatePassWord(int userID,String password){
        String sql = "UPDATE user SET password = ? WHERE userID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static boolean deleteUser(int userID) {
        String sql = "DELETE FROM user WHERE userid=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, userID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public static String generatePassword(int length) {
        String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String specialCharacters = "!@#$";
        String numbers = "1234567890";
        String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
        Random random = new Random();
        char[] password = new char[length];

        password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
        password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
        password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
        password[3] = numbers.charAt(random.nextInt(numbers.length()));
        String   result="";
        for(int i = 4; i< length ; i++) {
            password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
        }
        for(int i = 0; i< length ; i++) {
            result+=password[i];
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(loadUserById(1).toString());
//        updateUserName(1,"username");
//        updateAvartar(1,"link avatar");
//        updateEmail(1,"user email");
//        updateRoleId(1,"1");
//        updatePassWord(2,"sdfljaf");
//        System.out.println(generatePassword(8));
    }
}
