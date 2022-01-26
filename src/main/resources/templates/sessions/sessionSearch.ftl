<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <div>
        <@spring.messageText "sessionSearch" "Search cinema sessions"></@spring.messageText>
    </div>
</@common.page>