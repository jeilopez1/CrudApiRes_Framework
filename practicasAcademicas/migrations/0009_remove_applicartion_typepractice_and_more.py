# Generated by Django 4.2.5 on 2023-10-22 17:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('practicasAcademicas', '0008_typeacademicpractice_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='applicartion',
            name='typePractice',
        ),
        migrations.AlterField(
            model_name='applicartion',
            name='routeAcceptancedocument',
            field=models.FileField(null=True, upload_to='acceptanceDocument/'),
        ),
        migrations.AlterField(
            model_name='typeacademicpractice',
            name='DescriptionAcademicPractice',
            field=models.CharField(max_length=500),
        ),
    ]