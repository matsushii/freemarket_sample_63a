$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.news').bxSlider({
        auto: true,
        pause: 5000,
        useCSS: false,
    });
  });
});