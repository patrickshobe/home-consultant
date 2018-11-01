//
// Validation Functions for Log In Page
//

$(document).ready(function() {
  $('.log-in-submit').on('click', function () {
    var emailInputElement = $('#user_address')
    var passwordInputElement = $('#password')
    var submitButtonElement = $('.log-in-submit')

    const invalidEmailMessage = "Please provide a valid email."
    const invalidPasswordMessage = "Please fill in the password field."

    passwordInputElement.on('click', function (event) {
      if (isEmail(emailInputElement.val())) {
        $('.message').text();
        $(emailInputElement).css({"border-color": "initial"});
      }
    })

    submitButtonElement.on('click', function (event) {
      if (isEmail(emailInputElement.val())) {
        $('.message').text();
        $(emailInputElement).css({"border-color": "initial"});
      }
    })

    function isEmail(email) {
      var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email);
    }

    function setInvalidCSS(element) {
      $(element).css({"border-color": "red"})
    }

    function setMessage(message) {
      $('.message').text(message);
    }

    if (!isEmail(emailInputElement.val())) {
      setInvalidCSS(emailInputElement)
      setMessage(invalidEmailMessage)
      event.preventDefault();
    } else if (passwordInputElement.val() === '') {
      setInvalidCSS(passwordInputElement)
      setMessage(invalidPasswordMessage)
      event.preventDefault();
    } else {}
  });
});

//
// Validation Functions for Address Search Page
//

$(document).ready(function() {
  $('.find-location-button').on('click', function () {
    var addressInputElement = $('#address')

    const invalidAddressMessage = "Cannot search with an empty address field."

    function setInvalidCSS(element) {
      $(element).css({"border-color": "red"})
    }

    function setMessage(message) {
      $('.message').text(message);
    }
     if (addressInputElement.val() === '') {
     setInvalidCSS(addressInputElement)
     setMessage(invalidAddressMessage)
     event.preventDefault();
    } else {}
  });
});
