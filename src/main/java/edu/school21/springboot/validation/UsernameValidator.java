package edu.school21.springboot.validation;

import edu.school21.springboot.models.User;
import edu.school21.springboot.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class UsernameValidator implements ConstraintValidator<ValidUsername, String> {
    @Autowired
    private UserService userService;

    @Override
    public void initialize(ValidUsername constraintAnnotation) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return userService.getUserByFirstname(s) == null;
    }
}
