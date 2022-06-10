function toRu() {
    document.cookie='language=ru;path=/;max-age=60;'
    window.location.replace("?lang=ru");
}
function toEn() {
    document.cookie='language=en;path=/;max-age=60;'
    window.location.replace("?lang=en");
}