package edu.school21.springboot.controllers;

import edu.school21.springboot.models.User;
import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/signIn")
    public String login() {
        return "auth/login";
    }

    @PostMapping("/signIn")
    public String signIn() {
        return "auth/login";
    }

    @GetMapping("/signUp")
    public String register() {
        return "auth/register";
    }


    @PostMapping("/signUp")
    public String signUp(User user) {
        if (userService.createUser(user))
            return "redirect:/profile";
        else
            return "redirect:/register";
    }

    @GetMapping("/denied")
    public String denied() {
        return "auth/denied";
    }
}
