# Generated by Django 4.2.5 on 2023-10-19 05:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('practicasAcademicas', '0005_alter_unit_ancestor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='processstage',
            name='descriptionProcessStage',
            field=models.CharField(max_length=500),
        ),
    ]
