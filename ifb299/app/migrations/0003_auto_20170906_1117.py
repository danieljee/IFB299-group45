# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-09-06 01:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20170906_1112'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='address',
            field=models.CharField(default=None, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='postcode',
            field=models.IntegerField(default=None, null=True),
        ),
    ]
