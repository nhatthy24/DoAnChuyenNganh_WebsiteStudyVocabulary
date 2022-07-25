package com.flashcards.until;

public class ValidEmail {
    public boolean isValid(String email) {
        String regex = "^(.+)@(.+)$";
        return email.matches(regex);
    }
}
