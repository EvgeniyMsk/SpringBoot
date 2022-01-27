package edu.school21.springboot.controllers;

import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
    @GetMapping("/admin/panel/halls")
    public String halls() {
        return "admin/panel/halls";
    }

    @GetMapping("/admin/panel/films")
    public String films() {
        return "admin/panel/films";
    }

    @GetMapping("/admin/panel/sessions")
    public String sessions() {
        return "admin/panel/sessions";
    }
}
