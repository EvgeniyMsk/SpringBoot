package edu.school21.springboot.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private Date dateOfRelease;
    private int restrictions;
    private String description;
    public String posterUrl;
    private boolean hasImage;
    @OneToMany(mappedBy = "movie",cascade = CascadeType.MERGE, fetch = FetchType.EAGER, orphanRemoval = true)
    @JsonIgnore
    private List<CinemaSession> sessions;
    @OneToMany(mappedBy = "movie", cascade = CascadeType.MERGE, orphanRemoval = true)
    @JsonIgnore
    private List<ChatMessage> messages;

    public Movie() {
        this.hasImage = false;
    }
    public Movie(String title, Date dateOfRelease, int restrictions, String description) {
        this.title = title;
        this.dateOfRelease = dateOfRelease;
        this.restrictions = restrictions;
        this.description = description;
        this.sessions = new ArrayList<>();
    }
}
