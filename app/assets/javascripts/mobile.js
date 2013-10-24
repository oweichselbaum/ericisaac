onAnimationFinished = function () {
    $(window).trigger("scroll")
};

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
    $('#handler-right').change(function () {
        if ($('#handler-right').is(':checked')) {
            $('#content').click(function () {
                $('#handler-right').attr('checked', false);
            });
        }
    })
//    var title = window.location.pathname.replace("/", "");
//    if (title == "") {
//        $('.new-work').addClass('selected');
//    } else {
//        $('div').find('.' + title).addClass('selected');
//    }

    var $container = $('#photos_container');
    var $win = $(window);
    $imgs = $("img.lazy");
    $container.imagesLoaded(function () {
        $container.isotope({
            itemSelector: '.photo_wrapper',
            masonry: {
                columnWidth: 5
            },
            masonryHorizontal: {
                rowHeight: 5
            }
        });
    });

//    $imgs.lazyload({
//        effect: "fadeIn",
//        failure_limit: Math.max($imgs.length - 1, 0)
//    });
//
//    $("img:below-the-fold").lazyload({
//        event: "sporty"
//    });
//
//    $(window).bind("load", function () {
//        setTimeout(function () {
//            $("img.lazy").trigger("sporty")
//        }, 2000);
//    });

    var swipeboxInstance = $(".swipebox-isotope:not(.isotope-hidden .swipebox-isotope)").swipebox();

    onAnimationCompleted = function () {
        swipeboxInstance.refresh();
    };


    optionFilterLinks = $('#filter a');

    $('#filters a').click(function () {
        var selector = $(this).attr('data-filter');
        $container.isotope({
            filter: selector,
            animationEngine: 'best-available'
        }, onAnimationCompleted); // callback here
        $('#handler-right').attr('checked', false);
        $('.filter').removeClass('selected');
        $(this).addClass('selected');
        setTimeout(onAnimationFinished, 600);
        return false;
    });

    $(".swipebox").swipebox();
});

$(window).load(function () {
    $('.pace').delay(750).fadeOut();
    $('.loader').delay(750).fadeOut();
});