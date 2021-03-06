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

function moveBottom(item) {
    item.appendTo(item.parent());
}

jQuery(function () {
    $('#sortable_tag, #sortable_photo').sortable({
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
        else if (val == 'bottom')
            moveBottom(btn.parents('.channel_photo'));
        else
            moveDown(btn.parents('.channel_photo'));
    });

    $('.tag_commands button').click(function () {
        var btn = $(this);
        var val = btn.val();
        if (val == 'up')
            moveUp(btn.parents('.channel_tag'));
        else if (val == 'top')
            moveTop(btn.parents('.channel_tag'));
        else if (val == 'bottom')
            moveBottom(btn.parents('.channel_tag'));
        else
            moveDown(btn.parents('.channel_tag'));
    });

    $('.sort_submit_photo').click(function () {
        $.post($('#sortable_photo').data('update-url'), $('#sortable_photo').sortable('serialize'), $('#sortable_photo').effect('highlight'));
    });
    $('.sort_submit_tag').click(function () {
        $.post($('#sortable_tag').data('update-url'), $('#sortable_tag').sortable('serialize'), $('#sortable_tag').effect('highlight'));
    });
});