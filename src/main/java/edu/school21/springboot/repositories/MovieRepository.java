package edu.school21.springboot.repositories;

import edu.school21.springboot.models.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface MovieRepository extends JpaRepository<Movie, Long> {
    Movie findMovieById(Long id);
    void deleteMovieById(Long id);
}
