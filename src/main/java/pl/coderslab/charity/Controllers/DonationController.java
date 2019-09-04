package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Services.CategoryService;
import pl.coderslab.charity.Services.DonationService;
import pl.coderslab.charity.Services.InstitutionService;

@Controller
public class DonationController {

    private final CategoryService categoryService;
    private final InstitutionService institutionService;
    private final DonationService donationService;

    @Autowired
    public DonationController(CategoryService categoryService,
                              InstitutionService institutionService,
                              DonationService donationService) {

        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.donationService = donationService;

    }


    @GetMapping("/adddonation")
    private String addDonation(Model model) {
        Donation donation = new Donation();
        model.addAttribute("donation", donation);
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("institutions", institutionService.findAll());

        return "addDonation";
    }

    @PostMapping("/adddonation")
    private String addDonationPost(@ModelAttribute Donation donation) {

        donationService.save(donation);

        return "redirect:/";
    }

}
