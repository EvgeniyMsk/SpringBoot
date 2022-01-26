package edu.school21.springboot.filter;

import edu.school21.springboot.models.roles.ERole;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginPageFilter extends GenericFilterBean {

    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (isAuthenticated() && ("/signIn".equals(servletRequest.getRequestURI()) ||
                ("/signUp".equals(servletRequest.getRequestURI())))) {
            String encodedRedirectURL;
            if (authentication.getAuthorities().contains(new SimpleGrantedAuthority(ERole.ROLE_ADMIN.toString())))
            {
                encodedRedirectURL = ((HttpServletResponse) response).encodeRedirectURL(
                        servletRequest.getContextPath() + "/admin/panel/halls");
            } else {
                encodedRedirectURL = ((HttpServletResponse) response).encodeRedirectURL(
                        servletRequest.getContextPath() + "/profile");
            }
            servletResponse.setStatus(HttpStatus.TEMPORARY_REDIRECT.value());
            servletResponse.setHeader("Location", encodedRedirectURL);
        }
        chain.doFilter(servletRequest, servletResponse);
    }
}
