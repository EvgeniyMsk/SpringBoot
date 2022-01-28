package edu.school21.springboot.controllers;

import edu.school21.springboot.models.User;
import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
    public String register(@ModelAttribute("user") User user) {
        return "auth/register";
    }


    @PostMapping("/signUp")
    public String signUp(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, HttpServletRequest request) {
        if (bindingResult.hasErrors())
            return "auth/register";
        else {
            if (userService.createUser(user, request.getRemoteAddr()))
                return "redirect:/profile";
            else
                return "redirect:/register";
        }
    }

    @GetMapping("/denied")
    public String denied() {
        return "auth/denied";
    }

    @GetMapping("/confirm/{code}")
    public String confirm(Model model, @PathVariable("code") String code) {
        if (userService.confirmUser(code))
            model.addAttribute("message", "Активация произведена!");
        else
            model.addAttribute("message", "Ошибка активации!");
        return "/auth/login";
    }
}
