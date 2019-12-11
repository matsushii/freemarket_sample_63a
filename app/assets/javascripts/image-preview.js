$(document).on('turbolinks:load', function() {
  $('#item_images').on('change', function(e) {
    var files = e.target.files;
    var d     = (new $.Deferred()).resolve();
    $.each(files, function(i, file) {
      d = d.then(function(){return previewImage(file)});
    });
  })

  var previewImage = function(imageFile){
    var reader = new FileReader();
    var img    = new Image();
    var def    = $.Deferred();
    reader.onload = function(e) {
      var image_box = $('<div>', {class: 'images-field__image'});
      image_box.append(img);
      $('.images-field').append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  }
});