package com.flashcards.dao.database.connection;

import com.flashcards.model.Course;

import java.sql.*;

public class CourseDAO {
    public static boolean insertCourse(String courseName, String description, int creator) {
        String sql = "INSERT INTO course(Title,Description,Creator) VALUES (?,?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, courseName);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, creator);
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

    public static void main(String[] args) {
//        insertCourse("Học phần 2", "Mô tả học phần 2", 1);
        System.out.println(loadCourseId());
    }

    public static int loadCourseId() {
        int id = 0;
        String sql = "SELECT CourseID \n" +
                "FROM Course \n" +
                "ORDER BY CourseID DESC\n" +
                "LIMIT 1";
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet rs = statement.executeQuery(sql);
                if(rs.next()){
                    id = rs.getInt(1);
                }
                rs.close();
            }
            statement.close();
            return id;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return id;
    }

    public static Course loadCourseById(int id) {
        Course course = new Course();
        String sql = "SELECT * FROM course WHERE CourseID=?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    course.setId(id);
                    course.setCourseName(resultSet.getString(2));
                    course.setDescription(resultSet.getString(3));
                    course.setCreatorId(resultSet.getInt(4));
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return course;
    }
}
