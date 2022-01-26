<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <fieldset>
        <form method="post" action="/signIn">
            <label for="username"><@spring.messageText "username" "Username"></@spring.messageText></label>
            <input type="text" name="username" id="username">
            <label for="password"><@spring.messageText "password" "Password"></@spring.messageText></label>
            <input type="password" name="password" id="password">
            <label for="remember-me"><@spring.messageText "rememberme" "Remember Me"></@spring.messageText></label></label>
            <input type="checkbox" name="remember-me" id="remember-me"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit"><@spring.messageText "signIn" "Sign In"></@spring.messageText></button>
        </form>
    </fieldset>
</@common.page>