package classes.vo;

public class User {
    private String name;
    private String phone;
    private String pwd;

    private Double balance;

    public User(String name, String phone, String pwd, Double balance) {
        this.name = name;
        this.phone = phone;
        this.pwd = pwd;
        this.balance = balance;
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }
}
