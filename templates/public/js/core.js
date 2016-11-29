/**
 * Created by Эрлан on 25.11.2016.
 */

$(document).ready(function () {
    // add to cart
    $('.add-to-card').on('click', function () {
        $(this).addClass('hidden');
        $('.pre-order-settings', $(this).parent()).removeClass('hidden');
    });

    // switch price
    $('li.price-switch').on('click', function () {
        var price = $(this).attr('data-price');
        $('div.price-value', $(this).parent().parent()).html(price + ' сом');
        $('li.price-switch', $(this).parent()).each(function (index, obj) {
            $(obj).removeClass(('active'))
        });
        $(this).addClass('active');
    });

    // plus product
    $('img.plus-trigger').on('click', function() {
        var countValueObj = $('div.count-value', $(this).parent().parent());
        var countValue = parseInt($(countValueObj).html())
        countValue++;
        $(countValueObj).html(countValue);
    })    ;

    $('img.minus-trigger').on('click', function() {
        var countValueObj = $('div.count-value', $(this).parent().parent());
        var countValue = parseInt($(countValueObj).html());
        countValue--;

        if (countValue < 1) {
            countValue = 1;
        }
        $(countValueObj).html(countValue);
    });

    $('.done-trigger').on('click', function() {
        var cart_item = null;
        var id = $(this).attr('data-id');
        var type = $(this).attr('data-type');
        var product_info = $('#' + type + '_' + id);
        var quantity = $('div.count-value', product_info).html();
        if (type == 'potato' || type == 'chicken') {
            var size = $('li.active', product_info).attr('data-size');
            cart_item = {
                id: id, type: type, quantity: quantity, size: size
            };
        } else {
            cart_item = {
                id: id, type: type, quantity: quantity
            };
        }

        $.ajax({
            method: 'POST',
            url: add_to_cart_url,
            data: {item: JSON.stringify(cart_item), csrfmiddlewaretoken: csrf},
            dataType: 'json',
            success: function(response) {
                if(response.success) {
                    alert('yahooo');
                } else {
                    alert('nooo')
                }
            },
            error: function(e) {

            }
        });
    });
});