package edu.school21.springboot.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import edu.school21.springboot.models.roles.ERole;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "usr")
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    @ElementCollection(targetClass = ERole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<ERole> roles;

    public User() {
        Set<ERole> roleSet = new HashSet<>();
        roleSet.add(ERole.ROLE_USER);
        roles = roleSet;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
        Set<ERole> roleSet = new HashSet<>();
        roleSet.add(ERole.ROLE_USER);
        roles = roleSet;
    }

    @Override
    public Set<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        for (ERole role : roles)
            authorities.add(new SimpleGrantedAuthority(role.toString()));
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public Set<ERole> getRoles() {
        return roles;
    }

    public void setRoles(Set<ERole> roles) {
        this.roles = roles;
    }
}
