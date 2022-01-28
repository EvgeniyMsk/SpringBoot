<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
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
                <th>
                    <@spring.messageText "edit" "Edit"></@spring.messageText>
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
                        ${iterMovie.title}
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
                    <td>
                        <a href="/admin/panel/films/${iterMovie.id}"><@spring.messageText "edit" "Edit"></@spring.messageText></a>
                        <form method="post" action="/admin/panel/films/${iterMovie.id}/delete">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="<@spring.messageText "delete" "Delete"></@spring.messageText>">
                        </form>
                    </td>
                </tr>
            </#list>
        </table>

        <div class="addMovies">
            <form method="post" action="/admin/panel/films" enctype="multipart/form-data">
                <label for="title" style="background-color: darkgray"><@spring.messageText "filmTitle" "Films title"></@spring.messageText></label>
                <input type="text" name="title" id="title" required>
                <label for="releaseDate" style="background-color: darkgray"><@spring.messageText "releaseDate" "Date of release"></@spring.messageText></label>
                <input type="date" pattern="yyyy-MM-dd" name="releaseDate" id="releaseDate" required>
                <label for="restrictions" style="background-color: darkgray"><@spring.messageText "restrictions" "Restrictions"></@spring.messageText></label>
                <input type="number" name="restrictions" id="restrictions" required>
                <label for="description" style="background-color: darkgray"><@spring.messageText "description" "Description"></@spring.messageText></label>
                <input type="text" name="description" id="description" required>
                <label for="files"><@spring.messageText "selectfile" "Change photo"></@spring.messageText></label>
                <input type="file" name="file" accept="image/*" style="background-color: darkgrey" id="files" hidden>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit"><@spring.messageText "add" "Add"></@spring.messageText></button>
            </form>
        </div>
    </main>
</@common.page>