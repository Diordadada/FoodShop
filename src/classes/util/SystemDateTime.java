package classes.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class SystemDateTime {

    public static String getCurrentDateTime() {
        // 获取当前系统日期和时间
        LocalDateTime currentDateTime = LocalDateTime.now();

        // 格式化日期和时间
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return currentDateTime.format(formatter);
    }

}
