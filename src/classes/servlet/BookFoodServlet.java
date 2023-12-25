package classes.servlet;

import classes.util.JdbcUtil;
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
        String data = req.getParameter("food");

        Food food = new Food();

        try {
            String sql = "select * from food where name = ?";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql, data);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    food.setName((String) map.get("name"));
                    food.setStyle((String) map.get("style"));
                    food.setPrice(((Number) map.get("price")).doubleValue());
                    food.setStock(((Number) map.get("stock")).intValue());
                    food.setPath((String) map.get("path"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getSession().setAttribute("bookFood", food);

        resp.sendRedirect("books.jsp");
    }

}
