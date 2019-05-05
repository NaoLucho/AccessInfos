$(document).ready(function () {
    $('#_submit').attr('disabled', true);

    $('#username, #password')
        .change(function () { checkFormValidity(); })
        .select(function () { checkFormValidity(); })
        .keyup(function () { checkFormValidity(); });

    function checkFormValidity() {
        if ($('#username').val().length != 0 && $('#password').val().length != 0)
            $('#_submit').attr('disabled', false);
        else
            $('#_submit').attr('disabled', true);
    }

    $('#_submit').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: $('form').attr('method'),
            url: $('form').attr('action'),
            data: $('form').serialize(),
            success: function (data, status, object) {
                if (data.success == false) {
                    console.log(data);
                    $('#invalidCredentials').fadeIn();
                } else {
                    location.reload();
                }
            }
        });
    });
});

