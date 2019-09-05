package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Services.UserService;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String register(Model model){

        model.addAttribute("newuser", userService.newUser());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user){

        if(user.getPassword().equals(user.getConfirmPassword())) {

        } else {
            //constraintViolation
            //przekierować na tą samą stronę, dodać error i wyświetlic że hasło nieprawidłowe
            //https://memorynotfound.com/custom-password-constraint-validator-annotation/
            //https://stackoverflow.com/questions/1972933/cross-field-validation-with-hibernate-validator-jsr-303/2155576#2155576
        }

        userService.save(user);
        return "redirect:/";
    }


}
