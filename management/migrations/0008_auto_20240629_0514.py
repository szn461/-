# Generated by Django 2.2.2 on 2024-06-28 21:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('management', '0007_remove_book_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='position',
            name='salary',
            field=models.FloatField(default=0.0, verbose_name='薪资'),
        ),
        migrations.CreateModel(
            name='AttendanceStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(choices=[('ON_DUTY', '在岗'), ('ON_LEAVE', '请假'), ('ABSENT', '旷工'), ('ON_BUSINESS', '出差')], default='ON_DUTY', max_length=10, verbose_name='考勤状态')),
                ('date', models.DateField(verbose_name='日期')),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.Book', verbose_name='员工')),
            ],
        ),
    ]
