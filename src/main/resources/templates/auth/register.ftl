<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<fieldset>
    <form name="user" action="/signUp" method="post">
        <label>Логин</label>
        <input type="text" name="username">
        <label>Пароль</label>
        <input type="password" name="password">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Регистрация</button>
    </form>
</fieldset>
</@common.page>