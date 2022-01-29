<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <div class="tester">
            <form method="post" action="/admin/panel/sessions/${cinemaSession.id}/update" style="margin-top: 10%">
                <label style="background-color: darkgray" for="date"><@spring.messageText "sessionDateTime" "Cinema session date/time"></@spring.messageText></label>
                <input id="date" type="datetime-local" name="cinemaSessionDateTime" value="${cinemaSession.getDateToEdit()}" required>
                <label style="background-color: darkgray" for="movieHall"><@spring.messageText "cinemaHallforSession" "Cinema hall"></@spring.messageText></label>
                <select id="movieHall" name="movieHallId">
                    <#list movieHalls as iterMovieHall>
                        <option value="${iterMovieHall.id}"><@spring.messageText "cinemaHallforSession" "Cinema hall"></@spring.messageText> №${iterMovieHall.id}, ${iterMovieHall.seatsCount} <@spring.messageText "seatsCount" "Count of seats"></@spring.messageText></option>
                    </#list>
                </select>
                <label style="background-color: darkgray" for="movie"><@spring.messageText "cinemaForSession" "Movie"></@spring.messageText></label>
                <select id="movie" name="movieId">
                    <#list movies as iterMovie>
                        <option value="${iterMovie.id}">${iterMovie.title}</option>
                    </#list>
                </select>
                <label style="background-color: darkgray" for="ticketCost"><@spring.messageText "ticketPrice" "Ticket price"></@spring.messageText></label>
                <input type="text" id="ticketCost" name="ticketCost" value="${cinemaSession.ticketCost}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div>
                    <button type="submit" style="width: 30%; height: 7%; font-size: xx-large"><@spring.messageText "update" "Update"></@spring.messageText></button>
                </div>
            </form>
        </div>
    </main>
</@common.page>