$(document).on('turbolinks:load',function(){

  function toggle_ProfileEdit(){
    $(".ProfilePage-editingButtons").toggle();
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

  $("#avatar-choose-button").on("click",function(e){
    e.preventDefault();
    $("#user_image_avatar").click();
  });

  $("#user_image_avatar").change(function(){
    $(".edit_user").submit();
  });

  $("#avatar-cancel-button").on("click",function(e){
    e.preventDefault();
    $("#avatar-dropdown-menu").toggle();
  });


});
