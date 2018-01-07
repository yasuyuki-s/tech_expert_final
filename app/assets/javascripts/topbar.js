$(document).on('turbolinks:load',function(){
  over_flg = false;
  $("#topbar-dropdown-toggle").on("click",function(e){
    e.preventDefault();
    $("#topbar-dropdown-menu").toggle();
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
  });
});
