package com.flashcards.dao.database.connection;

import com.flashcards.model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
                    course.setCards(CardDAO.loadListCardByCourseId(id));
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
//        System.out.println(insertCourse(12546,"H???c ph???n 2", "M?? h???c ph???n 2", 1));
//        System.out.println(loadCourseById(123456));
//        System.out.println(loadCourseByCreatorId(1));
//        System.out.println(loadCourseInFolder(2));
//        System.out.println(loadCourseHome());
//        for (Course course:loadCourseHomeHasSearch("ew 2")){
//            System.out.println(course.getCourseName());
//        }
        System.out.println(updateCourse("Bussiness","Kinh doanh",17453));
    }

    public static List<Course> loadCourseByCreatorId(int user_id) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM course WHERE Creator=?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, user_id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Course course = new Course();
                    course.setId(resultSet.getInt(1));
                    course.setCourseName(resultSet.getString(2));
                    course.setDescription(resultSet.getString(3));
                    course.setCreatorId(resultSet.getInt(4));
                    course.setCards(CardDAO.loadListCardByCourseId(resultSet.getInt(1)));
                    course.setCreatorName(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                    courses.add(course);
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return courses;
    }
    public static List<Course> loadCourseHome() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM course";
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
                    Course course = new Course();
                    course.setId(resultSet.getInt(1));
                    course.setCourseName(resultSet.getString(2));
                    course.setDescription(resultSet.getString(3));
                    course.setCreatorId(resultSet.getInt(4));
                    course.setCards(CardDAO.loadListCardByCourseId(resultSet.getInt(1)));
                    course.setCreatorName(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                    courses.add(course);
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return courses;
    }
    public static List<Course> loadCourseHomeHasSearch(String title) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM course where Title LIKE "+"'%"+title+"%'";
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()){
                    Course course = new Course();
                    course.setId(resultSet.getInt(1));
                    course.setCourseName(resultSet.getString(2));
                    course.setDescription(resultSet.getString(3));
                    course.setCreatorId(resultSet.getInt(4));
                    course.setCards(CardDAO.loadListCardByCourseId(resultSet.getInt(1)));
                    course.setCreatorName(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                    courses.add(course);
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return courses;
    }


    public static List<Course> loadCourseInFolder(int id) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.CourseID, c.Title, c.Creator FROM course c JOIN course_in_folder cf ON c.CourseID=cf.Course WHERE cf.Folder=?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Course course = new Course();
                    course.setId(resultSet.getInt(1));
                    course.setCourseName(resultSet.getString(2));
                    course.setCreatorId(resultSet.getInt(3));
                    course.setCards(CardDAO.loadListCardByCourseId(resultSet.getInt(1)));
                    course.setCreatorName(UserDAO.loadUserById(resultSet.getInt(3)).getUsername());
                    courses.add(course);
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return courses;

    }
    public static List<Course> loadCourseInClass(int id) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.CourseID, c.Title, c.Creator FROM course c JOIN course_in_class CC on c.CourseID=CC.CourseID WHERE CC.ClassId=?";
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, id);
            synchronized (preparedStatement){
                ResultSet resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Course course = new Course();
                    course.setId(resultSet.getInt(1));
                    course.setCourseName(resultSet.getString(2));
                    course.setCreatorId(resultSet.getInt(3));
                    course.setCards(CardDAO.loadListCardByCourseId(resultSet.getInt(1)));
                    course.setCreatorName(UserDAO.loadUserById(resultSet.getInt(3)).getUsername());
                    courses.add(course);
                }
                resultSet.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return courses;

    }

    public static boolean deleteCourse(int courseId){
        String sql = "DELETE FROM course WHERE CourseID=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
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
    public static boolean deleteCourseInFolder(int courseId){
        String sql = "DELETE FROM course_in_folder WHERE Course=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
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
    public static boolean deleteCourseInClass(int courseId){
        String sql = "DELETE FROM course_in_class WHERE CourseId=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
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

    public static boolean updateCourse(String courseName, String description, int courseId) {
        String sql = "UPDATE course SET Title=?, Description=? WHERE CourseID=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, courseName);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, courseId);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
                update = 1;
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
