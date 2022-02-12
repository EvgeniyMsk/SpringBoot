<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <div class="tester">
            <div class="cinemaSessions">
                <h1 class="main">Просмотр сеанса</h1>
                <table border="3">
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Дата/Время
                        </th>
                        <th>
                            Кинозал
                        </th>
                        <th>
                            Фильм
                        </th>
                        <th>
                            Цена билета
                        </th>
                    </tr>
                    <tr>
                        <td>
                            ${cinemaSession.id}
                        </td>
                        <td>
                            ${cinemaSession.getDate()}
                        </td>
                        <td>
                            Зал №${cinemaSession.movieHall.id}, ${cinemaSession.movieHall.seatsCount} посадочных мест
                        </td>
                        <td>
                            <div>
                                ${cinemaSession.movie.title}
                            </div>
                            <div>
                                <#if cinemaSession.movie.hasImage == true>
                                    <img src='/films/${cinemaSession.movie.id}/image' style="height: 100px; width: 150px;">
                                </#if>
                                <#if cinemaSession.movie.hasImage == false>
                                    <img src="/img/image.png" style="height: 100px; width: 150px;">
                                </#if>
                            </div>
                            <div>
                                ${cinemaSession.movie.description}
                            </div>
                        </td>
                        <td>
                            ${cinemaSession.ticketCost}
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </main>
</@common.page>