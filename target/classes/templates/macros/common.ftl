<#import "/spring.ftl" as spring/>
<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/js/langChanger.js"></script>
    <link href="/css/<@spring.messageText "css" "index_en.css"></@spring.messageText>" rel="stylesheet" type="text/css">
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