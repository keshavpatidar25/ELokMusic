
package oms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import oms.conn.MyConnection;
import oms.dto.Song;
import oms.dto.SongUser;


public class SongUserDao {
    private Connection con;
    
    public SongUserDao() {
        con = new MyConnection().getConnection();
    }
    
    public void insertSongUser(SongUser songuser){
        try {
            PreparedStatement ps = con.prepareStatement("INSERT INTO SONG_USER VALUES (?,?)");
            ps.setInt(1, songuser.getSong().getSongId());
            ps.setString(2, songuser.getUser().getUserName().toUpperCase());
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteSongUser(SongUser songuser){
        try {
            PreparedStatement ps = con.prepareStatement("DELETE FROM SONG_USER WHERE SONG_ID = ? AND USER_NAME = ?");
            ps.setInt(1, songuser.getSong().getSongId());
            ps.setString(2, songuser.getUser().getUserName());
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public ArrayList<Song> getUserSongs(SongUser songuser) {
        ArrayList<Song> al = null;
        try {
            al = new ArrayList<>();
            Song song;
            PreparedStatement ps = con.prepareStatement("SELECT SU.SONG_ID FROM SONG_USER SU, SONGS S, MOVIES M WHERE USER_NAME = ? AND SU.SONG_ID=S.SONG_ID AND S.MOVIE_ID=M.MOVIE_ID ORDER BY M.NAME,S.NAME");
            ps.setString(1, songuser.getUser().getUserName());
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                song = new Song();
                song.setSongId(rs.getInt("SU.SONG_ID"));
                new SongDao().getSongDetails(song);
                al.add(song);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
}
