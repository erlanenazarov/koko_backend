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
        return self.title + ' - ' + str(self.price)
