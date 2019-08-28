package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Models.Category;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.Institution;
import pl.coderslab.charity.Repositories.CategoryRepository;
import pl.coderslab.charity.Repositories.InstitutionRepository;

import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private InstitutionRepository institutionRepository;

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
    private String addDonationPost(Model model) {

        return "redirect:/";
    }

}