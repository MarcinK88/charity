package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Services.UserService;

import javax.validation.Valid;

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
    public String registerPost(@ModelAttribute("newuser") @Valid User newuser, BindingResult result){

        if (result.hasErrors()) {
            return "register";
        }


        userService.save(newuser);

        return "redirect:/";

    }

//    @GetMapping("/login")
//    public String getLogin(Model model) {
//
//        return "login";
//    }
//
//    @PostMapping("/login")
//    public String postLogin(HttpServletRequest request, Principal principal) {
//
//        HttpSession session = request.getSession();
//        session.setAttribute("loggedUser", principal.getName());
//        return "/";
//    }


}
