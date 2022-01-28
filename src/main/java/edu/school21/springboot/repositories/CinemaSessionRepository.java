package edu.school21.springboot.repositories;

import edu.school21.springboot.models.CinemaSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface CinemaSessionRepository extends JpaRepository<CinemaSession, Long> {
    CinemaSession getCinemaSessionById(Long id);
    void deleteCinemaSessionsById(Long id);
}
