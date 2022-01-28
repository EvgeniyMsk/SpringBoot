package edu.school21.springboot.controllers;

import edu.school21.springboot.models.ChatMessage;
import edu.school21.springboot.services.ChatMessageService;
import edu.school21.springboot.services.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@Controller
public class ChatController {
    private final ChatMessageService chatMessageService;

    private final MovieService movieService;

    @Autowired
    public ChatController(ChatMessageService chatMessageService, MovieService movieService) {
        this.chatMessageService = chatMessageService;
        this.movieService = movieService;
    }

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        ChatMessage temp = new ChatMessage();
        temp.setType(chatMessage.getType());
        temp.setContent(chatMessage.getContent());
        temp.setSender(chatMessage.getSender());
        temp.setMovie(movieService.getMovieById(chatMessage.getMovie().getId()));
        chatMessageService.addChatMessage(temp);
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        Objects.requireNonNull(headerAccessor.getSessionAttributes()).put("username", chatMessage.getSender());
        return chatMessage;
    }

    @GetMapping("/chat/messages")
    @ResponseBody
    public List<ChatMessage> getMessages() {
        return chatMessageService.getAll();
    }


    @GetMapping("/chat/messages/{id}")
    @ResponseBody
    public List<ChatMessage> getMessagesFromMovie(@PathVariable("id") String id) {
        return chatMessageService.getMessagesFromMovie(movieService.getMovieById(Long.parseLong(id)));
    }
}
