<#import "/spring.ftl" as spring/>
<#import "../macros/common.ftl" as common>
<@common.page>
<a href="/"><@spring.messageText "toMainPage" "To main page"></@spring.messageText></a>
    <main>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <div class="col" id="main">

            <div class="d1">
                <form>
                    <label id="count" style="background-color: black; color: white; font-size: xx-large"><@spring.messageText "found" "Found"></@spring.messageText>: </label>
                    <input type="text" id="search" placeholder="<@spring.messageText "typeSearchQuery" "Type search query"></@spring.messageText>" style="width: 30%; font-size: xx-large">
                </form>
            </div>
            <script>
                $(document).ready(function() {
                    var $result = $('#search_box-result');
                    var table = document.createElement("table");
                    $('#search').on('keyup', function(){
                        var search = $(this).val();
                        if ((search !== '') && (search.length > 1)){
                            $.ajax({
                                type: "get",
                                url: "/sessions/search",
                                data: {'filmName': search},
                                success: function(msg){
                                    var el = document.getElementById("count");
                                    el.innerText='<@spring.messageText "found" "Found"></@spring.messageText>: ' + msg.length;
                                    table.remove();
                                    table = document.createElement("table");
                                    table.style.width  = '40%';
                                    table.style.border = '1px solid black';
                                    table.style.textAlign = 'center';
                                    table.style.margin = 'auto';
                                    const tr = table.insertRow();
                                    const td1 = tr.insertCell();
                                    const td2 = tr.insertCell();
                                    const td3 = tr.insertCell();
                                    td1.appendChild(document.createTextNode('<@spring.messageText "sessionDateTime" "Cinema session date/time"></@spring.messageText>'));
                                    td2.appendChild(document.createTextNode('<@spring.messageText "cinemaForSession" "Movie"></@spring.messageText>'));
                                    td3.appendChild(document.createTextNode('<@spring.messageText "filmImage" "Film picture"></@spring.messageText>'));
                                    table.border = '3';
                                    // table.style = 'margin-left: auto; margin-right: auto; text-align: center; color: black; background-color: darkgrey;';
                                    for (var i = 0; i < msg.length; i++)
                                    {
                                        var trr = table.insertRow();
                                        var tdd1 = trr.insertCell();
                                        var tdd2 = trr.insertCell();
                                        var tdd3 = trr.insertCell();
                                        var href = document.createElement("a");
                                        var image = document.createElement("img");
                                        href.className='link-success';
                                        href.href = "/sessions/" + msg[i].id;
                                        href.innerText = msg[i].movieDao.name;
                                        image.src = '/films/' + msg[i].movieDao.id + '/image';
                                        image.onerror = function () {
                                            image.src = '/img/image.png';
                                        }
                                        image.style.width = '150px';
                                        image.style.height = '100px';
                                        tdd1.appendChild(document.createTextNode(msg[i].dateTime));
                                        tdd2.appendChild(href);
                                        tdd3.appendChild(image);
                                    }
                                    document.getElementById("main").appendChild(table);
                                    if(msg !== ''){
                                        $result.fadeIn();
                                    } else {
                                        $result.fadeOut(100);
                                    }
                                }
                            });
                        } else {
                            $result.html('');
                            $result.fadeOut(100);
                        }
                    });
                    $(document).on('click', function(e){
                        if (!$(e.target).closest('.search_box').length){
                            $result.html('');
                            $result.fadeOut(100);
                        }
                    });
                });
            </script>
        </div>
        </div>
    </main>
</@common.page>