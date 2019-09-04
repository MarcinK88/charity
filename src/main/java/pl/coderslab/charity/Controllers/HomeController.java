package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Models.Institution;
import pl.coderslab.charity.Repositories.DonationRepository;
import pl.coderslab.charity.Repositories.InstitutionRepository;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    @Autowired
    public HomeController(InstitutionService institutionService,
                          DonationService donationService) {

        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @RequestMapping("/")
    public String homeAction(Model model){

        model.addAttribute("institutions", institutionService.findAll());
        model.addAttribute("quantityDonations", donationService.getQuantityDonations());
        model.addAttribute("quantityInstitutions", institutionService.quantityInstitutions());

        return "index";
    }
}
