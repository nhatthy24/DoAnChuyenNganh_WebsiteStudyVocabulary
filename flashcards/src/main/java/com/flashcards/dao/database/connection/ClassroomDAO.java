package com.flashcards.dao.database.connection;

import com.flashcards.model.Classroom;
import com.flashcards.model.Folder;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClassroomDAO {

    // Tạo lớp học
    public static boolean insertClassroom(String title, String description, String school, int creator){
        String sql = "INSERT class(Title,Description,School,Creator) VALUES (?, ?, ?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, school);
            preparedStatement.setInt(4, creator);
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

    // Sửa lớp học
    public static boolean updateClassroom(String title, String description, String school, int classID){
        String sql = "UPDATE class SET Title = ?, Description = ?, School = ? WHERE ClassID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, school);
            preparedStatement.setInt(4, classID);
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
    // Xóa lớp học
    public static boolean deleteClassroom(int classID){
        String sql = "DELETE FROM class WHERE ClassID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, classID);
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

    public static Classroom loadNewstClass() {
        Classroom classroom = new Classroom();
        String sql = "SELECT * FROM class ORDER BY ClassID DESC LIMIT 1";
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    classroom.setClassID(resultSet.getInt(1));
                    classroom.setTitle(resultSet.getString(2));
                    classroom.setDescription(resultSet.getString(3));
                    classroom.setSchool(resultSet.getString(4));
                    classroom.setCreator(UserDAO.loadUserById(resultSet.getInt(5)).getUsername());
                    classroom.addMembers(UserDAO.loadUserById(resultSet.getInt(5)));
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return classroom;
    }

    public static Classroom loadClassById(int class_id) {
        Classroom classroom = new Classroom();
        String sql = "SELECT * FROM class WHERE ClassID="+class_id;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    classroom.setClassID(resultSet.getInt(1));
                    classroom.setTitle(resultSet.getString(2));
                    classroom.setDescription(resultSet.getString(3));
                    classroom.setSchool(resultSet.getString(4));
                    classroom.setCreator(UserDAO.loadUserById(resultSet.getInt(5)).getUsername());
                    classroom.addMembers(UserDAO.loadUserById(resultSet.getInt(5)));
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return classroom;
    }
    public static List<Classroom> loadClassByCreatorId(int user_id) {
        List<Classroom> classrooms = new ArrayList<>();
        String sql = "SELECT * FROM class WHERE Creator="+user_id;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    Classroom classroom = new Classroom();
                    classroom.setClassID(resultSet.getInt(1));
                    classroom.setTitle(resultSet.getString(2));
                    classroom.setDescription(resultSet.getString(3));
                    classroom.setSchool(resultSet.getString(4));
                    classroom.setCreator(UserDAO.loadUserById(resultSet.getInt(5)).getUsername());
                    classrooms.add(classroom);
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return classrooms;
    }
    public static void main(String[] args) {
        System.out.println(deleteClassroom(1));
    }
}
