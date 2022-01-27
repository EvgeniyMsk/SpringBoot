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
    private MailSender mailSender;

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

    public User getUserByFirstname(String firstname) {
        return usersRepository.findUserByFirstname(firstname);
    }

    public boolean createUser(User user) {
        Set<ERole> roles = new HashSet<>();
        roles.add(ERole.ROLE_USER);
        user.setRoles(roles);
        String message = String.format(
                "Hello, %s! \n" +
                        "Welcome to SpringBoot-School21 portal! Please visit next link: \n" +
                        "http://localhost:8080/confirm/%s", user.getUsername(), user.getActivationCode()
        );
        mailSender.send(user.getEmail(), "Activation code", message);
        usersRepository.saveAndFlush(user);
        return true;
    }

    public boolean confirmUser(String code) {
        User user = usersRepository.findUserByActivationCode(code);
        if (user == null)
            return false;
        user.setActivationCode(null);
        user.setConfirmed(true);
        usersRepository.saveAndFlush(user);
        return true;
    }
}
