package edu.school21.springboot.services;

import edu.school21.springboot.models.Movie;
import edu.school21.springboot.repositories.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MovieService {
    @Autowired
    private MovieRepository movieRepository;

    public List<Movie> getAll() {
        return movieRepository.findAll();
    }

    public Movie getMovieById(Long id) {
        return movieRepository.findMovieById(id);
    }

    public void createMovie(Movie movie) {
        movieRepository.saveAndFlush(movie);
    }

    public void updateMovie(Movie movie) {
        Movie temp = movieRepository.findMovieById(movie.getId());
        if (temp != null) {
            movie.setSessions(temp.getSessions());
            movie.setMessages(temp.getMessages());
            movieRepository.saveAndFlush(movie);
        }
    }

    public void deleteMovie(Movie movie) {
        movieRepository.deleteMovieById(movie.getId());
    }
}
