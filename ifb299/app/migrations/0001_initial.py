# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-09-02 00:53
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('state', models.CharField(choices=[('QLD', 'QLD'), ('NSW', 'NSW'), ('SA', 'SA'), ('TAS', 'TAS'), ('WA', 'WA'), ('VIC', 'VIC')], max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Place',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('address', models.CharField(max_length=200)),
                ('postcode', models.IntegerField()),
                ('state', models.CharField(choices=[('QLD', 'QLD'), ('NSW', 'NSW'), ('SA', 'SA'), ('TAS', 'TAS'), ('WA', 'WA'), ('VIC', 'VIC')], max_length=2)),
                ('date', models.DateTimeField(verbose_name='Date Uploaded')),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.City')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstName', models.CharField(max_length=100)),
                ('lastName', models.CharField(max_length=100)),
                ('emailAddress', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('role', models.CharField(choices=[('STUDENT', 'STUDENT'), ('BUSINESSMAN', 'BUSINESSMAN'), ('TOURIST', 'TOURIST'), ('ADMIN', 'ADMIN')], max_length=2)),
                ('date', models.DateTimeField(verbose_name='Date registered')),
            ],
        ),
    ]