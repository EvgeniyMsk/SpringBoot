<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <div class="tester">
            <div class="halls">
                <h1 class="main"><@spring.messageText "cinemaHall" "Cinema halls"></@spring.messageText></h1>
                <table border="3" style="text-align: center; color: black; background-color: darkgrey">
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            <@spring.messageText "seatsCount" "Count of seats"></@spring.messageText>
                        </th>
                        <th>
                            <@spring.messageText "edit" "Edit"></@spring.messageText>
                        </th>
                    </tr>
                    <#list movieHalls as moviehall>
                        <tr>
                            <td>
                                ${moviehall.id}
                            </td>
                            <td>
                                ${moviehall.seatsCount}
                            </td>
                            <td>
                                <a href="/admin/panel/halls/${moviehall.id}"><@spring.messageText "edit" "Edit"></@spring.messageText></a>
                                <form method="post" action="/admin/panel/halls/${moviehall.id}/delete">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" value="<@spring.messageText "delete" "Delete"></@spring.messageText>">
                                </form>
                            </td>
                        </tr>
                    </#list>
                </table>

            </div>
            <div class="addHalls">
                <form method="post" action="/admin/panel/halls">
                    <label for="seatsCount" style="background-color: darkgray"><@spring.messageText "seatsCount" "Count of seats"></@spring.messageText></label>
                    <input type="number" name="seatsCount" id="seatsCount" required>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit"><@spring.messageText "add" "Add"></@spring.messageText></button>
                </form>
            </div>
        </div>
    </main>
</@common.page>