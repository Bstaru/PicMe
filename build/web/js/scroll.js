


    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('.scrollup').fadeIn(200);
        } else {
            $('.scrollup').fadeOut(200);
        }
    });

    $('.scrollup').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 500);
        return false;
    });
