from django import forms



class UserForm(forms.Form):
    mobile = forms.CharField(label="会员手机", max_length=11,
                               widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="密码", max_length=16,
                               widget=forms.PasswordInput(attrs={'class': 'form-control'}))


class RegisterForm(forms.Form):
    mobile = forms.CharField(label="会员手机", max_length=11,
                               widget=forms.TextInput(attrs={'class': 'form-control'}),error_messages={'required':u'邮箱不能为空'})
    password1 = forms.CharField(label="密码", max_length=16,
                               widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label="确认密码", max_length=256,
                                widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="邮箱地址", widget=forms.EmailInput(attrs={'class': 'form-control'}))

    name = forms.CharField(label="真实姓名", max_length=10,
                           widget=forms.TextInput(attrs={'class': 'form-control'}))
    area = forms.CharField(label="所在地区", max_length=30,
                           widget=forms.TextInput(attrs={'class': 'form-control'}))
    address = forms.CharField(label="详细地址", max_length=30,
                              widget=forms.TextInput(attrs={'class': 'form-control'}))
    qq = forms.CharField(label="QQ号", max_length=11,
                         widget=forms.TextInput(attrs={'class': 'form-control'}))
    wx = forms.CharField(label="微信号", max_length=20,
                         widget=forms.TextInput(attrs={'class': 'form-control'}))
    tb = forms.CharField(label="旺旺号", max_length=15,
                         widget=forms.TextInput(attrs={'class': 'form-control'}))

class UserInfoForm(forms.Form):
    name = forms.CharField(label="真实姓名", max_length=10,
                               widget=forms.TextInput(attrs={'class': 'form-control'}))
    area = forms.CharField(label="所在地区", max_length=30,
                               widget=forms.TextInput(attrs={'class': 'form-control'}))
    address = forms.CharField(label="详细地址", max_length=30,
                           widget=forms.TextInput(attrs={'class': 'form-control'}))
    qq = forms.CharField(label="QQ号", max_length=11,
                           widget=forms.TextInput(attrs={'class': 'form-control'}))
    wx = forms.CharField(label="微信号", max_length=20,
                           widget=forms.TextInput(attrs={'class': 'form-control'}))
