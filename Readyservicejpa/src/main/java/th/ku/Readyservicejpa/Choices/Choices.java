package th.ku.Readyservicejpa.Choices;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Choices {

    @Id
    private String id;
    private String choices1;
    private String choices2;
    private String choices3;
    private String choices4;

    public Choices() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getChoices1() {
        return choices1;
    }

    public void setChoices1(String choices1) {
        this.choices1 = choices1;
    }

    public String getChoices2() {
        return choices2;
    }

    public void setChoices2(String choices2) {
        this.choices2 = choices2;
    }

    public String getChoices3() {
        return choices3;
    }

    public void setChoices3(String choices3) {
        this.choices3 = choices3;
    }

    public String getChoices4() {
        return choices4;
    }

    public void setChoices4(String choices4) {
        this.choices4 = choices4;
    }

    @Override
    public String toString() {
        return "Choices{" + "id='" + id + '\'' +
                ", choices1='" + choices1 + '\'' +
                ", choices2='" + choices2 + '\'' +
                ", choices3='" + choices3 + '\'' +
                ", choices4='" + choices4 + '\'' +
                '}';
    }
}
