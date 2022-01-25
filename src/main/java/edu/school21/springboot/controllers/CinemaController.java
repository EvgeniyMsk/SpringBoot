package edu.school21.springboot.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class CinemaController {

    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        model.addAttribute("user", principal);
        return "admin/panel/profile";
    }

    @GetMapping("/session/search")
    public String sessionSearch() {
        return "sessions/sessionSearch";
    }
}
