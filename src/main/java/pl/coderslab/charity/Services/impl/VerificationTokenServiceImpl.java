package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.VerificationToken;
import pl.coderslab.charity.Repositories.VerificationTokenRepository;
import pl.coderslab.charity.Services.VerificationTokenService;

import java.util.UUID;

@Service
public class VerificationTokenServiceImpl implements VerificationTokenService {

    private final VerificationTokenRepository tokenRepository;

    public VerificationTokenServiceImpl(VerificationTokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    public void setToken(User user){

        String token = UUID.randomUUID().toString();

        VerificationToken verificationToken = new VerificationToken(token, user);

        tokenRepository.save(verificationToken);
    }
}
