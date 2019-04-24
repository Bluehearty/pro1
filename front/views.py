from django.shortcuts import render,redirect
from django.http import HttpResponse
from . import models
from .forms import UserForm,RegisterForm,UserInfoForm

login_state = 0 #0未登陆，1登陆成功
mobile = '123456789'

def login(request):
    if request.method =='POST':
        '''mobile= request.POST.get('mobile',None)
        password = request.POST.get('password',None)
        message = "请检查填写的内容！"
        if mobile and password:  # 确保用户名和密码都不为空
            # 用户名字符合法性验证
            # 密码长度验证
            # 更多的其它验证.....
            try:
                #user = models.User.objects.get(name=mobile)
                user = models.User.objects.get(mobile=mobile)
                if user.password == password:
                    global login_state
                    login_state = 1
                    return redirect('index')
                else:
                    message = "密码不正确!"
            except:
                message = "用户名不存在!"
        return render(request, 'login.html',{"message": message})'''

        login_form = UserForm(request.POST)
        message = "请检查填写的内容！"
        if login_form.is_valid():
            global mobile
            mobile = login_form.cleaned_data['mobile']
            password = login_form.cleaned_data['password']
            try:
                user = models.User.objects.get(mobile=mobile)
                if user.password == password:
                    global login_state
                    login_state = 1
                    return redirect('index')
                else:
                    message = "密码不正确！"
            except:
                message = "用户不存在！"
        return render(request, 'login.html', locals())
    elif request.method =='GET':
        login_form = UserForm()
        return render(request, 'login.html', locals())
    else:
        return HttpResponse('method既不是POST也不是GET!')

def index(request):
    if login_state == 0:
        return redirect('login')
    elif login_state == 1:
        return render(request,'index.html')
    else:
        return HttpResponse('错误！')


def register(request):
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = '请检查填写的内容！'
        if register_form.is_valid(): #验证
            mobile = register_form.cleaned_data['mobile']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            name = register_form.cleaned_data['name']
            area = register_form.cleaned_data['area']
            address = register_form.cleaned_data['address']
            qq = register_form.cleaned_data['qq']
            wx = register_form.cleaned_data['wx']
            tb = register_form.cleaned_data['tb']
            if password1 != password2: #判断两次密码是否相同
                message = '两次输入的密码不相同！'
                #return redirect('/register/') 返回/register/register/
                return render(request, 'register.html', locals())
            else:
                same_name_user = models.User.objects.filter(mobile=mobile)
                if same_name_user:
                    message = '手机号已存在！'
                    #return redirect('/register/')
                    return render(request, 'register.html', locals())
                same_email_user = models.User.objects.filter(email=email)
                if same_name_user: #邮箱唯一
                    message = '邮箱已被注册，请更换邮箱地址！'
                    #return redirect('/register/')
                    return render(request, 'register.html', locals())
                # 当一切都OK时，创建新用户
                new_user = models.User.objects.create()
                new_user.mobile = mobile
                new_user.password = password1
                new_user.name = name
                new_user.email = email
                new_user.area = area
                new_user.address = address
                new_user.QQ = qq
                new_user.WX = wx
                new_user.tb = tb

                new_user.save()
                return redirect('/login/') #自动跳转到登陆页面

    elif request.method == 'GET':
        register_form = RegisterForm()
        return render(request, 'register.html', locals())
    else:
        return HttpResponse('method既不是POST也不是GET!')



def logout(request):
    global login_state
    login_state = 0
    return redirect('/login/')

def base1(request):
    return render(request,'base1.html')

def applied(request):
    pass
    return render(request,'applied.html')

def user(request):
    global mobile
    #current_mobile = models.User.objects.filter(mobile=mobile)
    current_mobile = models.User.objects.get(mobile=mobile)

    return render(request, 'user.html',{'current_mobile':current_mobile})

def info(request):
    global mobile
    current_mobile = models.User.objects.get(mobile=mobile)
    if request.method == 'POST':
        info_form = UserInfoForm(request.POST)
        if info_form.is_valid():
            # 如果检验全部通过
            print('44',info_form.cleaned_data)
        else:
            print('55',info_form.cleaned_data)
        current_mobile.area = info_form.cleaned_data['area']
        current_mobile.address = info_form.cleaned_data['address']
        current_mobile.QQ = info_form.cleaned_data['qq']
        current_mobile.WX = info_form.cleaned_data['wx']

        current_mobile.save()

        return render(request,'info.html',{'current_mobile':current_mobile})

    elif request.method == 'GET':
        return render(request, 'info.html', {'current_mobile':current_mobile})
    else:
        return HttpResponse('method既不是POST也不是GET!')


def setpassword(request):
    global mobile
    current_mobile = models.User.objects.get(mobile=mobile)
    if request.method == 'POST':
        pwd = request.POST.get('pwd',None)
        new_pwd = request.POST.get('new_pwd',None)
        pwd_confirm = request.POST.get('pwd_confirm',None)
        message = '请确保两次密码一致！'
        if pwd == current_mobile.password:
            if new_pwd == pwd_confirm:
                current_mobile.password = new_pwd
                current_mobile.save()
                message = '设置成功'
                state = 1 #1表示成功
                return render(request, 'setpassward.html', locals())
            else:
                message = '两次输入的密码不一致，请重新输入'
                state = 0 #0表示失败
                return render(request,'setpassward.html',locals())
        else:
            message = '密码输入错误，请重新输入'
            state = 0
            return render(request,'setpassward.html',locals())


    else:
        return render(request,'setpassward.html')
