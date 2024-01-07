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

@WebServlet(name = "RechargeServlet", value = "/recharge")
public class RechargeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getSession().getAttribute("name");
        String rechargeAmount = req.getParameter("rechargeAmount");

        try {
            String sql = "update user set balance = balance + ? where name = ?";
            JdbcUtil.executeUpdate(sql, rechargeAmount, name);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("recharge_success.jsp");
    }

}
