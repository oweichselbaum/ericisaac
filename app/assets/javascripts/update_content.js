function updateContent(content) {
    var $contentKeyElements = $(content).filter('[data-content-key]');
    $contentKeyElements.each(function() {
        var node = $(this);
        var key = node.attr("data-content-key");
        $("[data-content-key=" + key + "]").replaceWith(node);
    });

    $(document).trigger('content-updated');
}

(function($) {
    $(function() {
        $(document).bind('ajax:success', function(e, content) {
            $.each(content, function(key, value) {
                updateContent(value);
            });
        });
    });
})(jQuery);