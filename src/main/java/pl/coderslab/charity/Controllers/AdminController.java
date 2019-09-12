package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;
import pl.coderslab.charity.Services.UserRolesService;
import pl.coderslab.charity.Services.UserService;

@Controller
public class AdminController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final UserRolesService userRolesService;


    @Autowired
    public AdminController(InstitutionService institutionService,
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

    @GetMapping("/admin/users")
    public String adminUsers() {
        return "admin-users";
    }

    @GetMapping("/admin/admins")
    public String adminAdmins() {
        return "admin-admins";
    }

    @GetMapping("/admin/institutions")
    public String adminInstitutions(Model model) {

        model.addAttribute("institutions", institutionService.findAll());

        return "admin-institutions";
    }

    @GetMapping("/admin/donations")
    public String adminDonations() {
        return "admin-donations";
    }
}
