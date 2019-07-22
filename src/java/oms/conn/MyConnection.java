package oms.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/omsdb?zeroDateTimeBehavior=convertToNull";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "";
    private Connection con;
    public Connection getConnection(){
        try {
            if(con==null || con.isClosed()){
                Class.forName(DRIVER_CLASS);
                con = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return con;
    }
}