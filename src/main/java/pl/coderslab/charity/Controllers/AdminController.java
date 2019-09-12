package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.Institution;
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

    @GetMapping("/admin/institutions/edit/{id}")
    public String editInstitution(@PathVariable long id, Model model) {

        model.addAttribute("institution", institutionService.findById(id));
        return "admin-institution-edit";
    }

    @PostMapping("/admin/institutions/edit/{id}")
    public String editInstitutionPost(@ModelAttribute Institution institution){

        institutionService.save(institution);

        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/institutions/delete/{id}")
    public String deleteInstitution(@PathVariable long id, Model model) {

        model.addAttribute("institution", institutionService.findById(id));

        return "admin-institution-delete-confirm";
    }

    @PostMapping("/admin/institutions/delete/{id}")
    public String deleteInstitutionPost(@ModelAttribute Institution institution){

        institutionService.delete(institution);

        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/institutions/add")
    public String addInstitution(Model model) {

        Institution institution = new Institution();
        model.addAttribute("institution", institution);

        return "admin-institutions-add";
    }

    @PostMapping("/admin/institutions/add")
    public String addInstitutionPost(@ModelAttribute Institution institution) {

        institutionService.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/admin/donations")
    public String adminDonations() {
        return "admin-donations";
    }
}
