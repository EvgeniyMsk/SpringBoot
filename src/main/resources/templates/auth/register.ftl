<#import "/spring.ftl" as spring/>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<fieldset>
<form name="user" action="/register" method="post">
    <label for="username">Логин</label>
    <input type="text" name="username" id="username">
    <label for="password">Пароль</label>
    <input type="password" name="password" id="password">
    <button type="submit">Регистрация</button>
</form>
</fieldset>
</body>
</html>