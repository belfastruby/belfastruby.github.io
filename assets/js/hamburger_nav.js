$(document).ready(function() {
    $('#burger').sidr({
      side: 'right',
      displace: true
    });
    $('#burger').on('click', function() {
      action = ($(this).hasClass('open-burger')) ? 'close' : 'open';
      $.sidr(action, 'sidr')
      $(this).toggleClass('open-burger');
    });
  });
