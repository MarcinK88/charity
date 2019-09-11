package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;
import pl.coderslab.charity.Services.UserRolesService;

@Controller
public class AdminController {

    private final InstitutionService institutionService;
    private final DonationService donationService;


    @Autowired
    public AdminController(InstitutionService institutionService,
                          DonationService donationService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
    }
    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("quantityDonations", donationService.getQuantityDonations());
        model.addAttribute("quantityInstitutions", institutionService.quantityInstitutions());

        return "sbadmin";
    }
}
