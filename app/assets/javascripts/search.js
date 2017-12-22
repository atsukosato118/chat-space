$(document).on('turbolinks:load', function(){

  $("#user-search-field").on("keyup", function(e) {
  e.preventDefault();
    var input = $("#user-search-field").val();
    // console.log(input);でフォームに入力した値が出力されるか確認
    // console.log(this);でformDataの中身を確認
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(users) {
      // console.log(users)でjsonが帰って来ているか？
      $("#user-search-field").empty();
      if (users.length !== 0) {

        users.forEach( function(user){
           appendUser(user);
        });
        }
        else {
          appendNoUser("該当するユーザーは存在しません");
        }
    })
    .fail(function() {
      alert('検索に失敗しました');
    });
    return false;
    //   console.log('ajax化成功')
    //   $("#user-search-field").empty();
    //   if (users.length !== 0) {
    //     users.forEach(function(user){
    //       appendUser(user);
    //     });
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
