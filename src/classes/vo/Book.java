package classes.vo;

public class Book {
    private String id;
    private String user;
    private String food;
    private int num;
    private double amount;
    private String time;

    public Book() {
    }

    public Book(String id, String user, String food, int num, double amount, String time) {
        this.id = id;
        this.user = user;
        this.food = food;
        this.num = num;
        this.amount = amount;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
