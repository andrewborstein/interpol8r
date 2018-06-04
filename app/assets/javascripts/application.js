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
//= require turbolinks
//= require_tree .


// Enable Dismiss Button

document.addEventListener('click', (function(event) {
  var dataDismissClicked = typeof event.target.dataset.dismiss != 'undefined'

  if (dataDismissClicked) {
    event.target.closest('[data-dismiss-target]').remove();
    window.location.search = '' // enable normal page refresh
  }
}), false);


// Enable Mobile Side Nav

document.addEventListener('DOMContentLoaded', (function () {
  var navbarBurger = document.querySelector('.navbar-burger')

  navbarBurger.addEventListener('click', function(event) {
    var burger = event.target
    var nav = document.getElementById(event.target.dataset.target)

    burger.classList.toggle('is-active');
    nav.classList.toggle('is-active');
  });

}), false);
