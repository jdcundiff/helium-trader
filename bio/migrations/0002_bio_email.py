# Generated by Django 2.1.2 on 2018-10-15 20:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bio', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='bio',
            name='email',
            field=models.EmailField(default=' ', max_length=254),
        ),
    ]