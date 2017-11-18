$(function(){
  var stack1 = [];
  var stack2 = [];
  var stack3 = [];
  var stack4 = [];
  var delay = 300;

  function validate_address(address){
    //メールアドレスのバリデーション
    return address.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/);
  };

  function validate_name(name){
    if(name.match(/[^A-Za-z0-9]+/)){
      return false;
    }else{
      return true;
    };
  };

  function submit_failed($element){
    $element.focus();
    $(".sign-up-box").addClass("shake-slow shake-horizontal shake-constant");

    setTimeout(function() {
      $(".sign-up-box").removeClass("shake-slow shake-horizontal shake-constant");
    }, delay);


  };

  $("#user_nickname").on("keyup", function(){
    stack1.push(1); //入力ごとに値を追加する
    var $form = $(this);
    var $sidetip = $form.next("div");
    $sidetip.children("p").css("display", "none");
    setTimeout(function() {
      stack1.pop();  //中身を一つ取り出す

      //取り出したstackの中身がなければ処理をする
      //stackの中身がなくなるのは、一番最後の入力から0.3秒後になる
      //なので、一番最後の入力から0.3秒後に以下の処理が走る
      if (stack1.length == 0) {
        //最後キー入力後に処理したいイベント
        var input = $form.val();

        if(input == ""){
          $sidetip.find(".blank").css("display", "flex");
          $form.attr("data-valid","false");
        }else{
          $sidetip.find(".ok").css("display", "flex");
          $form.attr("data-valid","true");
        };
        stack1 = [];//stackを初期化
      };
    }, delay);
  });

  $("#user_name").on("keyup", function(){
    stack2.push(1); //入力ごとに値を追加する
    var $form = $(this);
    var $sidetip = $form.next("div");
    $sidetip.children("p").css("display", "none");
    setTimeout(function() {
      stack2.pop();

      if (stack2.length == 0) {
        var input = $form.val();
        if(input == ""){
          $sidetip.find(".blank").css("display", "flex");
          $form.attr("data-valid","false");
        }else if(!validate_name(input)){
          $sidetip.find(".invalid").css("display", "flex");
          $form.attr("data-valid","false");
        }else{
          $sidetip.find(".ok").css("display", "flex");
          $form.attr("data-valid","true");
        };
        stack2 = [];
      };
    }, delay);
  });

  $("#user_email").on("keyup", function(){
    stack3.push(1);
    var $form = $(this);
    var $sidetip = $form.next("div");
    $sidetip.children("p").css("display", "none");
    setTimeout(function() {
      stack3.pop();

      if (stack3.length == 0) {
        var input = $form.val();
        if(input == ""){
          $sidetip.find(".blank").css("display", "flex");
          $form.attr("data-valid","false");
        }else if(!validate_address(input)){
          $sidetip.find(".invalid").css("display", "flex");
          $form.attr("data-valid","false");
        }else{
          $sidetip.find(".ok").css("display", "flex");
          $form.attr("data-valid","true");
        };
        stack3 = [];
      };
    }, delay);
  });

  $("#user_password").on("keyup", function(){
    stack4.push(1);
    var $form = $(this);
    var $sidetip = $form.next("div");
    $sidetip.children("p").css("display", "none");
    setTimeout(function() {
      stack4.pop();

      if (stack4.length == 0) {
        var input = $form.val();
        if(input.length < 6){
          $sidetip.find(".invalid").css("display", "flex");
          $form.attr("data-valid","false");
        }else{
          $sidetip.find(".ok").css("display", "flex");
          $form.attr("data-valid","true");
        };
        stack1 = [];
      };
    }, delay);
  });

  $("#new_user").submit(function(){
    if($("#user_nickname").attr("data-valid") == "false"){
      submit_failed($("#user_nickname"));
      return false;
    }else if($("#user_name").attr("data-valid") == "false"){
      submit_failed($("#user_name"));
      return false;
    }else if($("#user_email").attr("data-valid") == "false"){
      submit_failed($("#user_email"));
      return false;
    }else if($("#user_password").attr("data-valid") == "false"){
      submit_failed($("#user_password"));
      return false;
    };
  });

});
