package beans;
import java.util.*;

public class Login {
    String logname="",
            backNews="未登录";
    public void setLogname(String logname){
        this.logname = logname;
    }
    public String getLogname(){
        return logname;
    }
    public void setBackNews(String s) {
        backNews = s;
    }
    public String getBackNews(){
        return backNews;
    }
}
