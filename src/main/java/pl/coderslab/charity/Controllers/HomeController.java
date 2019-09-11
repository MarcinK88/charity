package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;
import pl.coderslab.charity.Services.UserRolesService;

import java.security.Principal;

@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    private final UserRolesService userRolesService;

    @Autowired
    public HomeController(InstitutionService institutionService,
                          DonationService donationService, UserRolesService userRolesService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userRolesService = userRolesService;
    }

    @RequestMapping("/")
    public String homeAction(Model model, Principal principal){

        model.addAttribute("institutions", institutionService.findAll());
        model.addAttribute("quantityDonations", donationService.getQuantityDonations());
        model.addAttribute("quantityInstitutions", institutionService.quantityInstitutions());

//        if (SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().contains("ADMIN")) {
//            return "redirect:/admin";
//        } else {
            return "index";
//        }
    }

//    @PostMapping("/login")
//    public String login() {
//        if (SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().contains("ADMIN")) {
//            return "redirect:/admin";
//        } else {
//            return "index";
//        }
//    }

}
