<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
    <a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <div class="tester">
        <img src="/profile/photo/${filename}" onerror="this.onerror=null;this.src='/img/image.png';">
    </div>
</@common.page>