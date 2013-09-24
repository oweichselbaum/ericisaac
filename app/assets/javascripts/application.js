function initiateIsotope() {
    var $container = $('#photos_container');
    var sortBy = $('#sort-by');

    $container.isotope({
        itemSelector: '.photo_wrapper',
        masonry: {
            columnWidth: 5
        },
        masonryHorizontal: {
            rowHeight: 5
        }
    });
}

$(document).ready(function () {
    $("img.lazy").lazyload({
        effect: "fadeIn"
    });

    $('.portrait.small img').resizecrop({
//        width: 510,
//        height: 333,
        width: 239,
        height: 333,
        vertical: "middle"
    });

    $('.portrait.large img').resizecrop({
//        width: 780,
//        height: 450,
        width: 510,
        height: 696,
        vertical: "middle"
    });

    $('.landscape.small img').resizecrop({
//        width: 239,
//        height: 333,
        width: 510,
        height: 333,
        vertical: "middle"
    });

    $('.landscape.large img').resizecrop({
        width: 780,
        height: 450,
//        width: 510,
//        height: 696,
        vertical: "middle"
    });

});

$(window).load(function () {
    initiateIsotope()
});