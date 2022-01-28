<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <img src="/profile/photo/${filename}" onerror="this.onerror=null;this.src='/img/image.png';">
</@common.page>