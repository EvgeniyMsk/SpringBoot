<#import "/spring.ftl" as spring/>
<#import "../templates/macros/common.ftl" as c>
<@c.page>
    <main>
        <fieldset>
            <a class="main" href="/admin/panel/halls">[Admin] <@spring.messageText "cinemaHall" "Cinema halls"></@spring.messageText></a>
            <br>
            <a class="main" href="/admin/panel/films">[Admin] <@spring.messageText "cinema" "Cinemas"></@spring.messageText></a>
            <br>
            <a class="main" href="/admin/panel/sessions">[Admin] <@spring.messageText "sessions" "Cinema sessions"></@spring.messageText></a>
            <br>
            <a class="main" href="/session/search"><@spring.messageText "sessionSearch" "Search cinema sessions"></@spring.messageText></a>
            <br>
            <a class="main" href="/profile"><@spring.messageText "profile" "User's profile"></@spring.messageText></a>
            <br>
            <a class="main" href="/signIn"><@spring.messageText "signIn" "Sign In"></@spring.messageText></a>
            <br>
            <a class="main" href="/signUp"><@spring.messageText "signUp" "Sign Up"></@spring.messageText></a>
            <br>
            <a class="main" href="/films"><@spring.messageText "toFilms" "Films list"></@spring.messageText></a>
        </fieldset>
    </main>
</@c.page>