# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-12-02 04:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('koko_models', '0006_contacts'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='accepted',
            field=models.BooleanField(default=False, verbose_name='\u041f\u0440\u0438\u043d\u044f\u0442\u043e?'),
        ),
    ]