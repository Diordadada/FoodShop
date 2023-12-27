package classes.servlet;

import classes.util.JdbcUtil;
import classes.vo.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "UserInfoServlet", value = "/user_info")
public class UserInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getSession().getAttribute("name");
        User user = new User();

        try {
            String sql = "select * from user where name = ?";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql, name);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    user.setName(name);
                    user.setPhone((String)map.get("phone"));
                    user.setPwd((String)map.get("pwd"));
                    user.setBalance(((Number) map.get("balance")).doubleValue());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getSession().setAttribute("user", user);

        resp.sendRedirect("user_center.jsp");
    }
}
