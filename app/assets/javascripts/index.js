$(document).on('turbolinks:load', function(){

  function buildHTML(message) {
    //console.log("html");でbuildHTMLが呼べているか確認
    // console.log(message.image.url);でimageのurlがあるか確認
    var html = `<div class ="chat__main__first-content" data-message-id=${message.id}>
                  <div class ="chat__main__first-content__list">
                    <div class ="chat__main__first-content__list__name">
                      ${message.user}
                    </div>
                    <div class = "chat__main__first-content__list__time">
                      ${message.time}
                    </div>
                  </div>
                  <div class = "chat__main__first-content__message">
                      ${message.body}
                  </div>`

                  // 表示されないのは変数のせい？と思ったら文字列にして確認
              html +=
                  (message.image.url) ?
                    (
                      `<div class= chatspace-content__chat> <img src= "${message.image.url}"></div></div>`
                    ):
                    (
                      `</div>`
                    );
                  return html;
  }
  setInterval(function(){
    var last_message_id = $('.chat__main__first-content').last().data('message-id');
    $.ajax({
      url : location.href,
      type: "GET",
      dataType: 'json',
      data: {
        id: last_message_id
      },
    })
    .done(function(data) {
      // console.log(data);で値取れてるか確認

      // var last_message_id = $('.chat__main__first-content').last().data('message-id');
      data.forEach (function(message) {
        // console.log(message);で取れてるか確認
          var html = buildHTML(message)
            $(".chat__box").append(html);
            console.log("a");
          $('.chat__box').animate({scrollTop: $('.chat__box')[0].scrollHeight}, 'fast');
            console.log("b");
      });
    });
  }, 5000 );
})


//   // 自動更新
//   setInterval(function(){
//     $.ajax({
//       url :url,
//       type: "GET",
//       dataType: 'json',
//       processData: false,
//       contentType: false,
//     })
//     .done(function(data){
//       $.each(data, function(i, message) {
//       console.log(data);
//       // console.log('ajax化成功')でajax化できているか確認
//       var html = buildHTML(data);
//       $('.chat__box').append(html);
//       $('.chat__box').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast');
//       $('#message_field').val('');
//     })
//     .fail(function(data) {
//       // alert('メッセージを入力してください');
//     });
//   }, 5000 );
// });
