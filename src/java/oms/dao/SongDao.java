
package oms.dao;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import oms.conn.MyConnection;
import oms.dto.Movie;
import oms.dto.Song;
import org.apache.commons.fileupload.FileItem;

public class SongDao implements AbsolutePath {
    
    private Connection con;

    public SongDao() {
        con = new MyConnection().getConnection();
    }
    
    public void uploadSong(Song song, FileItem item) {
        try {
            String fileName = item.getName();
            String dirPath = path+"\\Songs\\All\\"+song.getSongMovie().toUpperCase().charAt(0)+"\\"+song.getSongMovie().toUpperCase();
            File dir = new File(dirPath);
            if(!dir.exists()) {
                dir.mkdirs();
            }
            File uploadFile = new File (dirPath+"\\"+fileName); 
            item.write(uploadFile);
            song.setSongName(fileName);
            song.setSongLocation("Songs/All/"+song.getSongMovie().toUpperCase().charAt(0)+"/"+song.getSongMovie().toUpperCase());
            new SongDao().insertSong(song);
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    protected void insertSong(Song song) {
        try {
        PreparedStatement ps = con.prepareStatement("INSERT INTO SONGS (NAME,LOCATION,MOVIE_ID) VALUES (?,?,?)");
        ps.setString(1, song.getSongName());
        ps.setString(2, song.getSongLocation());
        ps.setInt(3, song.getSongMovieId());
        ps.executeUpdate();
        con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public Set<Map.Entry<Integer,String>> getMovieNames(char c) {
        Set<Map.Entry<Integer,String>> s=null; 
        LinkedHashMap<Integer,String> m = new LinkedHashMap<>();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MOVIES WHERE NAME LIKE ? ORDER BY NAME,YEAR");
            ps.setString(1, c+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                m.put(rs.getInt("MOVIE_ID"), rs.getString("NAME")+" ("+rs.getInt("YEAR")+")");
            }
            s=m.entrySet();
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return s;
    }
    
    public ArrayList<Song> getMovieSongs(int movieId) {
        ArrayList<Song> al = new ArrayList<>();
        Song s;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM SONGS WHERE MOVIE_ID = ? ORDER BY NAME,SONG_ID");
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               s=new Song();
               s.setSongId(rs.getInt("SONG_ID"));
               s.setSongName(rs.getString("NAME"));
               s.setSongLocation(rs.getString("LOCATION"));
               s.setSongMovieId(movieId);
               Movie m = new Movie();
               m.setMovieId(movieId);
               new MovieDao().getMovieDetails(m);
               s.setSongMovie(m.getMovieName());
               al.add(s);
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
    
    public String getMovieName(int movieId) {
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MOVIES WHERE MOVIE_ID=?");
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getString("NAME")+" ("+rs.getInt("YEAR")+")";
            }
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<Song> getAllSongs() {
        ArrayList<Song> al = new ArrayList<>();
        Song s;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT SONG_ID,S.NAME,LOCATION,S.MOVIE_ID,M.NAME FROM SONGS S, MOVIES M WHERE S.MOVIE_ID=M.MOVIE_ID ORDER BY M.NAME,S.NAME,SONG_ID");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               s=new Song();
               s.setSongId(rs.getInt("SONG_ID"));
               s.setSongName(rs.getString("S.NAME"));
               s.setSongLocation(rs.getString("LOCATION"));
               s.setSongMovieId(rs.getInt("S.MOVIE_ID"));
               s.setSongMovie(rs.getString("M.NAME"));
               al.add(s);
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
    
    public void deleteSong(Song song) {
        try {
            
            String fileName = path+"\\Songs\\All\\"+song.getSongMovie().toUpperCase().charAt(0)+"\\"+song.getSongMovie().toUpperCase()+"\\"+song.getSongName();
            File file = new File(fileName);
 //           System.out.println("File Exist : "+file.exists()+"\t"+fileName);
            boolean success = file.delete();
            System.out.println(success);
            if(success) {
                removeSong(song);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
     protected void removeSong(Song song) {
        try {
            PreparedStatement ps = con.prepareStatement("DELETE FROM SONGS WHERE SONG_ID = ?");
            ps.setInt(1, song.getSongId());
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
     
    public void getSongDetails(Song song) {
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM SONGS WHERE SONG_ID = ?");
            ps.setInt(1, song.getSongId());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
               song.setSongName(rs.getString("NAME"));
               song.setSongLocation(rs.getString("LOCATION"));
               song.setSongMovieId(rs.getInt("MOVIE_ID"));
               Movie m = new Movie();
               m.setMovieId(rs.getInt("MOVIE_ID"));
               new MovieDao().getMovieDetails(m);
               song.setSongMovie(m.getMovieName());
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
