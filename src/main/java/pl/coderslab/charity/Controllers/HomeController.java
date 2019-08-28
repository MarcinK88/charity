package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.Models.Institution;
import pl.coderslab.charity.Repositories.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    @Autowired
    private InstitutionRepository institutionRepository;

    @RequestMapping("/")
    public String homeAction(Model model){

        List<Institution> intitutions = institutionRepository.findAll();
        model.addAttribute("institutions", intitutions);

        return "index";
    }
}
