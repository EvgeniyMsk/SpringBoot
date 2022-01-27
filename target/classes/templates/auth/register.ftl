<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <fieldset>
        <form name="user" action="/signUp" method="post">
            <#--            Firstname-->
            <div>
                <@spring.bind "user.firstname"></@spring.bind>
                <label for="username"><@spring.messageText "firstname" "Firstname"></@spring.messageText></label>
                <input type="text" name="firstname" id="username">
                <@spring.showErrors "firstname" "color: red;"></@spring.showErrors>
            </div>
            <#--            Lastname-->
            <div>
                <@spring.bind "user.lastname"></@spring.bind>
                <label for="lastname"><@spring.messageText "lastname" "Lastname"></@spring.messageText></label>
                <input type="text" name="lastname" id="lastname">
                <@spring.showErrors "lastname" "color: red;"></@spring.showErrors>
            </div>

            <#--            Email-->
            <div>
                <@spring.bind "user.email"></@spring.bind>
                <label for="email"><@spring.messageText "email" "E-mail"></@spring.messageText></label>
                <input type="text" name="email" id="email">
                <@spring.showErrors "lastname" "color: red;"></@spring.showErrors>
            </div>

            <#--            Phone-->
            <div>
                <@spring.bind "user.phone"></@spring.bind>
                <label for="phone"><@spring.messageText "phone" "Phone"></@spring.messageText></label>
                <input type="text" name="phone" id="phone">
                <@spring.showErrors "phone" "color: red;"></@spring.showErrors>
            </div>

            <div>
                <@spring.bind "user.password"></@spring.bind>
                <label for="password"><@spring.messageText "password" "Password"></@spring.messageText></label>
                <input type="password" name="password" id="password">
                <@spring.showErrors "password" "color: red;"></@spring.showErrors>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit"><@spring.messageText "signUp" "Sign Up"></@spring.messageText></button>
        </form>
    </fieldset>
</@common.page>