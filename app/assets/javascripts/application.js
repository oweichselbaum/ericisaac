onAnimationFinished = function () {
    $(window).trigger("scroll")
};

$(document).ready(function () {
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
//    onAnimationFinished();

//    $('span.portrait.small img').resizecrop({
//        width: 239,
//        height: 333
//    });
//
//    $('span.portrait.large img').resizecrop({
//        width: 510,
//        height: 696
//    });
//
//    $('span.landscape.small img').resizecrop({
//        width: 510,
//        height: 333
//    });
//
//    $('span.landscape.large img').resizecrop({
//        width: 780,
//        height: 450
//    });

//    var title = window.location.pathname.replace("/site/", "");
//    if (title == "/") {
//        $('.navigation .new-work').addClass('selected');
//    } else {
//        $('div.navigation').find('.' + title).addClass('selected');
//    }

    $('#filters a').click(function () {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        var selector = $(this).attr('data-filter');
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
                width: 75,
                height: 75
            },
            overlay: {
                locked: false
            }
        }
    });
    $("ul#filters li a").each(function () {
        $(this).click(function () {
            var $this = $(this);
            $(window).trigger("scroll");
            // if we click the active tab, do nothing
            if (!$this.hasClass("selected")) {
                $(".filter").removeClass("selected");
                $this.addClass("selected"); // set the active tab
                // get the data-rel value from selected tab and set as filter
                var $filter = $this.data("rel");
                // if we select view all, return to initial settings and show all
                $('.photo_wrapper:not(".isotope-hidden")').each(function () {
                    $(this).find('.fancybox-thumb').attr('rel', $filter);
                });
            }
        });
    });


    $(window).scroll(function () {
        // what is the y position of the scroll?
        var y = $(window).scrollTop();
        // whether that's below the start of article?
        if (y >= 300) {
            // if so, add the fixed class
            $('.nav').addClass('stuck');
        }
        else {
            // otherwise, remove it
            $('.nav').removeClass('stuck');
        }
    });

});

$(window).load(function () {
    var img_width = $('body.photos.show img').width();
    $('body.photos.show .image_wrapper').css({'width': img_width});
    $('.pace').delay(750).fadeOut();
    $('.loader').delay(750).fadeOut();
});
