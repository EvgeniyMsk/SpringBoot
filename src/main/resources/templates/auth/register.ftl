<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <div class="tester">
        <fieldset>
            <form name="user" action="/signUp" method="post" style="font-size: xx-large; color: white">
                <#--            Firstname-->
                <div>
                    <@spring.bind "user.firstname"></@spring.bind>
                    <div>
                        <@spring.showErrors "firstname" "color: red; font-size: xx-large;"></@spring.showErrors>
                    </div>
                    <label for="username"><@spring.messageText "firstname" "Firstname"></@spring.messageText></label>
                    <input type="text" name="firstname" id="username">
                </div>

                <#--            Lastname-->
                <div>
                    <@spring.bind "user.lastname"></@spring.bind>
                    <div>
                        <@spring.showErrors "lastname" "color: red; font-size: xx-large;"></@spring.showErrors>
                    </div>
                    <label for="lastname"><@spring.messageText "lastname" "Lastname"></@spring.messageText></label>
                    <input type="text" name="lastname" id="lastname">
                </div>

                <#--            Email-->
                <div>
                    <@spring.bind "user.email"></@spring.bind>
                    <div>
                        <@spring.showErrors "lastname" "color: red; font-size: xx-large;"></@spring.showErrors>
                    </div>
                    <label for="email"><@spring.messageText "email" "E-mail"></@spring.messageText></label>
                    <input type="text" name="email" id="email">
                </div>

                <#--            Phone-->
                <div>
                    <@spring.bind "user.phone"></@spring.bind>
                    <div>
                        <@spring.showErrors "phone" "color: red; font-size: xx-large;"></@spring.showErrors>
                    </div>
                    <label for="phone"><@spring.messageText "phone" "Phone"></@spring.messageText></label>
                    <input type="text" name="phone" id="phone">
                </div>

                <div>
                    <@spring.bind "user.password"></@spring.bind>
                    <div>
                        <@spring.showErrors "password" "color: red; font-size: xx-large;"></@spring.showErrors>
                    </div>
                    <label for="password"><@spring.messageText "password" "Password"></@spring.messageText></label>
                    <input type="password" name="password" id="password">
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit"><@spring.messageText "signUp" "Sign Up"></@spring.messageText></button>
            </form>
        </fieldset>
    </div>
</@common.page>