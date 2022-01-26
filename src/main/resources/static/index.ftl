<#import "/spring.ftl" as spring/>
<#import "../templates/macros/common.ftl" as c>
<@c.page>
    <div>
        <a href="/admin/panel/halls">[Admin] <@spring.messageText "cinemaHall" "Cinema halls"></@spring.messageText></a>
    </div>
    <div>
        <a href="/admin/panel/films">[Admin] <@spring.messageText "cinema" "Cinemas"></@spring.messageText></a>
    </div>
    <div>
        <a href="/admin/panel/sessions">[Admin] <@spring.messageText "sessions" "Cinema sessions"></@spring.messageText></a>
    </div>
    <div>
        <a href="/session/search"><@spring.messageText "sessionSearch" "Search cinema sessions"></@spring.messageText></a>
    </div>
    <div>
        <a href="/profile"><@spring.messageText "profile" "User's profile"></@spring.messageText></a>
    </div>
    <div>
        <a href="/signIn"><@spring.messageText "signIn" "Sign Шт"></@spring.messageText></a>
    </div>
    <div>
        <a href="/signIn"><@spring.messageText "signUp" "Sign Up"></@spring.messageText></a>
    </div>
</@c.page>