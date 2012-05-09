var Collabify = {
  ajax: function($form, opts){
    $.ajax(
      $.extend({
        url:      $form.attr('action') + '.js',
        type:     $form.attr('method'),
        data:     $form.serialize(),
        dataType: 'json'
      },
      opts
    )
  )},
  removeFlash: function(){
    if(Collabify.timeout !== null){
      clearTimeout(Collabify.timeout);
      Collabify.timeout = null;
    }
    $('.alert').fadeOut('fast', function(){
      $(this).remove();
    });
  },
  displayFlash: function(message, type){
    var $flash = $('<div class="alert '+type+'"><p>'+message+'</p></div>');
    $flash.hide();
    $('form.search').after($flash);
    $flash.fadeIn('fast');
    Collabify.timeout = setTimeout(function() {
      Collabify.removeFlash();
    }, 1000);
  },
  spinOptions: {
    lines: 7,
    length: 1,
    width: 4,
    radius: 4,
    rotate: 0,
    color: '#fff',
    speed: 1,
    trail: 60,
    shadow: false,
    hwaccel: true,
    className: 'spinner',
    zIndex: 2e9,
    top: 'auto',
    left: 'auto'
  },
  timeout: null
};

$(function(){
  $.ajaxSetup({
    beforeSend: function(xhr){
      xhr.setRequestHeader('Accept', 'text/javascript');
      Collabify.removeFlash();
    }
  });

  $('form.search').on('submit', function(e){
    var $form = $(this),
        $tracks = $('div.tracks'),
        spinner, spinOptions;
    e.preventDefault();
    spinOptions = $.extend({}, Collabify.spinOptions);
    spinOptions.color = '#333';
    spinner = new Spinner(spinOptions);
    $tracks.empty();
    spinner.spin($tracks[0]);
    Collabify.ajax($form, {
      success: function(data){
        spinner.stop();
        if(data.status == 200){
          $tracks.html(data.view);
        }else{
          $tracks.empty();
          Collabify.displayFlash(data.message, data.type)
        }
      }
    });
  });

  $('div.tracks').on('submit', 'form', function(e){
    var $form = $(this),
        $button = $form.find('button'),
        spinner = new Spinner(Collabify.spinOptions);
    e.preventDefault();
    $button.hide();
    spinner.spin($form[0]);
    Collabify.ajax($form, {
      success: function(data){
        spinner.stop();
        $form.html('<p>✔</p>');
        Collabify.displayFlash(data.message, data.type);
      }
    });
  });
});
