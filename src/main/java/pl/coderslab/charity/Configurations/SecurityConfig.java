package pl.coderslab.charity.Configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import pl.coderslab.charity.Services.MySimpleUrlAuthenticationSuccessHandler;

import javax.sql.DataSource;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    final
    DataSource dataSource;

    private final UserDetailsService userDetailsService;

    @Autowired
    public SecurityConfig(DataSource dataSource, @Qualifier("myUserDetailsService") UserDetailsService userDetailsService) {
        this.dataSource = dataSource;
        this.userDetailsService = userDetailsService;
    }

    @Bean("authenticationManager")
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    };

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                .authorizeRequests()
                .antMatchers("/resources/css/fontawesome/css/**")
                    .permitAll()
                .antMatchers("/", "/passwordreset", "/confirmRegister", "/resetpassword", "/contact", "/register","/login", "/loginAction", "/resources/css/**", "/resources/js/**", "/resources/images/**","/resources/fontawesome/**")
                    .permitAll()
                .antMatchers("/admin/**")
                    .access("hasAuthority('ADMIN')")
                .anyRequest()
                    .authenticated()
                .and()
                    .formLogin()
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .failureUrl("/login?error")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .successHandler(myAuthenticationSuccessHandler())
                .and()
                    .logout()
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                .and()
                    .exceptionHandling()
                        .accessDeniedPage("/login")
                .and()
                    .csrf()
                        .disable();
    }
}


//https://www.baeldung.com/spring-security-authentication-with-a-database
//https://www.baeldung.com/spring_redirect_after_login