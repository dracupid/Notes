#Python Basic 2
----------------------------
##一、运算符与表达式
###（1）数字运算
* 除法：/ py3中总是返回精确结果，py2中如果操作数都是整数则进行截断除法
* 截断除法：// 结果用地板函数转换成整数
* 乘方：**或pow函数
* 内置函数
	* abs(x)
	* divmod(x,y):返回（x / /y,x % y）
	* pow(x,y[,modulo])：(x ** y) % modulo
	* round(number, ndigits=0)：四舍五入到小数点后ndigits位
		* py3会将中间数舍入到最近的偶数 如0.5->0 1.5->2
* 支持增量赋值`x+=1`和链式赋值`x=y=z=0`

###（2）关系运算
* 比较运算可以连接： x < y == z ; 1 < x < 5
	* 等价于相邻两两比较的and
* 比较运算可用于序列：依次比较对应位置的元素，类似字典顺序
	* `[1,2] > [2,3]`
	* `"alpha" > "beta"`
* 只能对同类对象进行比较。内置数字类型会自动转换
* 所有关系运算符优先级相同

###（3）类型转换
* 数值： int(x,base=10) ; float(x) ; complex(real,imag=0)
* 布尔值：bool(x)
* 字符串：str(x) ; repr(x) ; format(x,[,form_spec])
* 返回对象：eval(str)
* 容器：tuple list set frozenset dict——参数是可迭代对象
* 特殊字符串：chr(int) ; ord(char) ; hex(int) ; bin(int) ; oct(int)

###（4）布尔运算符
and or not ，短路逻辑
x or y中，如果x为真，直接返回x的值，而不是和c一样返回1

	name = input("hello") or "noName"	//利用断路实现三元运算符的效果
###（5）条件表达式
简化if语句,常用于推导式和生成器

	trueReturn if condition else falseReturn
	minValue = a if a<b else b 	//类似C语言的三元运算

##二、程序结构与控制流
###1. 条件语句
	if condition：
		语句
	[elif condition：
		语句
	else：
		语句]
> python没有switch

###2. 循环与迭代
语句不具有独立作用
**while**

	while condition:
		语句
**for**  只支持可迭代对象

	for 元素 in 可迭代对象:
		语句
	[else:
		语句]
* else子句在循环语句正常结束，没有break时执行（理解为在循环后执行，但break会跳到else后）
* 循环中可以使用可迭代解包：`for key,value in d.items()`

####（1）并行迭代——同时迭代两个序列
zip(seq1,seq2...)：返回zip对象（[(seq1[0],seq2[0]),(seq1[1],seq2[1])....]，长度按最短序列）
	
	for name,age in zip(names,ages)
####（2）编号迭代——获得对象的索引
enumerate(seq)：返回enumerate可迭代对象（视作(index,value)元组序列）
	
	for index,str in enumerate(strings)
####（3）break，continue
* 跳出多重循环可以使用异常

###3. 异常
* 异常的基类：BaseException。自定义异常类要继承Exception
####（1）抛出异常
	raise Exception //类
	raise Exception(["提示语"]) //对象
	raise 	//引发最近一次生成的异常
####（2）捕捉异常
	try:
	except Exception [as e]: //Exception处理除程序退出外的所有异常
	except (Exc1,Exc2,...) [as e]: 	//同时捕捉多个异常,获得异常对象
	except:						//捕捉所有异常
	else：						//未发生异常时执行
	finally：					//一定会被执行。
* 未被捕捉的异常会自动外抛
* except子句中可以重新抛出异常，使用带或不带参数的raise语句
* 异常被捕捉后函数返回None
* 异常之禅：假定语句执行正确，通过异常处理错误。先判断能否执行正确会降低效率

###4. 上下文管理器与with语句

	with 上下文管理器对象 [as var]：
		语句

	with open('debuglog','a') as f:
		f.write('buginfo')

	lock=threading.Lock()
	with lock:
		statemants
* 上下文管理器对象实现了`__enter__(self)`和`__exit__(self,type,value,tb)`方法
* var存放`__enter__(self)`的返回值
* 离开with语句时`__exit__`一般进行资源释放。
* 使用contextlib模块进行更简单的自定义上下文管理器

###5. 断言

	assert condotion[,提示语]	//False时AssertionError
###6. 其他语句
* pass——空代码块，作用类似C中的{}。
* del——删除变量名（或列表元素,字典key,对象attribute），而不删除引用的对象。python中只有垃圾回收可以删除对象。 `del x`

##三、函数
###1. 定义函数
	def funcName(args...):
		函数体
* python函数可以嵌套！

###2. 返回值
* 没有返回值实际返回None
* 可以用元组返回多个值，利用可迭代解包。

####返回值注解（Function Annotations）：

	 def f(ham: 42) -> "返回值的注释":
		pass
	 print(f.__annotations__)

