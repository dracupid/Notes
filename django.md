* 创建工程 `$ django-admin.py startproject name`（可以在任何目录）
* 启动开发用服务器`$ python manage.py runserver [IP:PORT]`(IP是允许访问服务器的IP，0.0.0.0表示公开)
* model与数据库迁移同步：
	`python manage.py makemigrations appName` //提交变化
	`python manage.py migrate`			//执行迁移

	`python manage.py check` 		//检查迁移的正确性
	`python manage.py sqlmigrate appName 序号` 	//查看迁移用的SQL语句
* 创建APP：`$ python manage.py startapp polls`（APP是可迁移的插件），别忘了在setting里加上app
* 在项目环境中打开shell `$ python manage.py shell`
* 运行测试：`python manage.py test appName`
#model
* 每一个类是model.Model的子类。
* 每个属性是一个Field类，第一个位置参数是显示的字段名（没有则用属性名），属性名是储存的字段名。
* __str__(self)方法是字符串返回值
* 注册model，允许在admin中修改：在admin.py`admin.site.register(modelName)`
#template
* 先在项目的TEMPLATE_DIRS找，然后再在各app的templates子目录下找
* 使用.访问一切，顺序是map、属性、listIndex。函数不需要括号
* {% python语句 %}  {{ 要替换的变量 }}
* 每一个post的form下面一行使用{% csrf_token %}标签进行防止CSRF
###加载模版的方法
	template = loader.get_template('模板名')
	context = RequestContext(request, {})
	return HttpResponse(template.render(context))
###加载模板的捷径
	context = {}
    return render(request, '模板名', context)
	//接受request、模板和替换字典做参数，返回HttpResponse
#view
* 返回HttpResponse或者raise Http404
###获取对象
	try:
        question = Question.objects.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404
捷径

	question = get_object_or_404(Question, pk=question_id)
###General View	
	url(r'^(?P<pk>\d+)/results/$', views.ResultsView.as_view(), name='results')

	class ResultsView(generic.DetailView):
	    model = Question
	    template_name = 'polls/results.html'
#测试
* app的test.py文件
* 一个case类继承TestCase类
* 测试用类方法以test开头
#static file
* 在app目录下创建static文件夹