import classes.util.Encrypt;

public class Main {
    public static void main(String[] args) {
        String pwd = "1";
        pwd = Encrypt.encrypt(pwd);
        System.out.println(pwd);
    }
}