package th.ku.Readyservicejpa.Gamer;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Gamer {

    @Id
    private String id;
    private String name;
    private int score;
    private int highScore;
    private String roomid;
    private String status;




    public Gamer(){ }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String room) {
        this.roomid = room;
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

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getHighScore() {
        return highScore;
    }

    public void setHighScore(int highScore) {
        this.highScore = highScore;
    }

    @Override
    public String toString() {
        return "Gamer{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", score=" + score +
                ", highScore=" + highScore +
                ", roomid='" + roomid + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
