<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <h1 class="main"><@spring.messageText "toFilms" "Films list"></@spring.messageText></h1>
        <table border="3">
            <tr>
                <th>
                    ID
                </th>
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
            <#list movies as iterMovie>
                <tr>
                    <td>
                        ${iterMovie.id}
                    </td>
                    <td>
                        <#if iterMovie.hasImage == true>
                            <img src='/films/${iterMovie.id}/image' style="height: 100px; width: 150px;">
                        </#if>
                        <#if iterMovie.hasImage == false>
                            <img src="/img/image.png" style="height: 100px; width: 150px;">
                        </#if>
                    </td>
                    <td>
                        <p>${iterMovie.title}</p>
                        <a style="text-decoration: darkorange; color: darkred" href="/films/${iterMovie.id}/chat"><@spring.messageText "goToChat" "Go to movie chat"></@spring.messageText></a>
                    </td>
                    <td>
                        ${iterMovie.formatDate()}
                    </td>
                    <td>
                        ${iterMovie.restrictions}
                    </td>
                    <td>
                        ${iterMovie.description}
                    </td>
                </tr>
                </#list>
        </table>
    </main>
</@common.page>