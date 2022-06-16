package com.flashcards.dao.database.connection;

import com.flashcards.model.Course;

import java.sql.*;

public class CourseDAO {
    public static boolean insertCourse(int courseId, String courseName, String description, int creator) {
        String sql = "INSERT INTO course(CourseID, Title, Description, Creator) VALUES (?,?,?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
            preparedStatement.setString(2, courseName);
            preparedStatement.setString(3, description);
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

    public static void main(String[] args) {
        System.out.println(insertCourse(12546,"Học phần 2", "Mã học phần 2", 1));
//        System.out.println(loadCourseById(123456));
    }
}
