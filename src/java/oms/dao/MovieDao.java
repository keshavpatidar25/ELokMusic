package oms.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import oms.conn.MyConnection;
import oms.dto.Movie;
import oms.dto.Song;

public class MovieDao implements AbsolutePath{
    private Connection con;

    public MovieDao() {
        con = new MyConnection().getConnection();
    }
    
    public void insertMovie(Movie movie) {
        try {
            File dir = new File(path+"\\Songs\\All\\"+movie.getMovieName().toUpperCase().charAt(0)+"\\"+movie.getMovieName().toUpperCase());
            if(!dir.exists()) {
                dir.mkdirs();
            }
            PreparedStatement ps;
            if(movie.getMovieYear()==0) {
                ps = con.prepareStatement("INSERT INTO MOVIES (NAME) VALUES (?)");
                System.out.println("abc");
            } else {
                ps = con.prepareStatement("INSERT INTO MOVIES (NAME,YEAR) VALUES (?,?)");
                ps.setInt(2, movie.getMovieYear());
            }
            ps.setString(1, movie.getMovieName().toUpperCase());
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public ArrayList<Movie> getAllMovies() {
        ArrayList<Movie> al = new ArrayList<>();
        Movie m;
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MOVIES");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               m=new Movie();
               m.setMovieId(rs.getInt("MOVIE_ID"));
               m.setMovieName(rs.getString("NAME"));
               m.setMovieYear(rs.getInt("YEAR"));
               al.add(m);
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return al;
    }
   
    public void getMovieDetails(Movie movie) {
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM MOVIES WHERE MOVIE_ID=?");
            ps.setInt(1, movie.getMovieId());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                movie.setMovieName(rs.getString("NAME"));
                movie.setMovieYear(rs.getInt("YEAR"));
            }
            con.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteMovie(Movie movie) {
        try {
            
            String fileName = path+"\\Songs\\All\\"+movie.getMovieName().toUpperCase().charAt(0)+"\\"+movie.getMovieName().toUpperCase();
//            boolean success = new FileDao().deleteDirectory(fileName);
            ArrayList<Song> al = new SongDao().getMovieSongs(movie.getMovieId());
            for(Song song : al) {
                new SongDao().deleteSong(song);
            }
            PreparedStatement ps = con.prepareStatement("SELECT * FROM SONGS WHERE MOVIE_ID = ?");
            ps.setInt(1, movie.getMovieId());
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
                removeMovie(movie);
            }
            new FileDao().deleteDirectory(fileName);
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
     protected void removeMovie(Movie movie) {
        try {
            PreparedStatement ps = con.prepareStatement("DELETE FROM MOVIES WHERE MOVIE_ID = ?");
            ps.setInt(1, movie.getMovieId());
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
