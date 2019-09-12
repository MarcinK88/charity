package pl.coderslab.charity.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String adminDonations() {
        return "admin-donations";
    }

}
