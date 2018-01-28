$(document).on('turbolinks:load',function(){

  $(".ProfileTweet-actionButton.delete").on("click", function(e){
    e.preventDefault();

    $.ajax({
      type: "DELETE",
      url: "/tweets",
      data: { tweet_id: $(this).prev().attr("value") },
      dataType: "json"
    })
    .done(function(data){
      window.location = data.redirect;
    })
    .fail(function(){
      alert("ツイートの削除に失敗しました");
    });
  });

});

