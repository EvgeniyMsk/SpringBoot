package edu.school21.springboot.controllers;

import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class CinemaController {
    private final UserService userService;

    @Autowired
    public CinemaController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByFirstname(principal.getName()));
        return "admin/panel/profile";
    }

    @GetMapping("/session/search")
    public String sessionSearch() {
        return "sessions/sessionSearch";
    }
}
