from django.shortcuts import render, redirect, get_object_or_404
from .models import Message, BlogType, Blog
from django.core.paginator import Paginator
from django.conf import settings
from django.db.models import Count
import markdown


#
def get_blog_list_common_data(request, blogs_all_list):
    paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
    page_num = request.GET.get('page', 1)  # 获取url的页面参数（GET请求）
    page_of_blogs = paginator.get_page(page_num)
    current_page_num = page_of_blogs.number  # 获取当前页
    # 获取当前页码前后各两页的页码范围
    page_range = list(range(max(current_page_num-2,1),current_page_num)) + \
                list(range(current_page_num,min(current_page_num+2,paginator.num_pages)+1))
    # 加上省略页码标记
    if page_range[0] - 1 >= 2:
        page_range.insert(0,'...')
    if page_range[-1]  + 2 <= paginator.num_pages:
        page_range.append('...')
    #加上首页和尾页
    if page_range[0]!=1:
        page_range.insert(0,1)
    if page_range[-1]!=paginator.num_pages:
        page_range.append(paginator.num_pages)

    # 获取日期归档对应的博客数量
    blog_dates = Blog.objects.dates('c_time', 'month', order="DESC")
    blog_dates_dict = {}
    for blog_date in blog_dates:
        blog_count = Blog.objects.filter(c_time__year=blog_date.year,
                                         c_time__month=blog_date.month).count()
        blog_dates_dict[blog_date] = blog_count

    # 传入模板的内容包括
    # 当前页码下的7篇文章 <QuerySet [<Blog: <title: 第一篇文章>>,...]>
    # 当前页码数 <Page 1 of 5>
    #   page_of_blogs.paginator.count
    #   page_of_blogs.number
    #   page_of_blogs.paginator.num_pages
    # 全部页码范围 [1, 2, 3, '...', 5]
    # 已存在的全部分类 <QuerySet [<BlogType: Django>, <BlogType: 随笔>, <BlogType: 感悟>, <BlogType: 旅行>]>
    # 日期规定信息 {datetime.date(2019, 5, 1): 0} 2019，5月1
    context = {
        'blogs': page_of_blogs.object_list,
        'page_of_blogs': page_of_blogs,
        'page_range' : page_range,
        'blog_categorys' : BlogType.objects.annotate(blog_count=Count('blog')),
        'blog_dates' : blog_dates_dict
    }
    return context


def blog_list(request):
    all_blog = Blog.objects.all()
    context = get_blog_list_common_data(request, all_blog)
    return render(request, 'index.html', context=context)


def blog_detail(request, blog_pk):
    #blog = get_object_or_404(Blog, pk=blog_pk)
    blog = Blog.objects.get(pk=blog_pk)
    if not request.COOKIES.get('blog_%s_read' % blog_pk):
        blog.read_num += 1
        blog.save()
    blog.content = markdown.markdown(blog.content.replace("\r\n", '\n'),
        extensions=[
            # 包含 缩写、表格等常用扩展
            'markdown.extensions.extra',
            # 语法高亮扩展
            'markdown.extensions.codehilite',
        ]
    )
    context = {
        'previous_blog': Blog.objects.filter(c_time__gt=blog.c_time).last(),
        'next_blog': Blog.objects.filter(c_time__lt=blog.c_time).first(),
        'blog': blog
    }
    response = render(request, 'index.html', context=context)  # 响应
    response.set_cookie('blog_%s_read' % blog_pk, 'true')

    return response


def blog_category(request, category_pk):
    blog_category = get_object_or_404(BlogType, pk=category_pk)    #得到单纯的对象名，如 Django
    all_blog = Blog.objects.filter(blog_type=blog_category)     #得到所有的所有符合的QuerySet
    context = get_blog_list_common_data(request, all_blog)
    context['blog_category'] = blog_category

    return render(request, 'blog/blog_category.html', context=context)


def blog_date(request,year,month):
    all_blog = Blog.objects.filter(c_time__year=year,c_time__month=month)
    context = get_blog_list_common_data(request,all_blog)
    context['current_blog_data'] = '%s年%s月'%(year,month)
    return render(request, 'blog/blog_date.html',context=context)


# 留言板
def message(request):
    name = request.POST['name']
    email = request.POST['email']
    content = request.POST['message']
    Message.objects.create(name=name, email=email, content=content)

    return redirect('index')






