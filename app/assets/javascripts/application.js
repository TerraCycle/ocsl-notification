// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  $('#request').submit(function(e) {
    e.preventDefault();

    // Serialize form data
    formData = {};
    $.each($(this).serializeArray(), function(i, el) {
      formData[el.name] = el.value;
    });

    $(this).find('.checkbox input').each(function(i, el) {
      if(el.checked) formData[el.name] = el.checked;
    });

    // JSON API response format
    formatted = {
      data: {
        type: 'ocsl_notifications',
        attributes: formData
      }
    }

    $('#request-json').text(JSON.stringify(formatted, undefined, 4));

    $.ajax({
      method: 'POST',
      url: '/api/v1/ocsl_notifications',
      data: formatted
    }).done(function(data) {
      console.log(data);
      $('#response').text(JSON.stringify(data, undefined, 4));
    }).fail(function(data) {
      $('#response').text('Ooops');
    });
  });
});

