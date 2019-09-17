package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Repositories.VerificationTokenRepository;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.UserService;
import pl.coderslab.charity.Services.VerificationTokenService;

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

        model.addAttribute("donationQuantity", donationService.getQuantityUserDonations(userService.find(principal.getName())));
        return "user-details";
    }

    @GetMapping("/password")
    public String changePassword(Model model, Principal principal) {
        model.addAttribute("user", userService.find(principal.getName()));
        model.addAttribute("iscorrectpassword","");
        return "password-change";
    }

    @PostMapping("/password")
    public String changePasswordPost(Model model, @ModelAttribute("user") @Valid User user, BindingResult result, @RequestParam String oldpwd){

        if (result.hasErrors()) {
            return "password-change";
        } else if(!userService.comparePassword(userService.find(user.getUsername()).getPassword(), oldpwd)) {
            model.addAttribute("iscorrectpassword", "hasło niepoprawne");
            return "password-change";
        } else {
            userService.save(user);
            return "redirect:/profile";
        }
    }

    @GetMapping("/edituser")
    public String editUser(Model model, Principal principal){

        model.addAttribute("user", userService.find(principal.getName()));

        System.out.println("USER ROLE: " + userService.find(principal.getName()).getUserRoles());
        return "user-edit";
    }

    @PostMapping("/edituser")
    public String editUserPost(@ModelAttribute("user") User user, Principal principal){

        userService.update(user, principal.getName());
        SecurityContextHolder.clearContext();
        return "redirect:/login";
    }

    @GetMapping("/mydonations")
    public String myDonations(Model model, Principal principal) {

        model.addAttribute("donations", donationService.findAllOfUser(userService.find(principal.getName())));

        return "user-donations";
    }

    @GetMapping("/mydonations/details/{id}")
    public String myDonationsDetails(@PathVariable int id, Model model) {

        model.addAttribute("donation", donationService.find(id));

        return "user-donations-details";
    }

    @GetMapping("/confirmRegister")
    public String confirmRegister(@RequestParam("token") String token) {

        userService.enableByToken(token);

        return "register-confirm";
    }
}
