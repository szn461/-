
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='员工名字')),
                ('author', models.CharField(max_length=64, verbose_name='职位')),
                ('price', models.FloatField(default=0.0, verbose_name='薪资')),
                ('publish_date', models.DateField(blank=True, null=True, verbose_name='入职时间')),
                ('category', models.CharField(default='未分类', max_length=32, verbose_name='书籍分类')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='添加日期')),
            ],
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='图片员工名字')),
                ('description', models.TextField(default='', verbose_name='图片考勤情况')),
                ('img', models.ImageField(upload_to='image/%Y/%m/%d/', verbose_name='图片')),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='management.Book', verbose_name='所属书籍')),
            ],
        ),
    ]
