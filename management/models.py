from django.db import models

class Department(models.Model):
    title = models.CharField(max_length=64, verbose_name='部门名称')

    def __str__(self):
        return self.title

class Position(models.Model):
    title = models.CharField(max_length=64, verbose_name='职位')
    department = models.ForeignKey(Department, on_delete=models.CASCADE, verbose_name='所属部门')
    salary = models.FloatField(default=0.0, verbose_name='薪资')

class Residence(models.Model):
    province = models.CharField(max_length=64, verbose_name='省份')
    city = models.CharField(max_length=64, verbose_name='城市')


class Book(models.Model):
    name = models.CharField(max_length=128, verbose_name='员工名字')
    author = models.ForeignKey(Position, on_delete=models.CASCADE, verbose_name='职位')
    publish_date = models.DateField(null=True, blank=True, verbose_name='入职时间')
    category = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='所属部门')
    create_datetime = models.DateTimeField(auto_now_add=True, verbose_name='添加日期')
    address_id = models.IntegerField(null=True, blank=True, verbose_name='户口所在地ID')
    STATUS_CHOICES = [
        ('CP', '中共党员'),
        ('CY', '共青团员'),
        ('LX', '群众'),
        ('QT', '其他'),
    ]
    status = models.CharField(max_length=2, choices=STATUS_CHOICES, default='LX', verbose_name='政治面貌')

    def __str__(self):
        return self.name

    def get_actual_salary(self):
        return self.author.salary

class Image(models.Model):
    name = models.CharField(max_length=128, verbose_name='图片员工名字')
    description = models.TextField(default='', verbose_name='图片考勤情况')
    img = models.ImageField(upload_to='image/%Y/%m/%d/', verbose_name='图片')
    book = models.ForeignKey(Book, on_delete=models.CASCADE, verbose_name='所属书籍')

    def __str__(self):
        return self.name


class AttendanceStatus(models.Model):
    ATTENDANCE_CHOICES = [
        ('ON_DUTY', '在岗'),
        ('ON_LEAVE', '请假'),
        ('ABSENT', '旷工'),
        ('ON_BUSINESS', '出差'),
    ]

    employee = models.ForeignKey('Book', on_delete=models.CASCADE, verbose_name='员工')
    status = models.CharField(max_length=32, choices=ATTENDANCE_CHOICES, default='ON_DUTY', verbose_name='考勤状态')
    date = models.DateField(verbose_name='日期')

    def __str__(self):
        return f"{self.employee.name} - {self.get_status_display()} - {self.date}"
