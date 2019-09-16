package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Services.EmailService;

@Controller
public class EmailController {


    private final EmailService emailService;

    @Autowired
    public EmailController(EmailService emailService) {
        this.emailService = emailService;
    }

    @PostMapping("/contact")
    public String sendMailContactForm(@Param("name") String name, @Param("surname") String surname, @Param("message") String message){

        emailService.sendContactForm(name,surname,message);

        return "redirect:/";
    }

}
