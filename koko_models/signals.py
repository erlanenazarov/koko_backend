# coding=utf-8
from app.views import *
from KokoChicken.settings import *


def post_order(sender, instance, created, **kwargs):
    if instance.accepted:
        title = 'Заказ принят!'
        body = 'Заказ №%i принят!' % instance.id

        thread = threading.Thread(target=send_notification_email, args=(title, body, EMAIL_TO))
        thread.start()

    if instance.delivered:
        title = 'Заказ отправлен!'
        body = 'Заказ №%i отправлен!' % instance.id

        thread = threading.Thread(target=send_notification_email, args=(title, body, EMAIL_TO))
        thread.start()