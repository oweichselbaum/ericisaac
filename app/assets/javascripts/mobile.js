$(document).ready(function () {
    // Fixing iOS Safari "WTF" issue
    // http://stackoverflow.com/questions/7358781/tapping-on-label-in-mobile-safari
    $('label').click(function () {
    });

    $('#handler-left').change(function () {
        if ($('#handler-left').is(':checked')) {
            $('#content').click(function () {
                $('#handler-left').attr('checked', false);
            });
        }
    })
});