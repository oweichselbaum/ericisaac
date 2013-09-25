onAnimationFinished = function () {
    $(window).trigger("scroll")
};

$(document).ready(function () {
    var $container = $('#photos_container');
    var $win = $(window);
    $imgs = $("img.lazy");
    $container.isotope({
        itemSelector: '.photo_wrapper',
        masonry: {
            columnWidth: 5
        },
        masonryHorizontal: {
            rowHeight: 5
        }
    });

    $("img.lazy").lazyload({
        effect: "fadeIn",
        failure_limit: Math.max($imgs.length - 1, 0)
    });

    $('.portrait.small img').resizecrop({
        width: 239,
        height: 333,
        vertical: "middle"
    });

    $('.portrait.large img').resizecrop({
        width: 510,
        height: 696,
        vertical: "middle"
    });

    $('.landscape.small img').resizecrop({
        width: 510,
        height: 333,
        vertical: "middle"
    });

    $('.landscape.large img').resizecrop({
        width: 780,
        height: 450,
        vertical: "middle"
    });

    var title = window.location.pathname.replace("/", "");
    if (title == "") {
        $('.new-work').addClass('selected');
    } else {
        $('div').find('.' + title).addClass('selected');
    }

    $('#filters a').click(function () {
        var selector = $(this).attr('data-filter');
        $("#filters a").removeClass("selected");
        $(this).addClass("selected");
        $container.isotope({ filter: selector });
        setTimeout(onAnimationFinished, 600);
        return false;
    });

    $(".fancybox-thumb").fancybox({
        openEffect: 'elastic',
        closeEffect: 'elastic',
        helpers: {
            title: {
                type: 'outside'
            },
            thumbs: {
                width: 50,
                height: 50
            }
        }
    });
});
