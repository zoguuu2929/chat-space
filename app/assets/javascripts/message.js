$(function() {
  // メッセージ送信情報を追加していく関数
  function buildHTML(message) {
    var imageHtml = "";

    if (message.image) {
      imageHtml = '<img class="chat-main__body--message-image" src="' + message.image + '">'
    }

    var html =
    '<div class="chat-main__body--message">' +
      '<div class="chat-main__body--message-name">' +
          message.user +
      '</div>' +
      '<div class="chat-main__body--message-time">' +
          message.created_at +
      '</div>' +
      '<div class="chat-main__body--message-body">' +
          message.text +
      '</div>' +
      '\n' +
      imageHtml
    '</div>'
    return html;
  }

  $('#new_message').on('submit', function(e) {
    // HTMLでの送信をキャンセル
    e.preventDefault();
    var form = $('#new_message');
    var $this = $(this);
    //追記部分
    $('#chat-main__footer__send-btn').removeAttr('data-disable-with');

    // フォームに入力された値を取得
    var fd = new FormData($this.get(0));

    $.ajax({
      type: form.attr('method'), // フォーム要素("post")を取得
      url: form.attr('action'), // フォーム要素("/chat_group/chat_group_id/messages")を取得
      data: fd,
      contentType : false,
      processData : false,
      dataType: 'json'
    })
      // サーバーから値が正しく返ってきた場合
      .done(function(data) {
        var html = buildHTML(data);
        $('.chat-main__body--message').append(html);
        $this.get(0).reset();
      })
      // 正しく返ってこなかった場合
      .fail(function() {
        alert('メッセージを送信できません');
      });
  });
});
