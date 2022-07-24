package com.flashcards.model;

import java.util.List;

public class Folder {
    private int folderId;
    private String title;
    private String description;
    private int creatorID;
    private String creator;
    private List<Course> courseList;

    public Folder(){}

    public int getFolderId() {
        return folderId;
    }

    public void setFolderId(int folderId) {
        this.folderId = folderId;
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

    public int getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(int creatorID) {
        this.creatorID = creatorID;
    }

    public List<Course> getCourseList() {
        return courseList;
    }

    public void setCourseList(List<Course> courseList) {
        this.courseList = courseList;
    }

    @Override
    public String toString() {
        return "Folder{" +
                "folderId=" + folderId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", creatorID=" + creatorID +
                ", creator='" + creator + '\'' +
                ", courseList=" + courseList +
                '}';
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

}
