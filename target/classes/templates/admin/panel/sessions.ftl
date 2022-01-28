<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
<div>
    <main>
        <div class="cinemaSessions">
            <h1 class="main"><@spring.messageText "sessions" "Cinema sessions"></@spring.messageText></h1>
            <table border="3">
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        <@spring.messageText "sessionDateTime" "Cinema session date/time"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "cinemaHallforSession" "Cinema hall"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "cinemaForSession" "Movie"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "ticketPrice" "Ticket price"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "edit" "Edit"></@spring.messageText>
                    </th>
                </tr>
                <#list cinemaSessions as iterCinemaSession>
                    <tr>
                        <td>
                            ${iterCinemaSession.id}
                        </td>
                        <td>
                            ${iterCinemaSession.getDateHtml()}
                        </td>
                        <td>
                            <@spring.messageText "cinemaHallforSession" "Cinema hall"></@spring.messageText> №${iterCinemaSession.movieHall.id}, ${iterCinemaSession.movieHall.seatsCount} <@spring.messageText "seatsCount" "Count of seats"></@spring.messageText>
                        </td>
                        <td>
                            ${iterCinemaSession.movie.title}
                        </td>
                        <td>
                            ${iterCinemaSession.ticketCost}
                        </td>
                        <td>
                            <a href="/admin/panel/sessions/${iterCinemaSession.id}"><@spring.messageText "edit" "Edit"></@spring.messageText></a>
                            <form method="post" action="/admin/panel/sessions/${iterCinemaSession.id}/delete">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" value="<@spring.messageText "delete" "Delete"></@spring.messageText>">
                            </form>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>
        <div class="addCinemaSessions">
            <form method="post" action="/admin/panel/sessions">
                <label style="background-color: darkgray" for="date"><@spring.messageText "sessionDateTime" "Cinema session date/time"></@spring.messageText></label>
                <input id="date" type="datetime-local" pattern="yyyy-MM-dd, HH:mm" name="sessionDateTime" required>
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
                <input type="text" id="ticketCost" name="ticketCost" required>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit"><@spring.messageText "add" "Add"></@spring.messageText></button>
            </form>
        </div>
    </main>
</div>
</@common.page>