package edu.school21.springboot.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class MovieHall {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int seatsCount;
    @JsonIgnore
    @OneToMany(mappedBy = "movieHall", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CinemaSession> sessionList;

    public MovieHall(int seatsCount) {
        this.seatsCount = seatsCount;
    }
}
