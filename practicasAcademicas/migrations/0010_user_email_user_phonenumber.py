# Generated by Django 4.2.5 on 2023-10-26 04:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('practicasAcademicas', '0009_remove_applicartion_typepractice_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='email',
            field=models.CharField(default='yei.lopez@udla.edu.co', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='user',
            name='phoneNumber',
            field=models.IntegerField(default=3167974510),
            preserve_default=False,
        ),
    ]