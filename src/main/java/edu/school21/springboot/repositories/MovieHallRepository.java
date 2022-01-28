package edu.school21.springboot.repositories;

import edu.school21.springboot.models.MovieHall;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface MovieHallRepository extends JpaRepository<MovieHall, Long> {
    MovieHall findMovieHallById(Long id);
    void removeMovieHallById(Long id);
}
