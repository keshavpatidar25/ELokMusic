package oms.dto;

public class Song {

    private int songId, songMovieId;
    private String songName, songLocation, songMovie;    

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public int getSongMovieId() {
        return songMovieId;
    }

    public void setSongMovieId(int songMovieId) {
        this.songMovieId = songMovieId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getSongLocation() {
        return songLocation;
    }

    public void setSongLocation(String songLocation) {
        this.songLocation = songLocation;
    }

    public String getSongMovie() {
        return songMovie;
    }

    public void setSongMovie(String songMovie) {
        this.songMovie = songMovie;
    }
     
}
