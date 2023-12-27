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

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String pwd = req.getParameter("pwd");

        try {
            String sql = "insert into user (name, phone, pwd, balance) values (?,?,?,?)";
            JdbcUtil.executeUpdate(sql, name, phone, pwd, 0.0);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("register_success.jsp");
    }
}
