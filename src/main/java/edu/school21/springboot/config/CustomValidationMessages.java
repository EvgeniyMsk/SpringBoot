package edu.school21.springboot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.DefaultMessageCodesResolver;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
public class CustomValidationMessages {
    private final MessageSource messageSource;

    @Autowired
    public CustomValidationMessages(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @Bean
    public LocalValidatorFactoryBean getValidator() {
        LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
        bean.setValidationMessageSource(messageSource);
        return bean;
    }

    @Bean
    public MessageCodesResolver messageCodesResolver() {
        DefaultMessageCodesResolver messageCodesResolver = new DefaultMessageCodesResolver();
        messageCodesResolver.setMessageCodeFormatter(DefaultMessageCodesResolver.Format.POSTFIX_ERROR_CODE);
        return messageCodesResolver;
    }
}
