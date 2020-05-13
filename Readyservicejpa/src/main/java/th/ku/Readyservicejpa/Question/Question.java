package th.ku.Readyservicejpa.Question;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity

public class Question {

    @Id
    private String id;
    private String name;
    private String answer;

    private String room;
    public Question() {}

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }


    @Override
    public String toString() {
        return "Question{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", answer='" + answer + '\'' +
                ", room='" + room + '\'' +
                '}';
    }
}
