<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<form method="post" action="/logout">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Выйти</button>
</form>

<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <div>
        ${user}
    </div>
</@common.page>