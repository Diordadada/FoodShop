package classes.servlet;

import classes.util.Encrypt;
import classes.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "loginServlet", value = "/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean isLogin = false; // 验证状态
        String turePwd = null; // 某 mid 的正确 pwd
        String status = null; // 用户身份

        String name = req.getParameter("name"); // 获取表单中的 mid, pwd
        String pwd = req.getParameter("pwd");
        pwd = Encrypt.encrypt(pwd); // 加密

        String rand = (String) req.getSession().getAttribute("rand");
        String captcha = req.getParameter("captcha");

        try {
            String sql = "select * from user where name = ?";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql, name);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    turePwd = (String)map.get("pwd");
                    status = (String)map.get("status");
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        if(pwd.equals(turePwd) && captcha.equalsIgnoreCase(rand)) {
            isLogin = true;
        }

        if(isLogin) {
            req.getSession().setAttribute("name", name); // 保存 sessions

            if(status.equals("商铺"))
                resp.sendRedirect("user_nav.jsp"); // 跳转
            if(status.equals("管理员"))
                resp.sendRedirect("admin_nav.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }

        // 管理员登录
        // 数据长度验证
        // 输入错误提示
    }

}
