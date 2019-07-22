
package oms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import oms.conn.MyConnection;
import oms.dto.Feedback;

public class FeedbackDao {
    
    private Connection con;
    public FeedbackDao() {
        con = new MyConnection().getConnection();
    }
    
    public void insertFeedback(Feedback fb)
    {
        Calendar c = Calendar.getInstance();
        String dt = c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DATE);
        System.out.println(dt);
        fb.setDate(dt);
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO FEEDBACK (USER_FROM, EMAIL, PHONE, SUBJECT, MESSAGE, DATE) VALUES(?,?,?,?,?,?)");
            ps.setString(1, fb.getFrom());
            ps.setString(2, fb.getEmail());
            ps.setLong(3, fb.getPhone());
            ps.setString(4, fb.getSubject());
            ps.setString(5, fb.getMessage());
            ps.setString(6, fb.getDate());
            ps.executeUpdate();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public ArrayList<Feedback> getAllFeedbacks() {
        ArrayList<Feedback> al = new ArrayList<>();
        Feedback f;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM FEEDBACK ORDER BY FEEDBACK_ID DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               f=new Feedback();
               f.setFeedbackId(rs.getInt("FEEDBACK_ID"));
               f.setFrom(rs.getString("USER_FROM"));
               f.setEmail(rs.getString("EMAIL"));
               f.setPhone(rs.getLong("PHONE"));
               f.setSubject(rs.getString("SUBJECT"));
               f.setMessage(rs.getString("MESSAGE"));
               f.setDate(rs.getString("DATE"));
               al.add(f);
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
    
    public void emailmsg(Feedback f, String msg) throws MessagingException {
        String host = "smtp.gmail.com";
        String password = "zoombied12";
        String from = "elokmusic.0203@gmail.com";       //give email id of gmail
        String toAddress = f.getEmail();
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, toAddress);
        message.setSubject("E-Lok Music Support");
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setText(msg);
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        messageBodyPart = new MimeBodyPart();
        message.setContent(multipart);
        try {
            Transport tr = session.getTransport("smtps");
            tr.connect(host, from, password);
            tr.sendMessage(message, message.getAllRecipients());
            tr.close();
        } catch (SendFailedException sfe) {
            sfe.printStackTrace();
        }
    }

}
