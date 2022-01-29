<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <#if message??><p>${message}</p></#if>
    <div class="tester">
        <fieldset>
            <form method="post" action="/signIn" style="font-size: xx-large">
                <label for="username"><@spring.messageText "firstname" "Firstname"></@spring.messageText></label>
                <input type="text" name="username" id="username">
                <label for="password"><@spring.messageText "password" "Password"></@spring.messageText></label>
                <input type="password" name="password" id="password">
                <label for="remember-me"><@spring.messageText "rememberme" "Remember Me"></@spring.messageText></label>
                <input type="checkbox" name="remember-me" id="remember-me"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit"><@spring.messageText "signIn" "Sign In"></@spring.messageText></button>
            </form>
        </fieldset>
    </div>
</@common.page>