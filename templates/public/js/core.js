/**
 * Created by Эрлан on 25.11.2016.
 */

$(document).ready(function () {
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > 140) {
            $('.fixed-header').fadeIn('fast');
        } else {
            $('.fixed-header').fadeOut('fast');
        }

        // var slickSlider = $('.slick-slide');
        // $(slickSlider).animate({
        //     width: $(slickSlider).width()
        // }, 50);
    });

    var isOpen = false;
    $('#mobile-menu').on('click', function () {
        if (!isOpen) {
            $('.mobile-fixed-menu').animate({
                height: 170
            }, 500);
            isOpen = true;
        } else {
            $('.mobile-fixed-menu').animate({
                height: 0
            }, 500);
            isOpen = false;
        }
    });

    var navigationTrigger = $('.navigation-trigger');
    $(navigationTrigger).on('click', function (event) {
        event.preventDefault();
        var block = $(this).attr('href') + '';
        $('body, html').animate({
            scrollTop: $(block).offset().top
        }, 800);
        $('.mobile-fixed-menu').animate({
            height: 0
        }, 500);
        isOpen = false;
    });
});

// open request modal
$(openButton).on('click', function () {
    $('#order-modal').fadeIn('fast');
});

// close request model
$(closeButton).on('click', function () {
    $('.md-window').addClass('close');
    $('#order-modal').fadeOut('fast', function () {
        $('.md-window').removeClass('close');
    });
});

$('.md-alert-close').on('click', function () {
    $('.md-alert').addClass('close');
    $('#alert-modal').fadeOut('fast', function () {
        $('.md-alert').removeClass('close');
    });
});

