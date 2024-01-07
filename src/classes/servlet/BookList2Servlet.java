package classes.servlet;

import classes.util.JdbcUtil;
import classes.vo.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookList2Servlet", value = "/book_list2")
public class BookList2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> bookList = new ArrayList<Book>();

        String id = null;
        String user = null;
        String food = null;
        int num = 0;
        double amount = 0.0;
        String time = null;

        try {
            String sql = "select * from book";
            List<Map<String,Object>> list = JdbcUtil.executeQuery(sql);
            if(!list.isEmpty()) {
                for(Map map : list) {
                    id = (String) map.get("id");
                    user = (String) map.get("user");
                    food = (String) map.get("food");
                    num = ((Number) map.get("num")).intValue();
                    amount = ((Number) map.get("amount")).doubleValue();
                    time = (String) map.get("time");
                    Book book = new Book(id, user, food, num, amount, time);
                    bookList.add(book);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getSession().setAttribute("bookList", bookList);

        resp.sendRedirect("view_books.jsp");
    }

}
