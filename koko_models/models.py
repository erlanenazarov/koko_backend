# coding=utf-8
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class MainProduct(models.Model):
    class Meta:
        db_table = 'main_product'
        verbose_name = u'Курочка'
        verbose_name_plural = u'Курицы'

    title = models.CharField(max_length=255, verbose_name=u'Наименование')
    description = models.TextField(max_length=100, verbose_name=u'Описание')
    sizes = models.ManyToManyField('ProductSizes', verbose_name=u'Объёмы')
    preview = models.ImageField(upload_to='main_products', verbose_name=u'Изображение')

    def __unicode__(self):
        return self.title


class ProductSizes(models.Model):
    class Meta:
        db_table = 'product_sizes'
        verbose_name = u'Объём',
        verbose_name_plural = u'Объёмы'

    title = models.CharField(max_length=255, verbose_name=u'Наименование')
    price = models.IntegerField(verbose_name=u'Цена за объём')

    def __unicode__(self):
        return self.title + 'г - ' + str(self.price) + ' сом'


class PotatoProduct(models.Model):
    class Meta:
        db_table = 'potato_product'
        verbose_name = u'Картофель'
        verbose_name_plural = u'Картофели'

    title = models.CharField(max_length=255, verbose_name=u'Наименование')
    description = models.TextField(max_length=100, verbose_name=u'Описание')
    sizes = models.ManyToManyField('ProductSizes', verbose_name=u'Объёмы')
    preview = models.ImageField(upload_to='potato_products', verbose_name=u'Изображение')

    def __unicode__(self):
        return self.title


class SaladeProduct(models.Model):
    class Meta:
        db_table = 'salade_product'
        verbose_name_plural = 'Салаты'
        verbose_name = 'Салат'

    title = models.CharField(verbose_name='Название', max_length=255, unique=False, null=False)
    description = models.TextField(verbose_name='Описание', null=False)
    preview = models.ImageField(verbose_name='Изображение', upload_to='salade_products', null=False)
    price = models.IntegerField(verbose_name='Цена', null=False)

    def __unicode__(self):
        return self.title


class DrinkingProduct(models.Model):
    class Meta:
        db_table = 'drinking_product'
        verbose_name_plural = 'Напитки'
        verbose_name = 'Напиток'

    title = models.CharField(verbose_name='Название', max_length=255, unique=False, null=False)
    description = models.TextField(verbose_name='Описание', null=False)
    preview = models.ImageField(verbose_name='Изображение', upload_to='drinking_products', null=False)
    price = models.IntegerField(verbose_name='Цена', null=False)

    def __unicode__(self):
        return self.title


class Order(models.Model):
    class Meta:
        verbose_name_plural = 'Заказы'
        verbose_name = 'Заказ'

    name = models.CharField(verbose_name='Имя', max_length=500, unique=False, null=False)
    address = models.CharField(verbose_name='Адрес', max_length=500, unique=False, null=False)
    phone = models.CharField(verbose_name='Телефон', max_length=255, unique=False, null=False)
    orders = models.TextField(verbose_name='Элементы заказа', null=False)
    delivered = models.BooleanField(verbose_name='Доставлено?', default=False)
    accepted = models.BooleanField(verbose_name='Принято?', default=False)
    score = models.FloatField(verbose_name='Итого', null=False, default=0)

    def orders_html(self):
        return self.orders

    orders_html.short_description = 'Элементы заказа'
    orders_html.allow_tags = True

    def __unicode__(self):
        return '%s - %s' % (self.name, self.phone)


class Contacts(models.Model):
    class Meta:
        db_table = 'contacts'
        verbose_name = 'Контакты'
        verbose_name_plural = 'Контакты'
    phone_number = models.CharField(max_length=255, verbose_name='Номер телефона')
    additional_phone_number = models.CharField(max_length=255, verbose_name='Запасной номер телефона', null=True, blank=True)
    email = models.EmailField(verbose_name='Эл. почта')
    address = models.CharField(max_length=255, verbose_name='Адрес')
    time_of_work = models.CharField(max_length=255, verbose_name='Chasy raboty', default='10:00 - 22:00')


    def __unicode__(self):
        return self.phone_number + ', ' + self.address


from koko_models.signals import post_order
models.signals.post_save.connect(post_order, sender=Order)
