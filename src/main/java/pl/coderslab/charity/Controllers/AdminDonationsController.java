package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;
import pl.coderslab.charity.Services.UserRolesService;
import pl.coderslab.charity.Services.UserService;

@Controller
public class AdminDonationsController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final UserRolesService userRolesService;


    @Autowired
    public AdminDonationsController(InstitutionService institutionService,
                                    DonationService donationService,
                                    UserService userService,
                                    UserRolesService userRolesService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.userRolesService = userRolesService;
    }

    @GetMapping("/admin/donations")
    public String adminDonations(Model model) {

        model.addAttribute("donations", donationService.findAll());

        return "admin-donations";
    }

    @GetMapping("/admin/donations/pickup/{id}")
    public String pickup(@PathVariable long id){

        donationService.pickUp(true, id);

        return "redirect:/admin/donations";

    }

    @GetMapping("/admin/donations/delete/{id}")
    public String delete(@PathVariable int id, Model model) {

        model.addAttribute("donation", donationService.find(id));

        return "admin-donation-delete-confirm";

    }

    @PostMapping("/admin/donations/delete/{id}")
    public String deletePost(@ModelAttribute Donation donation) {

        donationService.delete(donation);

        return "redirect:/admin/donations";
    }

}
