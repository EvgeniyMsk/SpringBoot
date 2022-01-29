<#import "/spring.ftl" as spring/>
<#import "../templates/macros/common.ftl" as c>
<@c.page>
    <main>
            <div>
                    <h1 class="header"><a class="header" href="https://projects.intra.42.fr/projects/springboot">SpringBoot.</a> Школа 21, Московский кампус.</h1>
                    <h2 class="header">Авторы: <a class="header" href="https://profile.intra.42.fr/users/qsymond">Qsymond</a> и <a class="header" href="https://profile.intra.42.fr/users/pcharlot">Pcharlot</a></h2>
            </div>
            <div class="tester">
                    <a class="main" href="/admin/panel/halls" style="opacity: revert">[Admin] <@spring.messageText "cinemaHall" "Cinema halls"></@spring.messageText></a>
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
            </div>
    </main>
</@c.page>