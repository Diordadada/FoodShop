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

@WebServlet(name = "UserListServlet", value = "/UserList")
public class UserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<User> list = new ArrayList<>();

        User user1 = new User();
        user1.setMid("lhq");
        user1.setPwd("123");
        list.add(user1);

        // 为第二条记录创建一个新的User对象
        User user2 = new User();
        user2.setMid("lzl");
        user2.setPwd("234");
        list.add(user2);

        req.getSession().setAttribute("userList", list);

        // req.getRequestDispatcher("/test.jsp").forward(req, resp);
        // 重定向到index.jsp页面
        resp.sendRedirect(req.getContextPath() + "/test.jsp");
    }

}
