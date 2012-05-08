var SPIN_OPTIONS = {
  lines: 7, // The number of lines to draw
  length: 1, // The length of each line
  width: 4, // The line thickness
  radius: 4, // The radius of the inner circle
  rotate: 0, // The rotation offset
  color: '#fff', // #rgb or #rrggbb
  speed: 1, // Rounds per second
  trail: 60, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: true, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: 'auto', // Top position relative to parent in px
  left: 'auto' // Left position relative to parent in px
};

$(function(){
  $('form.search').on('submit', function(e){
    var $form = $(this),
        $tracks = $('div.tracks'),
        spinner;
    SPIN_OPTIONS.color = '#333';
    spinner = new Spinner(SPIN_OPTIONS);
    e.preventDefault();
    $tracks.empty();
    spinner.spin($tracks[0]);
    $.ajax({
      url: $form.attr('action')+'.js',
      data: $form.serialize(),
      dataType: 'json',
      type: $form.attr('method'),
      success: function(data){
        spinner.stop();
        $tracks.html(data.view);
      }
    });
  });


  $('ol li form').on('submit', function(e){
    var $form = $(this),
        $button = $form.find('button'),
        spinner = new Spinner(SPIN_OPTIONS);
    e.preventDefault();
    $button.hide();
    spinner.spin($form[0]);
    $.ajax({
      url: $form.attr('action')+'.js',
      data: $form.serialize(),
      dataType: 'json',
      type: $form.attr('method'),
      success: function(data){
        spinner.stop();
        $form.html('<p>✔</p>');
      }
    })
  });
});
