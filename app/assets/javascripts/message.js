$(document).on('turbolinks:load', function(){

  function buildHTML(message) {
    //console.log("html");
    // buildHTMLが呼べているか？
    if message.image.url
    // console.log(message.image.url);
    // imageのurlがあるか？
    var html = `<div class ="chat__main__first-content">
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
                  </div>
                  <div class = "chat__main__first-content__image">
                      ${message.image}
                  </div>`
    return html;
  };

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    // console.log(url);
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      // console.log('ajax化')
      var html = buildHTML(data);
      $('.chat__box').append(html)
      $('#message_fild').val('')
    })
    .fail(function(data) {
      alert('メッセージを入力してください');
    });
    return false;
  });
});

// AJAXの流れ
// 1.sumbit押すとAjax発火
// ('#new_message').on('submit', function(e)
//
// 2.JSの処理へ
// 同期送信の中止
// e.preventDefault();
// formに入力されたデータの取得
// var formData = new FormData(this);
// 取得データからaction属性を取ってきて、その値を変数urlとして扱う
// var url = $(this).attr('action')
// ajaxを使ってjson形式でデータを送る
// $.ajax〜
//
// 3.message_controllerの#createアクションへ
//
// 4.done(function(data)
// function buildHTML(message)の内容を実行
// ※turblinks対応の記述
// turblinksはCSSとJSをまとめて持ってきて保持する（動作が早くなるため）がHTMLは持っていかない
// JQにはHTMLが必要なため１回目は読み込まず２回目以降（リロード）すると読み込む
// $(document).on('turbolinks:load'
// もしくはapplication.jsの//= require turbolinksを消す
