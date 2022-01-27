<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/js/langChanger.js"></script>
</head>
<body>
<div>
    <button type="submit" onclick="toRu()">Русский</button>
    <button type="submit" onclick="toEn()">English</button>
</div>
<#nested>
</body>
</html>
</#macro>