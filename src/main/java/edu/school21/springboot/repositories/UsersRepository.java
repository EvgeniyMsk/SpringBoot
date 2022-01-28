package edu.school21.springboot.repositories;

import edu.school21.springboot.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface UsersRepository extends JpaRepository<User, Long> {
    User findUserByFirstname(String firstname);
    User findUserByActivationCode(String activationCode);
    User findUserById(Long id);
}
