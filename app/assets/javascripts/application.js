// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).ready(function() {
  $('.button').on('click', function() {
    var value = $('#input').val()
    console.log(value)
    var url = "http://www.omdbapi.com/?s=" + value

    var success = function(data) {
      $('#list').empty();
      console.log(data)
      for (var i = 0; i < data.Search.length; i++) {
        var title = data["Search"][i]["Title"]
        var element =  '<a data-imdbid="'+data["Search"][i]["imdbID"]+'"><div class="content"><div class="title">' + title + '</a>'
        console.log(element);
        $( "#list" ).append(element);
      }
      //console.log($($('p')[0]).data('imdbid')); //need to wrap jquery object in parentesis b/c it comes back as just string otherwise
    };
    $.ajax(url, { type: 'get', dataType: 'json' }).done(success);
  });
