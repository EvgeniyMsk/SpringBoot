<#import "/spring.ftl" as spring/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form method="post" action="/signIn">
    <label for="username">Логин</label>
    <input type="text" name="username" id="username">
    <label for="password">Пароль</label>
    <input type="password" name="password" id="password">
    <label for="remember-me">Запомнить меня</label>
    <input type="checkbox" name="remember-me" id="remember-me"/>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Авторизация</button>
</form>
</body>
</html>