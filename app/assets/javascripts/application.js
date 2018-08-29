// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

var game_url = { dictionary: 'en-vi', categories: 'Noun,Adjective,Verb,Adverb,Noun Phrase', numeric: '20', alphabet: 'all' };

var host = function() {
  var protocol = location.protocol;
  var slashes = protocol.concat("//");
  var host = slashes.concat(window.location.hostname);
  return window.location.port ? host.concat(':').concat(window.location.port) : host;
}

var getCheckedCheckboxesFor = function(checkboxName) {
  var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
  Array.prototype.forEach.call(checkboxes, function(el) {
    values.push(el.value);
  });
  return values;
}

var change_param = function(param, value) {
  game_url[param] = value;
}

$(document).ready(function(){
  $("input[name='dictionary']").on('change', function() {
    change_param('dictionary', $(this).val());
  });
  $("input[name='categories[]']").on('change', function() {
    change_param('categories', getCheckedCheckboxesFor('categories[]').toString());
  });
  $("input[name='numeric']").on('change', function() {
    change_param('numeric', $(this).val());
  });
  $("input[name='alphabet']").on('change', function() {
    change_param('alphabet', $(this).val());
  });

  $('#start-game').on('click', function() {
    window.location.href = host() + '/play/game?' + $.param(game_url);
  });
});