# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-12-01 05:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('koko_models', '0002_drinkingproduct_potatoproduct_saladeproduct'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=500, verbose_name='\u0418\u043c\u044f')),
                ('address', models.CharField(max_length=500, verbose_name='\u0410\u0434\u0440\u0435\u0441')),
                ('phone', models.CharField(max_length=255, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('orders', models.TextField(verbose_name='\u042d\u043b\u0435\u043c\u0435\u043d\u0442\u044b \u0437\u0430\u043a\u0430\u0437\u0430')),
                ('delivered', models.BooleanField(verbose_name='\u0414\u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d\u043e?')),
            ],
            options={
                'verbose_name': '\u0417\u0430\u043a\u0430\u0437',
                'verbose_name_plural': '\u0417\u0430\u043a\u0430\u0437\u044b',
            },
        ),
    ]