/**
 * Created by Эрлан on 25.11.2016.
 */

$(document).ready(function () {
    $(window).on('scroll', function () {
        if ($(window).scrollTop() >= 100) {
            $('#fixed-header').fadeIn('fast');
        } else {
            $('#fixed-header').fadeOut('fast');
        }
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
})

$(document).ready(function () {
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
                            alert('added');
                            $('.cart_list').html(response);
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
                        var sum = 0;
                        $('div.order-col-delete').each(function (index, obj) {
                            sum += parseInt($(obj).attr('data-price')) * parseInt($(obj).attr('data-quantity'))
                        }).promise().done(function () {
                            $('td.sum').html(sum + ' сом');
                        });
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
    })
});