$(document).on('turbolinks:load',function(){
  over_flg = false;
  over_flg2 = false;

  $("#tweet-topbar-button").on("click",function(e){
    e.preventDefault();
    $(".TweetStormDialog").toggle();
  });

  $("#topbar-dropdown-toggle").on("click",function(e){
    e.preventDefault();
    $("#topbar-dropdown-menu").toggle();
  });

  $(".modal-content,#tweet-topbar-button").hover(function(){
    over_flg2 = true;
  }, function(){
    over_flg2 = false;
  });

  $("#topbar-dropdown-menu,#topbar-dropdown-toggle").hover(function(){
    over_flg = true;
  }, function(){
    over_flg = false;
  });
  $("body").on("click",function(){
    if(over_flg == false){
      $("#topbar-dropdown-menu").hide();
    }
    if(over_flg2 == false){
      $(".TweetStormDialog").hide();
    }
  });
});
