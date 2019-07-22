package oms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import oms.conn.MyConnection;
import oms.dto.User;


public class UserDao {

    private Connection con;
    
    public UserDao() {
        con = new MyConnection().getConnection();
    }
    
    public boolean login(User user)
    {
        boolean flag = false;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE USER_NAME = ? AND PASSWORD = md5(?)");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPass());
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                flag = true;
                user.setName(rs.getString("name"));
                user.setRole(rs.getString("role"));
                user.setSecretQues(rs.getString("secret_ques"));
                user.setSecretAns(rs.getString("secret_ans"));
            }
            con.close();
        } catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return flag;
    }
    
    public void insertData(User user)
    {
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO USER VALUES(?,md5(?),?,?,?,?)");
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPass());
            ps.setString(3, user.getName());
            ps.setString(4, user.getRole());
            ps.setString(5, user.getSecretQues());
            ps.setString(6, user.getSecretAns());
            ps.executeUpdate();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean verifyUserName (User user)
    {
        boolean flag = false;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE USER_NAME = ?");
            ps.setString(1, user.getUserName());
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                flag=true;
                user.setName(rs.getString("name"));
                user.setRole(rs.getString("role"));
                user.setSecretQues(rs.getString("secret_ques"));
                user.setSecretAns(rs.getString("secret_ans"));
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }
    
    public void updatePassword(User user) {
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE USER SET PASSWORD = md5(?) WHERE USER_NAME = ?");
            ps.setString(1, user.getPass());
            ps.setString(2, user.getUserName());
            ps.executeUpdate();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void updateDetails(User user) {
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE USER SET PASSWORD = md5(?), NAME = ?, SECRET_QUES = ?, SECRET_ANS = ? WHERE USER_NAME = ?");
            ps.setString(1, user.getPass());
            ps.setString(2, user.getName());
            ps.setString(3, user.getSecretQues());
            ps.setString(4, user.getSecretAns());
            ps.setString(5, user.getUserName());
            ps.executeUpdate();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void updateRole(User user) {
        try {
            PreparedStatement ps = con.prepareStatement("UPDATE USER SET ROLE = ? WHERE USER_NAME = ?");
            ps.setString(1, user.getRole());
            ps.setString(2, user.getUserName());
            ps.executeUpdate();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public ArrayList<String> getAllUserNames() {
        ArrayList<String> al = null;
        try {
            al = new ArrayList<>();
            PreparedStatement ps = con.prepareStatement("SELECT USER_NAME FROM USER");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
              al.add(rs.getString("USER_NAME"));
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
}
