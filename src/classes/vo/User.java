package classes.vo;

public class User {
    private String mid;
    private String pwd;

    public User(String mid, String pwd) {
        this.mid = mid;
        this.pwd = pwd;
    }

    public User() {
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
