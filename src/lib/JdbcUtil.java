package lib;

/*
public static Connection getConnection() {
    从 db.properties 中读取信息，与目标数据库某表建立连接
}
close() {
    关闭连接
}
*/

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class JdbcUtil {
    private static String driver;
    private static String url;
    private static String user;
    private static String password;

    static {
        Properties properties = new Properties();
        try {
            properties.load(new FileInputStream("D:/db.properties"));
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("user");
            password = properties.getProperty("password");
            Class.forName(driver);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("JDBC URL: " + url);
        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }

    /**
     * 执行更新操作（插入、修改、删除）
     * @param sql 要执行的SQL语句
     * @param params SQL语句预编译参数（如无可省略）
     * @return rows 影响的行数
     */
    public static int executeUpdate(String sql,Object...params)throws SQLException {
        Connection conn = JdbcUtil.getConnection();
        PreparedStatement ps = null;
        int rows=0;
        try {
            ps = getConnection().prepareStatement(sql);
            if(params!=null&&params.length>0){
                for(int i=0;i<params.length;i++){
                    ps.setObject(i+1,params[i]);
                }
            }
            rows = ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            try {
                JdbcUtil.close(conn, ps, null);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return rows;

    }

    /**
     * 执行查询操作
     * @param sql 要执行的查询sql语句
     * @param params SQL语句预编译参数（如无可省略）
     * @return list 结果集，每一条结果为所有查询的字段名和字段值为键值对的Map集合
     */
    public static List<Map<String, Object>> executeQuery(String sql,Object...params) throws SQLException {
        Connection conn = JdbcUtil.getConnection();
        PreparedStatement ps=null;
        ResultSet set=null;
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        try {
            ps = conn.prepareStatement(sql);
            if(params!=null&&params.length>0){
                for(int i=0;i<params.length;i++){
                    ps.setObject(i+1,params[i]);
                }
            }
            set = ps.executeQuery();
            ResultSetMetaData rsmd = set.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while(set!=null&&set.next()){
                Map<String,Object> map = new HashMap<String,Object>();
                for(int i=1;i<=columnCount;i++){
                    map.put(rsmd.getColumnName(i), set.getObject(i));
                }
                list.add(map);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            try {
                JdbcUtil.close(conn,ps,set);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return list;
    }

    public static void close(Connection connection) throws SQLException {
        close(connection, null, null);
    }

    public static void close(Connection connection, Statement statement) throws SQLException {
        close(connection, statement, null);
    }

    public static void close(Connection connection, Statement statement, ResultSet resultSet) throws SQLException {
        if (connection != null) {
            connection.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (resultSet != null) {
            resultSet.close();
        }
    }
}
