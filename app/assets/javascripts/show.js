$(document).ready(function(){
  $('.items-photo__lower__top__box--slide').on('mouseover', function(){
    $('detail__body--left--image').attr("src", $(this).attr("src"))
    $(this).css('opacity', '1.0')
    $(this).css('cursor', 'pointer')
  });

  $('.items-photo__lower__top__box--slide').on('mouseout', function(){
    $(this).css('opacity', '0.5')
  });
});

