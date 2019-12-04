$(document).on('turbolinks:load',function(){
    $('.price-filed').on('input', function(){
      var inputPrice = $(this).val();
      if(inputPrice >= 300 && inputPrice <= 9999999){
        var commission = Math.floor(inputPrice * 0.1).toLocaleString();
        var profit = Math.ceil(inputPrice * 0.9).toLocaleString();
        $('.fee__right').text("¥" + commission);
        $('.profit').text("¥" + profit);
      }else{
        $('.fee__right').text("-");
        $('.profit').text("-");
      }
    });
  });
  