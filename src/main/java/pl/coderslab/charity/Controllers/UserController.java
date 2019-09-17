package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.Models.PasswordResetToken;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Repositories.PasswordResetTokenRepository;
import pl.coderslab.charity.Repositories.VerificationTokenRepository;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.EmailService;
import pl.coderslab.charity.Services.UserService;
import pl.coderslab.charity.Services.VerificationTokenService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {

    private final UserService userService;

    private final DonationService donationService;
    private final EmailService emailService;
    private final PasswordResetTokenRepository passwordResetTokenRepository;

    @Autowired
    public UserController(UserService userService, DonationService donationService, EmailService emailService, PasswordResetTokenRepository passwordResetTokenRepository) {
        this.userService = userService;
        this.donationService = donationService;
        this.emailService = emailService;
        this.passwordResetTokenRepository = passwordResetTokenRepository;
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

        userService.register(newuser);

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

    @GetMapping("/resetpassword")
    public String resetPassword() {

        return "password-reset";
    }

    @PostMapping("/resetpassword")
    public String resetPasswordPost(@ModelAttribute("username") String username){

        User user = userService.find(username);

        if (user == null){
            return "user-not-found";
        } else {


            userService.createPasswordResetTokenForUser(user);
            emailService.sendPasswordResetLink(user,passwordResetTokenRepository.findByUser(user));

            return "user-found-reset-password";
        }

    }


    @GetMapping("/passwordreset")
    public String passwordReset(@RequestParam("token") String token, Model model){

        PasswordResetToken passwordResetToken = passwordResetTokenRepository.findByToken(token);

        User user = passwordResetToken.getUser();

        model.addAttribute("user", user);

        return "password-reset-by-mail";
    }

    @PostMapping("/passwordreset")
    public String passwordResetPost(@ModelAttribute("user") @Valid User user, BindingResult result){

        if (result.hasErrors()) {
            return "password-reset-by-mail";
        } else {
            userService.save(user);
            passwordResetTokenRepository.delete(passwordResetTokenRepository.findByUser(user));
            return "password-change-confirm";
        }
    }
}

//https://www.baeldung.com/registration-verify-user-by-email
//https://www.baeldung.com/spring-security-registration-i-forgot-my-password
