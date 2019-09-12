package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;
import pl.coderslab.charity.Services.UserRolesService;
import pl.coderslab.charity.Services.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminUsersController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final UserRolesService userRolesService;


    @Autowired
    public AdminUsersController(InstitutionService institutionService,
                                       DonationService donationService,
                                       UserService userService,
                                       UserRolesService userRolesService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.userRolesService = userRolesService;
    }

    @GetMapping("/admin/users")
    public String adminUsers(Model model) {

        model.addAttribute("users", userService.findAllByUserRoles(userRolesService.findByRole("USER")));

        return "admin-users";
    }

    @GetMapping("/admin/users/edit/{id}")
    public String editUser(@PathVariable long id, Model model) {
        model.addAttribute("user", userService.findById(id));
        model.addAttribute("oldUsername", userService.findById(id).getUsername());
        return "admin-user-edit";
    }

    @PostMapping("/admin/users/edit/{id}")
    public String editUserPost(@ModelAttribute User user, @Param("oldUsername") String oldUsername) {

        userService.update(user, oldUsername);

        return "redirect:/admin/users";
    }

}
