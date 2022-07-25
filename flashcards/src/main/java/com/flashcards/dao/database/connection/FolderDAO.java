package com.flashcards.dao.database.connection;

import com.flashcards.model.Folder;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FolderDAO {

    // tạo thư mục
    public static boolean insertFolder(String title, String description, int creator){
        String sql = "INSERT folder(Title,Description,Creator) VALUES (?, ?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
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

    // sửa thư mục
    public static boolean updateFolder(String title, String description, int folderID){
        String sql = "UPDATE folder SET Title = ?, Description = ? WHERE FolderID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, folderID);
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

    // xóa thư mục
    public static boolean deleteFolder(int folderID){
        String sql = "DELETE FROM folder WHERE FolderID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, folderID);
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
    // xóa thư mục có học phần
    public static boolean deleteFolderHasCourse(int folderID){
        String sql = "DELETE FROM course_in_folder WHERE folder=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, folderID);
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

    // load thư mục mới nhất
    public static Folder loadNewestFolder() {
        String sql = "SELECT * FROM folder ORDER BY FolderID DESC LIMIT 1";
        Folder folder = new Folder();
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    folder.setFolderId(resultSet.getInt(1));
                    folder.setTitle(resultSet.getString(2));
                    folder.setDescription(resultSet.getString(3));
                    folder.setCreatorID(resultSet.getInt(4));
                    folder.setCreator(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return folder;
    }

    // load thư mục từ id của thư mục
    public static Folder loadFolderById(int id) {
        Folder folder = new Folder();
        String sql = "SELECT * FROM folder WHERE FolderID="+id;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    folder.setFolderId(resultSet.getInt(1));
                    folder.setTitle(resultSet.getString(2));
                    folder.setDescription(resultSet.getString(3));
                    folder.setCreatorID(resultSet.getInt(4));
                    folder.setCourseList(CourseDAO.loadCourseInFolder(id));
                    folder.setCreator(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return folder;
    }
    public static List<Folder> loadFolderByCreatorId(int user_id) {
        List<Folder> folders = new ArrayList<>();
        String sql = "SELECT * FROM folder WHERE Creator="+user_id;
        try{
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()){
                    Folder folder = new Folder();
                    folder.setFolderId(resultSet.getInt(1));
                    folder.setTitle(resultSet.getString(2));
                    folder.setDescription(resultSet.getString(3));
                    folder.setCreator(UserDAO.loadUserById(resultSet.getInt(4)).getUsername());
                    folders.add(folder);
                }
                resultSet.close();
            }
            statement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return folders;
    }
    public static void main(String[] args) {
        System.out.println(loadFolderById(2));
    }
}
