<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <div class="tester">
            <form method="post" action="/admin/panel/films/${movie.id}/update" enctype="multipart/form-data" style="margin-top: 5%">
                <table border="3">
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
                            <label for="files"><@spring.messageText "selectfile" "Change photo"></@spring.messageText></label>
                            <input type="file" name="file" accept="image/*" id="files" hidden>
                        </td>
                        <td>
                            <input name="title" value="${movie.title}" required>
                        </td>
                        <td>
                            <input id="releaseDate" type="date" pattern="yyyy-MM-dd" name="releaseDate" value="${movie.formatDate()}" required>
                        </td>
                        <td>
                            <input name="restrictions" value="${movie.restrictions}" required>
                        </td>
                        <td>
                            <input name="description" value="${movie.description}" required>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" style="width: 30%; height: 7%; font-size: xx-large"><@spring.messageText "update" "Update"></@spring.messageText></button>
            </form>
        </div>
    </main>
</@common.page>