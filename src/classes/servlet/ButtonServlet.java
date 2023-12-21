package classes.servlet;

import classes.vo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ButtonServlet", value = "/Button")
public class ButtonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String myAttribute = req.getParameter("myAttribute");
        req.getSession().setAttribute("myAttribute", myAttribute);
        System.out.println("hello");
        // req.getRequestDispatcher("/test.jsp").forward(req, resp);
        // 重定向到index.jsp页面
        // resp.sendRedirect(req.getContextPath() + "/test.jsp");
    }

}
