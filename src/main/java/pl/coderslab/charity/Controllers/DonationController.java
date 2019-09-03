package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.Category;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.Institution;
import pl.coderslab.charity.Repositories.CategoryRepository;
import pl.coderslab.charity.Repositories.DonationRepository;
import pl.coderslab.charity.Repositories.InstitutionRepository;
import pl.coderslab.charity.Services.TestService;

import java.util.List;

@Controller
public class DonationController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final TestService testService;

    @Autowired
    public DonationController(CategoryRepository categoryRepository,
                              InstitutionRepository institutionRepository,
                              DonationRepository donationRepository,
                              TestService testService) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.testService = testService;

    }

    public String testControllerAction() {
        testService.testFunction();
        return "ok";
    }


    @GetMapping("/adddonation")
    private String addDonation(Model model) {
        Donation donation = new Donation();
        model.addAttribute("donation", donation);

        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);

        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);

        return "addDonation";
    }

    @PostMapping("/adddonation")
    private String addDonationPost(@ModelAttribute Donation donation) {

        donationRepository.save(donation);

        return "redirect:/";
    }

}
