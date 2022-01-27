package edu.school21.springboot.repositories;

import edu.school21.springboot.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends JpaRepository<User, Long> {
    User findUserByFirstname(String username);
}
