package edu.school21.springboot.models;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
public class CinemaSession {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDateTime date;

    @ManyToOne(cascade = {CascadeType.ALL})
    private MovieHall movieHall;

    @ManyToOne(cascade = {CascadeType.ALL})
    private Movie movie;
    private int ticketCost;

    public CinemaSession(MovieHall movieHall, Movie movie, LocalDateTime date, int ticketCost) {
        this.movieHall = movieHall;
        this.movie = movie;
        this.date = date;
        this.ticketCost = ticketCost;
    }

    public String getDateHtml() {
        return date.toString().replace('T', ' ');
    }

    public String getDateToEdit() {
        return date.toString();
    }
}
