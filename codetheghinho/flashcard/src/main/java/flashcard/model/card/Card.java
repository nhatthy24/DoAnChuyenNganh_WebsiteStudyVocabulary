package flashcard.model.card;

public class Card {
    private int term_id;
    private String term;
    private String meaning;
    private int creator_id;
    private String image;
    private int course_id;

    public Card() {
    }

    public Card(int term_id, String term, String meaning, int creator_id, String image, int course_id) {
        this.term_id = term_id;
        this.term = term;
        this.meaning = meaning;
        this.creator_id = creator_id;
        this.image = image;
        this.course_id = course_id;
    }

    public int getTerm_id() {
        return term_id;
    }

    public void setTerm_id(int term_id) {
        this.term_id = term_id;
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

    public int getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(int creator_id) {
        this.creator_id = creator_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
}
