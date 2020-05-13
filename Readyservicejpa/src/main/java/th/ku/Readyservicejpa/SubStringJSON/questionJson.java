package th.ku.Readyservicejpa.SubStringJSON;

import th.ku.Readyservicejpa.Choices.Choices;
import th.ku.Readyservicejpa.Choices.ChoicesService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//เปลี่ยนเป็น class ที่ถูกต้อง -> question ,choices
public class questionJson extends Choices {
    private static String dbURL = "jdbc:sqlite:Readydb.db";
    private static String  dbName = "org.sqlite.JDBC";
    Choices createChoices = new Choices();
    ChoicesService choicesService ;

    public void subStringStep1(String objJSON) throws SQLException, ClassNotFoundException {
        String[] line = objJSON.split("},");
        for (int i = 0 ; i<line.length ; i++) {
            String choices1 = line[i].trim();

            subStringStep2(choices1);
        }

    }

    public void subStringStep2(String objJSON) throws SQLException, ClassNotFoundException {
        String[] line = objJSON.split(",");
        String choices1 = line[0].trim();
        String choicesid = line[1].trim();
        String choices2 = line[2].trim();
        String choices3 = line[3].trim();
        String choices4 = line[4].trim();
        subStringStep3(choices1,choicesid,choices2,choices3,choices4);
       // System.out.println(question1+ "\n"+ question2+"\n"+question3+"\n"+question4);
    }

    public void subStringStep3(String c1, String cid, String c2, String c3, String c4) throws SQLException, ClassNotFoundException {
        String[] line1 = c1.split(":\"");
        String[] lineid = cid.split(":\"");
        String[] line2 = c2.split(":\"");
        String[] line3 = c3.split(":\"");
        String[] line4 = c4.split(":\"");
        String choices1 = line1[1].trim();
        String choicesid = lineid[1].trim();
        String choices2 = line2[1].trim();
        String choices3 = line3[1].trim();
        String choices4 = line4[1].trim();
        subStringStep4(choices1,choicesid,choices2,choices3,choices4);

        //System.out.println("test "+choicesid+ "\n"+ choices1+"\n"+choices2+"\n"+choices3+"\n"+choices4);
    }

    public void subStringStep4(String c1,String cid,String c2,String c3, String c4) throws SQLException, ClassNotFoundException {
        String[] line1 = c1.split("\"");
        String[] lineid = cid.split("\"");
        String[] line2 = c2.split("\"");
        String[] line3 = c3.split("\"");
        String[] line4 = c4.split("\"");
        String choices1 = line1[0].trim();
        String choicesid = lineid[0].trim();
        String choices2 = line2[0].trim();
        String choices3 = line3[0].trim();

        String choices4 = line4[0].trim();

        createChoices.setChoices1(choices1);
        createChoices.setChoices2(choices2);
        createChoices.setChoices3(choices3);

        //หาวิธีใส่ id  ที่ไม่ซ้ำกัน
        createChoices.setId(choicesid);

        System.out.println(choicesid+"\n"+choices1+ "\n"+ choices2+"\n"+choices3+" "+choices4);
        lastSubString(choices4);


    }
    public void lastSubString(String lastquestion) throws SQLException, ClassNotFoundException {
        String[] line = lastquestion.split("}]");
        String  choices = line[0].trim();
        createChoices.setChoices4(choices);

        System.out.println(choices+"\n");
        createdb(createChoices);
    }

    public void createdb(Choices createChoices) throws ClassNotFoundException, SQLException {
        Class.forName(dbName);
        Connection connection = DriverManager.getConnection(dbURL);
        String query = "insert into Choices (id,choices1,choices2,choices3,choices4)"+" values (?, ?, ?, ?,?) ";

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1,createChoices.getId());
        preparedStatement.setString(2,createChoices.getChoices1());
        preparedStatement.setString(3,createChoices.getChoices2());
        preparedStatement.setString(4,createChoices.getChoices3());
        preparedStatement.setString(5,createChoices.getChoices4());

        preparedStatement.execute();
        connection.close();
    }
    // เช็คคำถาม คำตอบ -> update point ที่ชื่อของคนนั้น
    public void updatedb(){

    }


}
