package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.Services.EmailService;

@Component
public class EmailServiceImpl implements EmailService {

    private JavaMailSender emailSender;

    @Autowired
    public EmailServiceImpl(JavaMailSender emailSender) {
        this.emailSender = emailSender;
    }

    public void sendContactForm(String name, String surname, String text) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo("charity.app11@gmail.com");
        message.setSubject("New email from " + name + " " + surname);

        message.setText(text);
        emailSender.send(message);

    }


}
