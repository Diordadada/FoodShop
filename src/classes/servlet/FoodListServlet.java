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

@WebServlet(name = "FoodListServlet", value = "/food_list")
public class FoodListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Food> foodList = new ArrayList<Food>();

        String name = null;
        String style = null;
        Double price = 0.0;
        int stock = 0;
        String path = null;

        try {
            String sql = "select * from food";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    name = (String) map.get("name");
                    style = (String) map.get("style");
                    price = ((Number) map.get("price")).doubleValue();
                    stock = ((Number) map.get("stock")).intValue();
                    path = (String) map.get("path");
                    Food food = new Food(name, style, price, stock, path);
                    foodList.add(food);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getSession().setAttribute("foodList", foodList);

        resp.sendRedirect("foods.jsp");
    }

}
