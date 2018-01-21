$(document).on('turbolinks:load',function(){

  $("#tweet-image-choose-button").on("click",function(e){
    e.preventDefault();
    $("#tweet_image").click();
  });

  $("#tweet-image-choose-modal-button").on("click",function(e){
    e.preventDefault();
    $("#tweet_image_modal").click();
  });

  $("#tweet_image_modal").change(function(){
    $("#tweet-image-choose-modal-button").toggleClass("isActive");
  });

  $("#tweet_image").change(function(){
    $("#tweet-image-choose-button").toggleClass("isActive");
  });

});
