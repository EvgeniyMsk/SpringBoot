package edu.school21.springboot.controllers;

import edu.school21.springboot.models.User;
import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login() {
        return "auth/login";
    }

    @GetMapping("/register")
    public String register() {
        return "auth/register";
    }

    @PostMapping("/register")
    public String signUp(@ModelAttribute("username") String username,
                         @ModelAttribute("password") String password) {
        if (userService.createUser(new User(username, password)))
            return "redirect:/login";
        else
            return "auth/register";
    }
}
