<#import "/spring.ftl" as spring/>
<#import "../../macros/common.ftl" as common>
<@common.page>
<form method="post" action="/logout">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Выйти</button>
</form>

<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <table>
        <tr>
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
</@common.page>