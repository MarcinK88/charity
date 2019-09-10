package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {

    private final UserService userService;

    private final DonationService donationService;

    @Autowired
    public UserController(UserService userService, DonationService donationService) {
        this.userService = userService;
        this.donationService = donationService;
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

    @GetMapping("/profile")
    public String profile(Model model, Principal principal) {

        System.out.println("principal name: " + principal.getName());
        System.out.println("quantity: " + donationService.getQuantityUserDonations(principal.getName()));
        model.addAttribute("donationQuantity", donationService.getQuantityUserDonations(principal.getName()));
        return "user-details";
    }


}
