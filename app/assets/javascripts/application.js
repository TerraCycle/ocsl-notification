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
  var json = {
    uuid: '',
    client_params: '',
    brigade_name: '',
    first_name: '',
    last_name: '',
    email: '',
    phone_number: '',
    address: '',
    address2: '',
    city: '',
    region: '',
    zipcode: '',
    checkbox1: true,
    checkbox2: false
  };

  $('#request textarea').text(JSON.stringify(json, undefined, 4));

  $('#request').submit(function(e) {
    e.preventDefault();
    formData = JSON.parse($(this).serializeArray()[0].value);

    $.ajax({
      method: 'POST',
      url: '/ocsl_notifications',
      data: { json: formData }
    }).done(function(data) {
      console.log(data);
      $('#response').text(JSON.stringify(data, undefined, 4));
    }).fail(function(data) {
      $('#response').text('fail');
    })
  })
});

