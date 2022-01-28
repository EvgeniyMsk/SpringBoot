<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <h1 class="main"><@spring.messageText "movieChat" "Movie chat"></@spring.messageText></h1>
        <script>
            let movieId = ${movie.id};
            let cinemausername = '${cinemausername}';
        </script>
        <div>
            <table border="3" style="text-align: center; background-color: darkgrey">
                <tr>
                    <th>
                        <@spring.messageText "filmImage" "Film picture"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "filmTitle" "Film title"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "releaseDate" "Date of release"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "restrictions" "Restrictions"></@spring.messageText>
                    </th>
                    <th>
                        <@spring.messageText "description" "Description"></@spring.messageText>
                    </th>
                </tr>
                <tr>
                    <td>
                        <div>
                            <#if movie.hasImage == true>
                                <img src='/films/${movie.id}/image' style="height: 100px; width: 150px;">
                            </#if>
                            <#if movie.hasImage == false>
                                <img src="/img/image.png" style="height: 100px; width: 150px;">
                            </#if>
                        </div>
                    </td>
                    <td>
                        ${movie.title}
                    </td>
                    <td>
                        ${movie.formatDate()}
                    </td>
                    <td>
                        ${movie.restrictions}
                    </td>
                    <td>
                        ${movie.description}
                    </td>
                </tr>
            </table>
        </div>
        <div id="chat-page" class="chat" style="background-color: #9E9C9C">
            <div id="messageArea" style="overflow: auto"></div>
        </div>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="<@spring.messageText "typeMessage" "Type a message..."></@spring.messageText>" autocomplete="off" class="form-control"/>
                    <button type="submit" class="primary"><@spring.messageText "send" "Send"></@spring.messageText></button>
                </div>
            </div>
        </form>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="/js/chat.js"></script>
    </main>
</@common.page>