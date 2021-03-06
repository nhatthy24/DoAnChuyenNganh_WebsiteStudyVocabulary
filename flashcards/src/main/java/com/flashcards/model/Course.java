package com.flashcards.model;

import com.flashcards.dao.database.connection.UserDAO;

import java.util.List;

public class Course {
    private int id;
    private int creatorId;
    private String courseName;
    private String description;
    private List<Card> cards;
    private String creatorName;

    public Course() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public List<Card> getTerms() {
        return cards;
    }

    public void setTerms(List<Card> cards) {
        this.cards = cards;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }
    public String getAvatarCreator(){
            User user= UserDAO.loadUserById(creatorId);
            return user.getAvatar();
    }
    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", creatorId=" + creatorId +
                ", creatorName=" + creatorName +
                ", courseName='" + courseName + '\'' +
                ", description='" + description + '\'' +
                ", cards=" + cards +
                '}';
    }
}
