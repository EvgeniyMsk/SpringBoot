package edu.school21.springboot.services;

import edu.school21.springboot.models.CinemaSession;
import edu.school21.springboot.repositories.CinemaSessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Service
public class CinemaSessionService {
    @Autowired
    private CinemaSessionRepository cinemaSessionRepository;

    public List<CinemaSession> getAll() {
        return cinemaSessionRepository.findAll();
    }

    public CinemaSession getCinemaSessionById(Long id) {
        return cinemaSessionRepository.getCinemaSessionById(id);
    }

    public void createCinemaSession(CinemaSession cinemaSession) {
        cinemaSessionRepository.saveAndFlush(cinemaSession);
    }

    public void updateCinemaSession(CinemaSession cinemaSession) {
        cinemaSessionRepository.saveAndFlush(cinemaSession);
    }

    public void deleteCinemaSession(CinemaSession cinemaSession) {
        cinemaSessionRepository.deleteCinemaSessionsById(cinemaSession.getId());
    }

    public List<CinemaSession> findCinemaSessionByText(String text) {
        List<CinemaSession> sessions = new ArrayList<>();
        for (CinemaSession cinemaSession : getAll())
            if (cinemaSession.getMovie().getTitle().toLowerCase(Locale.ROOT).contains(text.toLowerCase(Locale.ROOT)))
                sessions.add(cinemaSession);
        return sessions;
    }
}
