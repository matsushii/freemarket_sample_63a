$(document).on("turbolinks:load",function(){
  $(".items-photo__lower__top__box--slide").on("mouseover", function(){
    $("detail__body--left--image").attr("src", $(this).attr("src"))
  });

  $(".items-photo__lower__top__box--slide").on('mouseout', function(){
  });
});

