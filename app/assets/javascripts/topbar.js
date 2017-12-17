$(function(){
  over_flg = false;
  $(".dropdown-toggle").on("click",function(e){
    e.preventDefault();
    $(".dropdown-menu").toggle();
  });
  $(".dropdown-menu,.dropdown-toggle").hover(function(){
    over_flg = true;
  }, function(){
    over_flg = false;
  });
  $("body").on("click",function(){
    if(over_flg == false){
      $(".dropdown-menu").hide();
    }
  });
});
