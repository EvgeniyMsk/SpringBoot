<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <form method="post" action="/admin/panel/halls/${movieHall.id}/update" style="margin-top: 10%">
            <label for="seatsCount" style="background-color: darkgray"><@spring.messageText "seatsCount" "Count of seats"></@spring.messageText></label>
            <input type="number" name="seatsCount" id="seatsCount" value="${movieHall.seatsCount}" required>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit"><@spring.messageText "update" "Update"></@spring.messageText></button>
        </form>
    </main>
</@common.page>