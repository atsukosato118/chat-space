// turbolinksだけど1回目からjs読み込むように
$(document).on('turbolinks:load', function(){
  // 処理関数を定義
  var search_list = ("#user-search-result");

  function appendUser(user) {
  // インクリメンタルサーチの時に追加するHTML
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${ user.name }</p>
                <a class="user-search-add chat-group-user__btn
                chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                </div>`
    search_list.append(html);
  }

  // userなしの処理
  function appendNoUser(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user_name">${user}</p>
                </div>`
                // ${user}のuserは引数
    search_list.append(html);
  }
   // ajax化するタイミング
  $("#user-search-field").on("keyup", function(e) {
      // 同期通信を止めるて、入力された値を全てとる
    e.preventDefault();
      var input = $("#user-search-field").val();
      // console.log(input);でフォームに入力した値が出力されるか確認
      // console.log(this);でformDataの中身を確認

      // ajax化
      $.ajax({
        type: 'GET',
        url: '/users',
        data: {keyword: input},
        dataType: 'json'
      })

      // ajaxでjsonから値が返った後の処理
      .done(function(users) {
        // console.log(users)でjsonが返って来ているか？
        // 前に検索して表示された結果を消す（しないと前の検索結果にどんどん足される）
        $("#user-search-result").empty();
        // jbuilderから送られてきた配列の情報(今回はusers)によって場合分け

        if (users.length !== 0) {
          users.forEach( function(user){
             appendUser(user);
          });
          }
        else {
            appendNoUser("該当するユーザーは存在しません");
         }
      })

      .fail(function(data) {
        alert('検索に失敗しました');
      });

    $(".chat-group-form__field.clearfix").on("click", "a", function() {

      var user = $(this)
      user_id = user.data('user-id')
      user_name = user.data('user-name')
        addUser(user_id, user_name)
        $(this).parent().remove();
    })
  });
});

// $(document).on('turbolinks:load', function(){
  // リロードしなくてもjsが動くようにする
// $(function()〜について
// 「id名".#user-search-field”の部分のテキストフィールドが
// keyupしたら 、テキストフィールドの文字を取得して変数inputに代入する
// 要素のvalueの値を取得する場合は、
// $("要素名").val();を記述すれば取得できる

// keyupしたら非同期通信行う（同期通信止める）ため
// function(e) {
//    e.preventDefault();の記述を追加
//
// $.ajax({
//   type: 'GET',送り方
//   url: 'users' rakeroutesで確かめる
//   data: { keyword: input },
//   dataType: 'json'
// })

// $(".chat-group-form__field.clearfix").on("click", "a", function() {
//   chat-group-form__field.clearfixのaタグをクリックすると
// var user = $(this)のthisはaタグ

// user_id = user.data('user-id')
// user_name = user.data('user-name')は
// var html = `<div class="chat-group-user clearfix">
//             <p class="chat-group-user__name">${ user.name }</p>
//             <a class="user-search-add chat-group-user__btn
//             chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
//             </div>`
//   $(this).parent()
//   thisの親要素は<div class="chat-group-user clearfix">なのでこれをremoveして空に
