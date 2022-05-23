package com.flashcards.model;

public class Card {
    private int id;
    private String term;
    private String meaning;
    private int creator;
    private String image;
    private int courseId;
    private boolean markedCard;

    public Card() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public boolean isMarkedCard() {
        return markedCard;
    }

    public void setMarkedCard(boolean markedCard) {
        this.markedCard = markedCard;
    }
}
