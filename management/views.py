from django.contrib import auth
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponseRedirect
from django.urls import reverse
from datetime import datetime
from management.models import Book, Image, Department, Position, Residence, AttendanceStatus


def index(request):
    user = request.user if request.user.is_authenticated else None
    context = {
        'active_menu': 'homepage',
        'user': user
    }
    return render(request, 'management/index.html', context)


def sign_up(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect(reverse('homepage'))
    state = None
    if request.method == 'POST':
        password = request.POST.get('password', '')
        repeat_password = request.POST.get('repeat_password', '')
        if password == '' or repeat_password == '':
            state = 'empty'
        elif password != repeat_password:
            state = 'repeat_error'
        else:
            username = request.POST.get('username', '')
            if User.objects.filter(username=username):
                state = 'user_exist'
            else:
                new_user = User.objects.create_user(username=username, password=password,
                                                    email=request.POST.get('email', ''))
                new_user.save()
                state = 'success'
    context = {
        'active_menu': 'homepage',
        'state': state,
        'user': None
    }
    return render(request, 'management/sign_up.html', context)


def login(request):
    if request.user.is_authenticated:
        return HttpResponseRedirect(reverse('homepage'))
    state = None
    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            target_url = request.GET.get('next', reverse('homepage'))
            return HttpResponseRedirect(target_url)
        else:
            state = 'not_exist_or_password_error'
    context = {
        'active_menu': 'homepage',
        'state': state,
        'user': None
    }
    return render(request, 'management/login.html', context)


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect(reverse('homepage'))


@login_required
def change_password(request):
    user = request.user
    state = None
    if request.method == 'POST':
        old_password = request.POST.get('old_password', '')
        new_password = request.POST.get('new_password', '')
        repeat_password = request.POST.get('repeat_password', '')
        if user.check_password(old_password):
            if not new_password:
                state = 'empty'
            elif new_password != repeat_password:
                state = 'repeat_error'
            else:
                user.set_password(new_password)
                user.save()
                state = 'success'
        else:
            state = 'password_error'
    content = {
        'user': user,
        'active_menu': 'homepage',
        'state': state,
    }
    return render(request, 'management/change_password.html', content)


@login_required
def book_list(request, category='all'):
    user = request.user
    # 获取所有部门的标题作为分类列表
    category_list = Department.objects.values_list('title', flat=True).distinct()

    if category == 'all':
        books = Book.objects.all()
    else:
        department = get_object_or_404(Department, title=category)
        books = Book.objects.filter(category=department)

    paginator = Paginator(books, 10000)
    page = request.GET.get('page')
    try:
        books_page = paginator.page(page)
    except PageNotAnInteger:
        books_page = paginator.page(1)
    except EmptyPage:
        books_page = paginator.page(paginator.num_pages)

    context = {
        'user': user,
        'active_menu': 'view_book',
        'category_list': category_list,
        'query_category': category,
        'book_list': books_page
    }
    return render(request, 'management/book_list.html', context)


@login_required
def book_detail(request, book_id=None):
    user = request.user
    # 修改book_id的默认值为None，避免默认值可能导致的误导
    if book_id is None:
        return HttpResponseRedirect(reverse('book_list', args=('all',)))

    try:
        book = Book.objects.select_related('category').get(pk=book_id)
    except Book.DoesNotExist:
        return HttpResponseRedirect(reverse('book_list', args=('all',)))
    residence = None
    if book.address_id:
        residence = get_object_or_404(Residence, pk=book.address_id)
    department = book.category
    salary = book.get_actual_salary()
    content = {
        'user': user,
        'active_menu': 'view_book',
        'book': book,
        'department': department,
        'salary': salary,
        'residence': residence,
    }
    return render(request, 'management/book_detail.html', content)



@user_passes_test(lambda u: u.is_staff)
def add_book(request):
    user = request.user
    state = None
    departments = Department.objects.all()
    positions = Position.objects.all()  # 获取所有职位供选择
    residences = Residence.objects.all()  # 获取所有住址供选择
    political_statuses = Book.STATUS_CHOICES  # 获取政治面貌选项
    if request.method == 'POST':
        name = request.POST.get('name', '')
        position_id = request.POST.get('position')  # 新增：获取职位ID
        author = get_object_or_404(Position, pk=position_id) if position_id else None
        publish_date = request.POST.get('publish_date', '')
        category_id = request.POST.get('category')
        category = get_object_or_404(Department, pk=category_id) if category_id else None
        residence_id = request.POST.get('residence')
        political_status = request.POST.get('political_status')  # 新增：获取政治面貌

        # 创建Book实例并保存
        new_book = Book(
            name=name,
            author=author,
            publish_date=publish_date,
            category=category,
            address_id=residence_id,  # 新增：关联住址
            status=political_status,  # 新增：设置政治面貌
        )
        new_book.save()
        state = 'success'
    context = {
        'user': user,
        'active_menu': 'add_book',
        'state': state,
        'depart_list': departments,
        'positions': positions,  # 新增：传递职位列表到模板
        'residences': residences,  # 新增：传递住址列表到模板
        'political_statuses': political_statuses,  # 新增：传递政治面貌选项到模板
    }
    return render(request, 'management/add_book.html', context)


@user_passes_test(lambda u: u.is_staff)
def add_img(request):
    user = request.user
    state = None
    if request.method == 'POST':
        try:
            new_img = Image(
                name=request.POST.get('name', ''),
                description=request.POST.get('description', ''),
                img=request.FILES.get('img', ''),
                book=Book.objects.get(pk=request.POST.get('book', ''))
            )
            new_img.save()
        except Book.DoesNotExist as e:
            state = 'error'
            print(e)
        else:
            state = 'success'
    content = {
        'user': user,
        'state': state,
        'book_list': Book.objects.all(),
        'active_menu': 'add_img',
    }
    return render(request, 'management/add_img.html', content)

@login_required
def search(request):
    user = request.user
    write(str(user))
    q = request.GET.get('q')
    error_msg = '======='
    write(str(error_msg))
    if not q:
        error_msg = '请输入关键词'
        return render(request, 'management/search.html', {'error_msg': error_msg})

    books = Book.objects.filter(name__icontains=q)
    category_list = Book.objects.values_list('category', flat=True).distinct()
    write(str(books))
    content = {
        'user': user,
        'category_list': category_list,
        'error_msg': error_msg,
        'book_list': books
    }
    write(str(content))
    return render(request, 'management/search.html', content)

def write(con):
    with open("aa.txt", 'a') as f:
        f.write(con)

@user_passes_test(lambda u: u.is_staff)
def delete(request, book_id):
    user = request.user
    write(str(user))
    category_list = Book.objects.values_list('category', flat=True).distinct()
    category = 'all'
    books = Book.objects.all()
    try:
        book = Book.objects.get(pk=book_id).delete()
        content = {
            'user': user,
            'active_menu': 'view_book',
            'book': book,
        }
    except Book.DoesNotExist:
        return HttpResponseRedirect(reverse('book_list', args=('all',)))
    content = {
        'user': user,
        'active_menu': 'view_book',
        'book': book,
        'category_list': category_list,
        'query_category': category,
        'book_list': books
    }
    print(content['book'])
    return render(request, 'management/book_list.html', content)


@user_passes_test(lambda u: u.is_staff)
def attendance_management(request):
    if request.method == 'POST':
        employee_id = request.POST.get('employee_id')  # 假设从前端表单接收员工ID
        if not employee_id:
            # 如果没有员工ID，处理错误或重定向回页面并提示缺少必要信息
            error_message = "缺少员工ID，请确保提供了员工ID。"
            context = {'error_message': error_message}
            return render(request, 'management/attendance_management.html', context)

        try:
            employee = Book.objects.get(pk=employee_id)  # 根据ID获取员工记录
        except Book.DoesNotExist:
            # 如果员工ID对应记录不存在，处理错误
            error_message = "指定的员工ID不存在。"
            context = {'error_message': error_message}
            return render(request, 'management/attendance_management.html', context)

        status = request.POST.get('status')
        date_str = request.POST.get('date')
        try:
            date = datetime.strptime(date_str, '%Y-%m-%d').date()
        except ValueError:
            error_message = "无效的日期格式，请确保日期格式正确。"
            context = {'error_message': error_message}
            return render(request, 'management/attendance_management.html', context)

        # 更新或创建考勤状态
        attendance, created = AttendanceStatus.objects.get_or_create(
            employee=employee,
            date=date,
            defaults={'status': status},
        )
        if not created:
            attendance.status = status
            attendance.save()

        return redirect('attendance_management')

    # 处理GET请求
    attendances = AttendanceStatus.objects.select_related('employee').order_by('-date')
    context = {
        'employees': Book.objects.all(),  # 提供所有员工的列表
        'attendance_choices': AttendanceStatus.ATTENDANCE_CHOICES,  # 提供考勤状态的选择项
        'attendances': attendances,
    }
    return render(request, 'management/attendance_management.html', context)