###3. 参数
* 按引用传递。
####关键字参数
	funcName(arg2='',arg1='')//显式指出变量名称，而不顾顺序，
>必须用在位置需参数后面
####参数默认值
	def funcName(agr1='')
> 默认值如果是可变对象，会在调用之间共享。建议使用None，在函数内判断创建
####参数收集/变长参数
拼接splicing操作符

	def funcNam(arg1...[,*argsTup][,**argsDict])	
> \*将其他的位置参数收集到元组中；**将其他的关键字参数收集到字典中
> *agrs之后的参数只能用关键词参数

####参数释放/解包
	def funcName(x,y):
		pass
	tup=(1,2)
	dict={"x":5,"y":6}
	funcName(*tup)
	funcName(**dict)

###4. 作用域
* 直接给全局变量赋值无效，会创建局部变量。
* 如果局部变量和全局变量无重名，可直接读。
* 如果局部变量和全局变量重名，需要 `globals()['varName']` globals()返回全局变量的字典
* 如果要修改全局变量，需要现在函数内声明`global varName`，此时对varName的修改会反映在全局
* 如果修改上一级的变量，使用nonlocal 替代global

###5. 闭包
* 闭包(`__closure__`)：将组成函数的语句和这些语句的执行环境（`__globals__`）打包在一起得到的对象
* 常用于惰性求值或延迟求值，或在函数调用之间保持状态，装饰器定义

###6. 装饰器
* 用于包装另一个函数（方法）或类的**函数**。
* 包装的主要目的是透明地修改或增强被包装对象的行为。


	@trace
	def square(x):pass
等价于
	
	def square(x):pass
	square = trace(square)
-

	@trace(args)
	def square(x):pass
等价于
	
	def square(x):pass
	temp = trace(args)
	square = temp(square)
> 单独成行。可以使用多个,按从后往前顺序作用
	
###7. 生成器与yield
* 使用yield语句，**动态按需**生成一个可迭代对象。
* 直接调用会返回生成器对象。该对象的`__next__()`被调用时执行函数。
* 每次产生一个值，函数会被冻结，下次从停止点开始执行。
* 结束的标志：return或StopIteration异常


	def func():
		a=[1,2,3,4,5]
		for s in a
			yield s
####生成器推导式
语法类似于列表推导式，但是最外面是（）。推导式返回一个生成器。
	
	g = ( i**2 for i in range(1,5))
> 可以在当前的圆括号内直接使用。比如作为函数参数时不需要圆括号。

###8. 协程与yield表达式
* yield语句作为出现在赋值运算符右边的表达式
* 动态的接受值进行处理的函数对象，使用(yield)接受send方法传来的参数
* 实现生产者-消费者模型
* 建议使用装饰器完成对`__next__()`的调用


	def func():
		while True:
			n = (yield [返回值])
	r = func() 
* `r.__next__()`：执行到第一条yield语句，必须调用
* `r.send()`：向第n条yield语句发送值，并运行到第n+1条yield语句。其返回是第n+1条yield的返回值
* `r.close()`：关闭
* 生成器和协程多用于系统、网络和分布式计算，数据流处理，如UNIX管道，文件处理


协程的调度是通过 send() 调用来传递任务，就是说，在producer执行期间，consumer是阻塞在 yield 表达式上。每一次send()都会传递值给相应的任务给consumer.可以看出来，协程确实是一种轻量级的线程，调度策略取决于什么时候发送"消息"
###9. 函数式编程
* map(func,seq[,seq...])：将seq的元素全部交给func执行，可用列表推导式`func(i) for i in seq`
* filter(func,seq[,initial])：使用返回bool值的func过滤seq，可用列表推导式`x for x in seq if func(x)`
* reduce(func,seq)：对指定参数个数个序列元素执行func，并将结果作为seq中元素迭代执行。
* lambda表达式`lambda args :　expression`:构建匿名函数，可用于上述func。`lambda x:x.isalnum()` `lambda x,y:x+y`

> `foo=lambda x:x*x` 等价于 `def foo(x): return x*x`

###10. 内置函数
* len():长度
* cmp(a,b)——比较
* vars():返回语句所在作用域/命名空间字典
* apply(func[,args[,kwargs]])：调用函数
* dir([moduleName=当前模块])：列出模块内容
* dir(对象名)：列出对象方法。

* eval(str[, globals[, locals]]):执行表达式字符串并返回结果
* exec(str[, globals[, locals]])：执行python代码。
	* globals和locals是字典形式的命名空间，默认为当前值





>方法safe_substitute不会因为缺少值或者错误使用$而报错
###（4）string模块 import string
####常量string.*
digits、letters（本地化的）、ascii_letters、lowercase、printable、punctuation、uppercase
####方法string.*
- maketrans("oldChars","newChars")：生成转换表，oldChars和newChars（等长）中每个字符进行一对一替换
- capwords(str[,sep])：将每个以sep为分隔的字串首字母大写。


