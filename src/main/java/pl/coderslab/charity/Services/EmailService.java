package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.VerificationToken;

public interface EmailService {

    void sendContactForm(String name, String surname, String text);

    public void sendActivationMail(User user, VerificationToken token);


    }
