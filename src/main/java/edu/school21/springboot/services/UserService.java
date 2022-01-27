package edu.school21.springboot.services;

import edu.school21.springboot.models.User;
import edu.school21.springboot.models.roles.ERole;
import edu.school21.springboot.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserService implements UserDetailsService {
    private final UsersRepository usersRepository;

    @Autowired
    public UserService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User temp = usersRepository.findUserByFirstname(username);
        if (temp == null)
            throw new UsernameNotFoundException("User not found");
        return temp;
    }

    public boolean createUser(User user) {
        if (usersRepository.findUserByFirstname(user.getUsername()) != null)
            return false;
        Set<ERole> roles = new HashSet<>();
        roles.add(ERole.ROLE_USER);
        user.setRoles(roles);
        usersRepository.saveAndFlush(user);
        return true;
    }
}
