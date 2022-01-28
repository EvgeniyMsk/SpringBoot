package edu.school21.springboot.models;

import edu.school21.springboot.models.roles.ERole;
import edu.school21.springboot.validation.ValidPassword;
import edu.school21.springboot.validation.ValidUsername;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.*;

@Entity
@Table(name = "usr")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "{user.firstname.notempty}")
    @ValidUsername
    private String firstname;
    @NotEmpty(message = "{user.lastname.notempty}")
    private String lastname;
    @NotEmpty(message = "{user.validation.email.notempty}")
    @Email(message = "{user.validation.email}")
    private String email;
    @Pattern(regexp = "^\\+[0-9]{1,3}\\([0-9]{1,3}\\)[0-9]{6}$", message = "{user.phone.format}")
    private String phone;
    @ValidPassword
    private String password;
    @OneToMany(mappedBy = "user", cascade = CascadeType.MERGE, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<AuthHistory> authHistory;
    @ElementCollection(targetClass = ERole.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<ERole> roles;
    private boolean isConfirmed;
    private String activationCode;

    public User() {
        Set<ERole> roleSet = new HashSet<>();
        roleSet.add(ERole.ROLE_USER);
        this.roles = roleSet;
        this.activationCode = UUID.randomUUID().toString();
        this.authHistory = new ArrayList<>();
    }

    public User(String username, String password) {
        this.firstname = username;
        this.password = password;
        Set<ERole> roleSet = new HashSet<>();
        roleSet.add(ERole.ROLE_USER);
        this.roles = roleSet;
        this.activationCode = UUID.randomUUID().toString();
        this.authHistory = new ArrayList<>();
    }

    @Override
    public Set<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        for (ERole role : roles)
            authorities.add(new SimpleGrantedAuthority(role.toString()));
        return authorities;
    }

    public List<AuthHistory> getAuthHistory() {
        return authHistory;
    }

    public void setAuthHistory(List<AuthHistory> authHistory) {
        this.authHistory = authHistory;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return firstname;
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

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isConfirmed() {
        return isConfirmed;
    }

    public void setConfirmed(boolean confirmed) {
        isConfirmed = confirmed;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
