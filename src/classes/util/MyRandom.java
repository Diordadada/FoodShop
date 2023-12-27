package classes.util;

import java.util.Random;

public class MyRandom {
    public static String generateRandomString(int length) {
        String characters = "0123456789";
        Random random = new Random();
        StringBuilder randomString = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            randomString.append(randomChar);
        }

        return randomString.toString();
    }
}
