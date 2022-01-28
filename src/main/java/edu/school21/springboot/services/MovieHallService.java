package edu.school21.springboot.services;

import edu.school21.springboot.models.MovieHall;
import edu.school21.springboot.repositories.MovieHallRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieHallService {
    @Autowired
    private MovieHallRepository movieHallRepository;

    public List<MovieHall> getAll() {
        return movieHallRepository.findAll();
    }

    public void createMovieHall(MovieHall movieHall) {
        movieHallRepository.saveAndFlush(movieHall);
    }

    public MovieHall getMovieHallById(Long id) {
        return movieHallRepository.findMovieHallById(id);
    }

    public void updateMovieHall(MovieHall movieHall) {
        MovieHall temp = movieHallRepository.findMovieHallById(movieHall.getId());
        if (temp != null) {
            movieHall.setSessionList(temp.getSessionList());
            movieHallRepository.saveAndFlush(movieHall);
        }
    }

    public void deleteMovieHall(MovieHall movieHall) {
        movieHallRepository.removeMovieHallById(movieHall.getId());
    }

}
