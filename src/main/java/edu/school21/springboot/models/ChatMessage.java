package edu.school21.springboot.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
public class ChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private MessageType type;
    private String content;
    private String sender;
    @ManyToOne(cascade = {CascadeType.PERSIST})
    @JsonIgnoreProperties({"dateOfRelease", "description", "restrictions", "posterUrl", "hasImage"})
    private Movie movie;
    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE
    }

    public ChatMessage(MessageType type, String content, String sender, Movie movie) {
        this.type = type;
        this.content = content;
        this.sender = sender;
        this.movie = movie;
    }
}
