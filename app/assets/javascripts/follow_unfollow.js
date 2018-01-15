$(document).on('turbolinks:load',function(){

  $(".follow-button > .EdgeButton").on("click", function(e){
    e.preventDefault();
    parent_wrapper = $(this).closest(".follow-button-wrapper");
    third_party = $(this).hasClass("third-party");
    counterpart = $(this).hasClass("counterpart");
    $.ajax({
      type: "POST",
      url: "/follow_relationships/",
      data: { follow_to_id: $(this).prev().attr("value") },
      dataType: "json"
    })
    .done(function(data){
      if (!third_party){
        if (!counterpart){
          $("#follows_count").text(Number($("#follows_count").text())+ 1);
        }else{
          $("#followers_count").text(Number($("#followers_count").text())+ 1);
        };
      };
      parent_wrapper.toggleClass("following-button-wrapper");
      parent_wrapper.toggleClass("follow-button-wrapper");
    })
    .fail(function(){
      alert("フォローに失敗しました");
    });
  });

  $(".following-button > .EdgeButton").on("click", function(e){
    e.preventDefault();
    parent_wrapper = $(this).closest(".following-button-wrapper");
    third_party = $(this).hasClass("third-party");
    counterpart = $(this).hasClass("counterpart");
    $.ajax({
      type: "DELETE",
      url: "/follow_relationships/",
      data: { follow_to_id: $(this).prev().attr("value") },
      dataType: "json"
    })
    .done(function(data){
      if (!third_party){
        if (!counterpart){
          $("#follows_count").text(Number($("#follows_count").text())- 1);
        }else{
          $("#followers_count").text(Number($("#followers_count").text())- 1);
        };
      };
      parent_wrapper.toggleClass("follow-button-wrapper");
      parent_wrapper.toggleClass("following-button-wrapper");
    })
    .fail(function(){
      alert("アンフォローに失敗しました");
    });
  });

});
