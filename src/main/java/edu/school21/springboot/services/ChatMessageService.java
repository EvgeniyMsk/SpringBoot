package edu.school21.springboot.services;

import edu.school21.springboot.models.ChatMessage;
import edu.school21.springboot.models.Movie;
import edu.school21.springboot.repositories.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ChatMessageService {
    @Autowired
    private ChatMessageRepository chatMessageRepository;

    public List<ChatMessage> getAll() {
        return chatMessageRepository.findAll();
    }

    public List<ChatMessage> getMessagesFromMovie(Movie movie) {
        List<ChatMessage> chatMessages;
        chatMessages = chatMessageRepository.findFirst10ChatMessageByMovieOrderByIdDesc(movie);
        Collections.reverse(chatMessages);
        return chatMessages;
    }

    public void addChatMessage(ChatMessage chatMessage) {
        chatMessageRepository.saveAndFlush(chatMessage);
    }
}
