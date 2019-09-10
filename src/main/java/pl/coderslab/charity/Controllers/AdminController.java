package pl.coderslab.charity.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/test")
    public String admin(){

        return "sbadmin";
    }
}
