<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<form method="post" action="/logout">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit"><@spring.messageText "logout" "Logout"></@spring.messageText></button>
</form>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <table border="3">
        <tr>
            <th>
                <@spring.messageText "Photo" "Photo"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "firstname" "Firstname"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "lastname" "Lastname"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "email" "E-mail"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "phone" "Phone"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "password" "Password"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "roles" "Roles"></@spring.messageText>
            </th>
            <th>
                <@spring.messageText "account" "Account"></@spring.messageText>
            </th>
        </tr>
        <tr>
            <td>
                <img src="/profile/avatar" style="height: 100px; width: 150px;" onerror="this.onerror=null;this.src='/img/image.png';">
                <form method="post" action="/profile/avatar" enctype="multipart/form-data">
                    <input type="file" name="file" accept="image/*" id="files" hidden>
                    <label for="files"><@spring.messageText "selectfile" "Change photo"></@spring.messageText></label>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div>
                        <button type="submit"><@spring.messageText "download" "Download"></@spring.messageText></button>
                    </div>
                </form>
            </td>
            <td>
                ${user.firstname}
            </td>
            <td>
                ${user.lastname}
            </td>
            <td>
                ${user.email}
            </td>
            <td>
                ${user.phone}
            </td>
            <td>
                ${user.password}
            </td>
            <td>
                <#list user.roles as item>
                    <div>
                        ${item}
                    </div>
                </#list>
            </td>
            <td>
                <#if user.isConfirmed()==true>
                    <div style="color: green">
                        <@spring.messageText "accountisconfirmed" "Account is confirmed :)"></@spring.messageText>
                    </div>
                <#else>
                    <div style="color: red">
                        <@spring.messageText "accountisnotconfirmed" "Account is not confirmed :("></@spring.messageText>
                    </div>
                </#if>
            </td>
        </tr>
    </table>
    <h1 class="main"><@spring.messageText "AuthHistory" "Auth history"></@spring.messageText></h1>
    <div>
        <table border="3">
            <tr>
                <th>
                    <@spring.messageText "dateofauth" "Date of authorization"></@spring.messageText>
                </th>
                <th>
                    <@spring.messageText "typeofauth" "Type of authorization"></@spring.messageText>
                </th>
                <th>
                    <@spring.messageText "addressofauth" "IP-address"></@spring.messageText>
                </th>
            </tr>
            <#list user.authHistory as iterAuth>
                <tr>
                    <td>
                        ${iterAuth.time}
                    </td>
                    <td>
                        ${iterAuth.type}
                    </td>
                    <td>
                        ${iterAuth.address}
                    </td>
                </tr>
            </#list>
        </table>
    </div>
    <h1 class="main"><@spring.messageText "AvatarHistory" "Avatar history"></@spring.messageText></h1>
    <div>
        <table border="3">
            <tr>
                <th>
                    <@spring.messageText "href" "IP-address"></@spring.messageText>
                </th>
            </tr>
            <#list listFiles as filesIter>
                <tr>
                    <td>
                        <a href="/profile/photo/${filesIter}/show">${filesIter}</a>
                    </td>
                </tr>
            </#list>
        </table>
    </div>
</@common.page>