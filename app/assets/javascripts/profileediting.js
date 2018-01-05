$(document).on('turbolinks:load',function(){

  function toggle_ProfileEdit(){
    $(".ProfilePage-editingButtons").toggle();
    $(".ProfileHeaderCard").toggle();
    $(".ProfileHeaderCardEditing").toggle();
    $(".ProfilePage-editingOverlay").toggle();
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

});
