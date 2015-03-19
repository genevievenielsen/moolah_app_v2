$(document).ready(function () {

    $('div.hidden').fadeIn(1500).removeClass('hidden');

    //this is the navbar scroll down thing
    $(window).scroll(function() {
      if($(this).scrollTop() > 100) {
        $('.navbar-default').addClass('navbar_color');
      } else {
        $('.navbar-default').removeClass('navbar_color');
      }
    });

});
