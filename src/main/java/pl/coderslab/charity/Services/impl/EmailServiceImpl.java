package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.Models.PasswordResetToken;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.VerificationToken;
import pl.coderslab.charity.Services.EmailService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class EmailServiceImpl implements EmailService {

    private final HttpServletRequest request;

    private JavaMailSender emailSender;

    @Autowired
    public EmailServiceImpl(JavaMailSender emailSender, HttpServletRequest request) {
        this.emailSender = emailSender;
        this.request = request;
    }

    public void sendContactForm(String name, String surname, String text) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo("charity.app11@gmail.com");
        message.setSubject("New email from " + name + " " + surname);

        message.setText(text);
        emailSender.send(message);

    }

    public void sendActivationMail(User user, VerificationToken token) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(user.getUsername());

        message.setSubject("Account activation");

        String text = request.getRemoteAddr() + "/confirmRegister?token=" + token.getToken();
        message.setText(text);

        emailSender.send(message);
    }

    @Override
    public void sendPasswordResetLink(User user, PasswordResetToken byUser) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(user.getUsername());

        message.setSubject("Password reset");

        String text = request.getRemoteAddr() + "/passwordreset?token=" + byUser.getToken();

        message.setText(text);

        emailSender.send(message);
    }


}
