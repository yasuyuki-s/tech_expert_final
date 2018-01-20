$(document).on('turbolinks:load',function(){

  $("#tweet-image-choose-button").on("click",function(e){
    e.preventDefault();
    $("#tweet_image").click();
  });

  $("#tweet-image-choose-modal-button").on("click",function(e){
    e.preventDefault();
    $("#tweet_image_modal").click();
  });

});
