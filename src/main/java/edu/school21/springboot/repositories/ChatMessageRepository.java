package edu.school21.springboot.repositories;

import edu.school21.springboot.models.ChatMessage;
import edu.school21.springboot.models.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
    List<ChatMessage> findFirst10ChatMessageByMovieOrderByIdDesc(Movie movie);
}
