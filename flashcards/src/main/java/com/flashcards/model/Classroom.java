package com.flashcards.model;

import com.flashcards.dao.database.connection.UserDAO;

import java.util.ArrayList;
import java.util.List;

public class Classroom {
    private int classID;
    private String title;
    private String description;
    private String school;
    private String creator;
//    private int creatorId;
    private List<Folder> folders;
    private List<Course> courses;
    private List<User> members = new ArrayList<>();

    public Classroom(){}

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    //    public int getCreatorId() {
//        return creatorId;
//    }
//
//    public void setCreatorId(int creatorId) {
//        this.creatorId = creatorId;
//    }

    public List<Folder> getFolders() {
        return folders;
    }

    public void setFolders(List<Folder> folders) {
        this.folders = folders;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    public List<User> getMembers() {
        return members;
    }

    public void setMembers(List<User> members) {
        this.members = members;
    }

    public void addMembers(User user){
        this.members.add(user);
    }

}
