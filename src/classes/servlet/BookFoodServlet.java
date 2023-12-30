package classes.servlet;

import classes.util.JdbcUtil;
import classes.util.MyRandom;
import classes.util.SystemDateTime;
import classes.vo.Food;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookFoodServlet", value = "/book_food")
public class BookFoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num = Integer.parseInt(req.getParameter("num"));
        String foodName = req.getParameter("food");
        Food food = new Food();
        String id = MyRandom.generateRandomString(8);
        String user = (String) req.getSession().getAttribute("name");
        String time = SystemDateTime.getCurrentDateTime();

        try {
            String sql = "select * from food where name = ?";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql, foodName);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    food.setName((String) map.get("name"));
                    food.setStyle((String) map.get("style"));
                    food.setPrice(((Number) map.get("price")).doubleValue());
                    food.setStock(((Number) map.get("stock")).intValue());
                    food.setPath((String) map.get("path"));
                }
            }
            Double amount = num * food.getPrice();

            sql = "update food set stock = stock - ? where name = ?";
            JdbcUtil.executeUpdate(sql, num, food.getName());

            sql = "update user set balance = balance - ? where name = ?";
            JdbcUtil.executeUpdate(sql, amount, user);

            sql = "insert into book (id, user, food, num, amount, time) values(?,?,?,?,?,?)";
            JdbcUtil.executeUpdate(sql, id, user, food.getName(), num, amount, time);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("booking_success.jsp");
    }
}
