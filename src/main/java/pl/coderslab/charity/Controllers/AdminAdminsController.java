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

@Controller
public class AdminAdminsController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final UserRolesService userRolesService;


    @Autowired
    public AdminAdminsController(InstitutionService institutionService,
                                 DonationService donationService,
                                 UserService userService,
                                 UserRolesService userRolesService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.userRolesService = userRolesService;
    }

    @GetMapping("/admin")
    public String admin(Model model){

        model.addAttribute("quantityDonations", donationService.getQuantityDonations());
        model.addAttribute("quantityInstitutions", institutionService.quantityInstitutions());
        model.addAttribute("quantityUsers", userService.quantityUsers(userRolesService.findByRole("USER")));
        model.addAttribute("quantityAdministrators", userService.quantityUsers(userRolesService.findByRole("ADMIN")));

        return "sbadmin";
    }

    @GetMapping("/admin/admins")
    public String adminAdmins(Model model) {

        model.addAttribute("admins", userService.findAllByUserRoles(userRolesService.findByRole("ADMIN")));

        return "admin-admins";
    }

    @GetMapping("/admin/admins/edit/{id}")
    public String editAdmin(@PathVariable long id, Model model) {
        model.addAttribute("admin", userService.findById(id));
        model.addAttribute("oldUsername", userService.findById(id).getUsername());
        return "admin-admin-edit";
    }

    @PostMapping("/admin/admins/edit/{id}")
    public String editUserPost(@ModelAttribute User user, @Param("oldUsername") String oldUsername) {

        userService.update(user, oldUsername);

        return "redirect:/admin/admins";
    }

    @GetMapping("/admin/admins/delete/{id}")
    public String deleteUser(@PathVariable long id, Model model) {
        model.addAttribute("user", userService.findById(id));

        return "admin-admins-delete-confirm";
    }

    @PostMapping("/admin/admins/delete/{id}")
    public String deleteUserPost(@ModelAttribute User user) {
        userService.delete(user);

        return "redirect:/admin/users";
    }

}
