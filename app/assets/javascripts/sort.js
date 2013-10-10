function moveUp(item) {
    var prev = item.prev();
    if (prev.length == 0)
        return;
    prev.css('z-index', 999).css('position', 'relative').animate({ top: item.height() }, 250);
    item.css('z-index', 1000).css('position', 'relative').animate({ top: '-' + prev.height() }, 300, function () {
        prev.css('z-index', '').css('top', '').css('position', '');
        item.css('z-index', '').css('top', '').css('position', '');
        item.insertBefore(prev);
    });
}
function moveDown(item) {
    var next = item.next();
    if (next.length == 0)
        return;
    next.css('z-index', 999).css('position', 'relative').animate({ top: '-' + item.height() }, 250);
    item.css('z-index', 1000).css('position', 'relative').animate({ top: next.height() }, 300, function () {
        next.css('z-index', '').css('top', '').css('position', '');
        item.css('z-index', '').css('top', '').css('position', '');
        item.insertAfter(next);
    });
}

function moveTop(item) {
    item.prependTo(item.parent());
}

jQuery(function () {
    $('#sortable').sortable({
        axis: 'y',
        handle: '.handle',
        update: function () {
            return $.post($(this).data('update-url'), $(this).sortable('serialize'), $(this).effect('highlight'));
        }
    });
    $('.commands button').click(function () {
        var btn = $(this);
        var val = btn.val();
        if (val == 'up')
            moveUp(btn.parents('.channel_photo'));
        else if (val == 'top')
            moveTop(btn.parents('.channel_photo'));
        else
            moveDown(btn.parents('.channel_photo'));
    });

    $('.sort_submit').click(function () {
        $.post($('#sortable').data('update-url'), $('#sortable').sortable('serialize'), $('#sortable').effect('highlight'));
    });
});