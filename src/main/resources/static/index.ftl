<#import "/spring.ftl" as spring/>
<#import "../templates/macros/common.ftl" as c>
<@c.page>
    <main>
            <script>
                    if (document.cookie === 'language=ru' && !window.location.toString().endsWith('?lang=ru'))
                            window.location.replace("?lang=ru");
                    if (document.cookie === 'language=en' && !window.location.toString().endsWith('?lang=en'))
                            window.location.replace("?lang=en");
            </script>
            <div>
                    <h1 class="header"><a class="header" href="https://projects.intra.42.fr/projects/springboot">SpringBoot.</a><@spring.messageText "school" "School 21, Moscow campus."></@spring.messageText></h1>
                    <h2 class="header"><@spring.messageText "authors" "Authors: "></@spring.messageText> <a class="header" href="https://profile.intra.42.fr/users/qsymond">Qsymond</a> <@spring.messageText "and" "and"></@spring.messageText> <a class="header" href="https://profile.intra.42.fr/users/tfarenga">Tfarenga</a></h2>
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