$(function(){
  $('.category-search__link').hover(function(){
    $('.category-nav-parents').show();
  }, function(){
    $('.category-nav-parents').hide();
  });

  $('.category-nav-parents__parent').hover(function(){
    $(this).find('.category-nav-children').show();
  }, function(){
    $(this).find('.category-nav-children').hide();
  });

  $('.category-nav-children__child').hover(function(){
    $(this).find('.category-nav-grandchildren').show();
  }, function(){
    $(this).find('.category-nav-grandchildren').hide();
  });
});