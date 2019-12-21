$(document).on('turbolinks:load', function(){
  $(function(){
    // 親カテゴリー選択時のイベント処理
    $('.form-box__select').on('change', '#parent-category', function(){
      var parent_id = $('#parent-category').val();
      if (parent_id != ''){
        $.ajax({
          type:     'GET',
          url:      '/items/get_children',
          data:     { parent_id: parent_id },
          dataType: 'JSON'
        })
        .done(function(children){
          var categoryOptions = '';
          children.forEach(function(child){
            categoryOptions += createOption(child);
          });
          $('#child-category option').remove();
          $('#child-category').removeClass('hidden');
          $('#child-category').append(categoryOptions);
          $('#grandchild-category').addClass('hidden');
        })
        .fail(function(){
          alert('カテゴリーを取得できませんでした')
        })
      }else{
        $('#child-category option').remove();
        $('#child-category').addClass('hidden');
        $('#grandchild-category option').remove();
        $('#grandchild-category').addClass('hidden');
      }
    });
    // 子カテゴリー選択時のイベント処理
    $('.form-box__select').on('change', '#child-category', function(){
      var child_id = $('#child-category').val();
      if (child_id != ''){
        $.ajax({
          type:     'GET',
          url:      '/items/get_grandchildren',
          data:     { child_id: child_id },
          dataType: 'JSON'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('.grandchild-category').remove();
            var categoryOptions = '';
            grandchildren.forEach(function(grandchild){
              categoryOptions += createOption(grandchild);
            });
            $('#grandchild-category option').remove();
            $('#grandchild-category').removeClass('hidden');
            $('#grandchild-category').append(categoryOptions);
          }
        })
        .fail(function(){
          alert('カテゴリーを取得できませんでした')
        })
      }else{
        $('#grandchild-category option').remove();
        $('#grandchild-category').addClass('hidden');
      }
    });
    // select内のoptionを生成
    function createOption(category){
      var option = '<option value="${category.id}">${category.name}</option>';
      return option;
    }
  });
});