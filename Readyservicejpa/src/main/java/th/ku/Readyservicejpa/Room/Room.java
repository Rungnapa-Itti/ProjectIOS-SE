package th.ku.Readyservicejpa.Room;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Room {
    @Id
    private String roomid;
    private String status;
    private String win1;
    private String win2;
    private String win3;

    public Room(){

    }

    public String getRoomID() {
        return roomid;
    }

    public String getStatus() {
        return status;
    }

    public String getWin1() {
        return win1;
    }

    public String getWin2() {
        return win2;
    }

    public String getWin3() {
        return win3;
    }

    public void setRoomID(String roomID) {
        this.roomid = roomID;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setWin1(String win1) {
        this.win1 = win1;
    }

    public void setWin2(String win2) {
        this.win2 = win2;
    }

    public void setWin3(String win3) {
        this.win3 = win3;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomID='" + roomid + '\'' +
                ", status='" + status + '\'' +
                ", win1='" + win1 + '\'' +
                ", win2='" + win2 + '\'' +
                ", win3='" + win3 + '\'' +
                '}';
    }

}
