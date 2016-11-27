/**
 * Created by Эрлан on 25.11.2016.
 */
var pre_order_button = '<div class="pre-order-settings"> <div class="text">Количество</div> <div class="count"> <div class="count-value">1</div> <div class="settings-buttons"> <img src="'+ plus_icon +'" class="plus-trigger" /> <img src="' + minus_icon + '" class="minus-trigger" /> </div> </div> <div class="done"> <img src="' + done_icon + '" class="done-trigger" /> </div> </div>';

var add_to_card = $('.add-to-card');

$(add_to_card).on('click', function() {
    $(this).parent().html(pre_order_button);
});