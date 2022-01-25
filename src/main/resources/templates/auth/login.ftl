<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form method="post" action="/login">
    <label for="username">Логин</label>
    <input type="text" name="username" id="username">
    <input type="password" name="password" id="password">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Авторизация</button>
</form>
</body>
</html>