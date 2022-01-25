<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Профиль пользователя</title>
</head>
<body>
<form method="post" action="/logout">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Выйти</button>
</form>

<a href="/">На главную</a>
<div>
    ${user}
</div>
</body>
</html>