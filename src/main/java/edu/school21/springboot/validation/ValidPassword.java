package edu.school21.springboot.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.PARAMETER, ElementType.TYPE_USE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordValidator.class)
@Documented
public @interface ValidPassword {
    String message() default "{password.validation}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
