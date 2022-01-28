package edu.school21.springboot.models.dao;

import edu.school21.springboot.models.Movie;
import lombok.Data;

@Data
public class MovieDao {
    private Long id;
    private String name;
    private String posterUrl;

    public MovieDao(Movie movie) {
        this.id = movie.getId();
        this.name = movie.getTitle();
        this.posterUrl = movie.getPosterUrl();
    }
}
