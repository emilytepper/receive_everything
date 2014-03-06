var mystic_logged_in;
var check_mystic_login;

check_mystic_login = function() {
  return $.ajax({
    url: '/mystics/logged_in',
    success: function(data, textStatus, jqXHR) {
      mystic_logged_in = (data === 'yes');
    }
  });
};

var mystic_purchases;
var check_mystic_purchases;

check_mystic_purchases = function() {
  return $.ajax({
    url: '/purchases/mine',
    dataType: 'json',
    success: function(data, textStatus, jqXHR) {
      mystic_purchases = data;
    }
  });
};
