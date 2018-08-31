$(document).ready(function () {
    $('#_submit').attr('disabled', true);
    $('#username, #password').keyup(function () {
        if ($('#username').val().length != 0 && $('#password').val().length != 0)
            $('#_submit').attr('disabled', false);
        else
            $('#_submit').attr('disabled', true);
    })
});