$(document).ready(function () {

    var countTotalSum = function () {
        var sum = 0;
        console.log(12);
        $('.order-col-count > div.count').each(function (index, obj) {
            var settings = $('.settings-buttons', obj);
            sum += parseInt($(settings).attr('data-price')) * parseInt($('.count-value', obj).html())
        }).promise().done(function () {
            $('td.sum').html(sum + ' сом');
        });
    };

    var updateCartItemPrice = function (arg) {
        var parent = $(this).parent();
        var id = $(parent).attr('data-id');
        var type = $(parent).attr('data-type');
        var size = $(parent).attr('data-size');
        var quantity = $('div.count-value', $(parent).parent()).html();

        var data = null;

        if (arg.data.isPlus) {
            ++quantity;
        } else {
            --quantity;
        }

        if (type == 'potato' || type == 'chicken') {
            data = {
                id: id, type: type, size: size, quantity: quantity
            };
        } else {
            data = {
                id: id, type: type, quantity: quantity
            };
        }

        $.ajax({
            method: 'POST',
            url: cart_item_quantity_url,
            data: {item: JSON.stringify(data), csrfmiddlewaretoken: csrf},
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    countTotalSum();
                }
            },
            error: function (e) {

            }
        });
    }

    // add to cart
    $(document).on('click', '.add-to-card', function () {
        $(this).addClass('hidden');
        $('.pre-order-settings', $(this).parent()).removeClass('hidden');
    });

    // switch price
    $(document).on('click', 'li.price-switch', function () {
        var price = $(this).attr('data-price');
        $('div.price-value', $(this).parent().parent()).html(price + ' сом');
        $('li.price-switch', $(this).parent()).each(function (index, obj) {
            $(obj).removeClass(('active'))
        });
        $(this).addClass('active');
    });

    // plus product
    $(document).on('click', 'img.plus-trigger', function () {
        var countValueObj = $('div.count-value', $(this).parent().parent());
        var countValue = parseInt($(countValueObj).html());
        countValue++;
        $(countValueObj).html(countValue);
    });

    $(document).on('click', 'img.minus-trigger', function () {
        var countValueObj = $('div.count-value', $(this).parent().parent());
        var countValue = parseInt($(countValueObj).html());
        countValue--;

        if (countValue < 1) {
            countValue = 1;
        }
        $(countValueObj).html(countValue);
    });

    // add to cart
    $(document).on('click', '.done-trigger', function () {
        var cart_item = null;
        var id = $(this).attr('data-id');
        var type = $(this).attr('data-type');
        var product_info = $('#' + type + '_' + id);
        var quantity = $('div.count-value', product_info).html();
        var title = $('div.title', product_info).html();
        var price = null;
        if (type == 'potato' || type == 'chicken') {
            var size = $('li.active', product_info).attr('data-size');
            price = $('li.active', product_info).attr('data-price');
            cart_item = {
                id: id, type: type, quantity: quantity, size: size, price: price, title: title
            };
        } else {
            price = $(this).attr('data-price');
            cart_item = {
                id: id, type: type, quantity: quantity, price: price, title: title
            };
        }

        $.ajax({
            method: 'POST',
            url: add_to_cart_url,
            data: {item: JSON.stringify(cart_item), csrfmiddlewaretoken: csrf},
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $.ajax({
                        method: 'GET',
                        url: cart_list_url,
                        dataType: 'html',
                        success: function (response) {
                            var alert = $('#alert-modal');
                            var message = title;
                            if (size) {
                                message += ', ' + size;
                            }

                            message += ', количество: ' + quantity;

                            $('.md-alert-message', alert).html(message);
                            $(alert).fadeIn('fast');
                            $('.cart_list').html(response);
                            $('.cart_item_plus').click({isPlus: true}, updateCartItemPrice);
                            $('.cart_item_minus').click({isPlus: false}, updateCartItemPrice);
                        },
                        error: function (e) {

                        }
                    });
                }
            },
            error: function (e) {

            }
        });
    });
    // detele cart item
    $(document).on('click', 'div.order-col-delete', function () {
        var id = $(this).attr('data-id');
        var type = $(this).attr('data-type');
        var size = $(this).attr('data-size');
        var that = this;

        var cart_item = null;

        if (type == 'potato' || type == 'chicken') {
            cart_item = {id: id, type: type, size: size};
        } else {
            cart_item = {id: id, type: type};
        }

        $.ajax({
            method: 'POST',
            url: remove_from_cart_url,
            data: {item: JSON.stringify(cart_item), csrfmiddlewaretoken: csrf},
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $($(that).parent()).fadeOut(300, function () {
                        $(this).remove();
                        countTotalSum();
                    });
                }
            },
            error: function (e) {

            }
        });
    });
    // load more
    $('.more_food').on('click', function () {
        var product_list = $('.main-products-carcass', $(this).parent().parent());
        var type = $(this).attr('data-type');
        var that = this;

        var page = $(this).attr('data-page');
        page++;

        $.ajax({
            method: 'GET',
            url: load_more_url + '?type=' + type + '&page=' + page,
            dataType: 'html',
            success: function (response) {
                $(product_list).append(response);
                $(that).attr('data-page', page);
            },
            error: function (e) {

            }
        });
    });

    // increase/decrease product quantity
    $('.cart_item_plus').click({isPlus: true}, updateCartItemPrice);
    $('.cart_item_minus').click({isPlus: false}, updateCartItemPrice);

    //create order
    $('#orderForm').on('submit', function (e) {
        var that = this;
        e.preventDefault();
        $.ajax({
            method: 'POST',
            url: $(this).attr('action'),
            dataType: 'json',
            data: $(this).serialize(),
            success: function (response) {
                if (response.success) {
                    $('.md-window').addClass('close');
                    $('#order-modal').fadeOut('fast', function () {
                        $('.md-window').removeClass('close');
                    });

                    var alert = $('#alert-modal');
                    $('.md-alert-title', alert).html('Заказ отправлен');
                    $('.md-alert-message', alert).html('Ваша заказ принят!');
                    $(alert).fadeIn('fast');
                }
            },
            error: function (e) {

            }
        });

    });

    $('#drink-list').slick({
        infinite: true,
        arrows: true,
        autoplay: true,
        speed: 500,
        mobileFirst: true,
        swipeToSlide: true,
        variableWidth: true
    });
});