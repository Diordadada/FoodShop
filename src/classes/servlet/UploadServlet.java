package classes.servlet;

import classes.util.JdbcUtil;
import classes.vo.Food;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UploadServlet", value = "/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String style = req.getParameter("style");
        String price = req.getParameter("price");
        String stock = req.getParameter("stock");

        Part filePart = req.getPart("image");

        // 获取文件名
        String fileName = name + ".webp";
        System.out.println(name + style + price + stock);

        // 定义存储文件的路径
        String filePath = "C:/Users/15223/Desktop/Web/FoodShop/web/images/" + fileName;
        String path = "images/" + fileName;

        System.out.println(filePath);
        System.out.println(path);

        try (InputStream fileInputStream = filePart.getInputStream()) {
            // 将文件保存到服务器的文件系统中
            Files.copy(fileInputStream, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

            // 插入数据库
            String sql = "insert into food (name, style, price, stock, path) values(?,?,?,?,?)";
            JdbcUtil.executeUpdate(sql, name, style, price, stock, path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("add_success.jsp");
    }
}
