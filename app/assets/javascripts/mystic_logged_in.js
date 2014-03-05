var mystic_logged_in;
var check_mystic_login;

check_mystic_login = function() {
  return $.ajax({
    url: '/mystics/logged_in',
    success: function(data, textStatus, jqXHR) {
      mystic_logged_in = (data === 'yes')
    }
  });
};
