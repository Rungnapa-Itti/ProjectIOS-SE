package th.ku.Readyservicejpa.getSjon;

import org.json.JSONArray;
import org.json.JSONException;
import th.ku.Readyservicejpa.Question.QuestionService;
import th.ku.Readyservicejpa.SubStringJSON.questionJson;

import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.SQLException;

public class JSONReader {
    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
    public static JSONArray readJsonFromUrl(String url) throws IOException, JSONException, SQLException, ClassNotFoundException {
        questionJson toStringJson = new questionJson();
        InputStream is = new URL(url).openStream();

        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONArray json = new JSONArray(jsonText);
            toStringJson.subStringStep1(json.toString());
            return json;
        } finally {
            is.close();
        }
    }

    public static void main(String[] args) throws IOException, JSONException, SQLException, ClassNotFoundException {

        JSONArray json = readJsonFromUrl("http://localhost:8081/choices");
        System.out.println(json.toString());
        QuestionService questionService;


        
    }

}
