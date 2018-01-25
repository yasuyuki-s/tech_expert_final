$(document).on('turbolinks:load',function(){

  $(".ProfileTweet-actionButton").on("click", function(e){
    e.preventDefault();
    parent_wrapper = $(this).closest(".ProfileTweet-action");
    retweet_count = $(this).children("span");
    if(parent_wrapper.hasClass("ProfileTweet-action--retweet")){
      method = "POST";
    }else{
      method = "DELETE";
    };
    $.ajax({
      type: method,
      url: "/retweet_relationships/",
      data: { tweet_id: $(this).prev().attr("value") },
      dataType: "json"
    })
    .done(function(data){
      retweet_count.text(data.retweet_count);
      console.log(data.retweet_count);
      parent_wrapper.toggleClass("ProfileTweet-action--retweet");
      parent_wrapper.toggleClass("ProfileTweet-action--retweeting");
    })
    .fail(function(){
      alert("リツイートに失敗しました");
    });
  });

});

