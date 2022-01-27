package edu.school21.springboot.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class PasswordValidator implements ConstraintValidator<ValidPassword, String> {

    @Override
    public void initialize(ValidPassword constraintAnnotation) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$";
        return s.matches(pattern);
    }
}
