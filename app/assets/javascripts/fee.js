$(document).on("turbolinks:load",function(){
    $(document).ready(function(){
      var inputPrice = $(".price-field").val();
      var commission = Math.floor(inputPrice * 0.1).toLocaleString();
      var profit = Math.ceil(inputPrice * 0.9).toLocaleString();
      $(".fee__label__preview").text("¥" + commission);
      $(".profit__preview").text("¥" + profit);
    });
    $(".price-field").on("input",function(){
      var inputPrice = $(this).val();
      if(inputPrice >= 300 && inputPrice <= 9999999){
        var commission = Math.floor(inputPrice * 0.1).toLocaleString();
        var profit = Math.ceil(inputPrice * 0.9).toLocaleString();
        $(".fee__label__preview").text("¥" + commission);
        $(".profit__preview").text("¥" + profit);
      }else{
        $(".fee__label__preview").text("-");
        $(".profit__preview").text("-");
      }
    });

  });
  