package edu.school21.springboot.models;

import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
public class AuthHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(cascade = {CascadeType.PERSIST})
    private User user;
    private String type;
    private String time;
    private String address;

    public AuthHistory(User user, String type, String time, String address) {
        this.user = user;
        this.type = type;
        this.time = time;
        this.address = address;
    }

    @Override
    public String toString() {
        return "AuthHistory{" +
                "type='" + type + '\'' +
                ", time='" + time + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}