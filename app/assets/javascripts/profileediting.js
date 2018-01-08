$(document).on('turbolinks:load',function(){

  function toggle_ProfileEdit(){
    $(".ProfilePage-editingButtons").toggle();
    $(".ProfileHeaderEditing").toggle();
    $(".ProfileHeaderCard").toggle();
    $(".ProfileHeaderCardEditing").toggle();
    $(".ProfilePage-editingOverlay").toggle();
    $(".ProfileAvatar").toggle();
    $(".ProfileAvatarEditing").toggle();
    $("#ProfileEditButton").toggle();
  };

  $("#ProfileEditButton").on("click",function(e){
    e.preventDefault();
    toggle_ProfileEdit();
  });

  $("#ProfileEditCancelButton").on("click",function(e){
    e.preventDefault();
    toggle_ProfileEdit();
  });

  $(".ProfileAvatarEditing-button").on("click",function(e){
    e.preventDefault();
    $("#avatar-dropdown-menu").toggle();
  });

  $(".ProfileHeaderEditing-button").on("click",function(e){
    e.preventDefault();
    $("#header-dropdown-menu").toggle();
  });

  $("#avatar-choose-button").on("click",function(e){
    e.preventDefault();
    $("#user_image_avatar").click();
  });

  $("#header-choose-button").on("click",function(e){
    e.preventDefault();
    $("#user_image_canopy").click();
  });

  $("#user_image_avatar").change(function(){
    $(".edit_user").submit();
  });

  $("#user_image_canopy").change(function(){
    $(".edit_user").submit();
  });

  $("#avatar-drop-button").on("click",function(e){
    e.preventDefault();
    $("#user_remove_image_avatar").prop('checked', true);
    $(".edit_user").submit();
  });

  $("#header-drop-button").on("click",function(e){
    e.preventDefault();
    $("#user_remove_image_canopy").prop('checked', true);
    $(".edit_user").submit();
  });

  $("#avatar-cancel-button").on("click",function(e){
    e.preventDefault();
    $("#avatar-dropdown-menu").toggle();
  });

  $("#header-cancel-button").on("click",function(e){
    e.preventDefault();
    $("#header-dropdown-menu").toggle();
  });
});
