##一、面向对象
###1. 定义

	class Person:
		var = 123 //静态data attribute，只能用类名引用修改
		def funName(self,args...) //实例方法，第一个参数为self
* 每个类方法定义时必须有self，但调用时不需要考虑self
* obj.funName(args)【method对象】等价于Class.funName(obj，args)【function对象】
* class语句中的代码有独立的命名空间。类的定义实质是语句块，可以混杂各种可以执行的语句。
* attribute的引用必须限定。实例attribute用self，类attribute用类名

###2. 实例化
	
	obj = class(args) //调用__init__(obj,args)
###3. 继承
	class(superClassName...):	//支持多继承
* 未指定父类时继承object，不自动调用父类的`__init__`
* 访问父类attribute：
	* superClass.attr
	* super().attr
* 多继承中，同名则按先继承的类。
* attribute查找从子类到基类进行。

###4. 多态
* python的多态是基于对象的行为（duck type），而不是继承。可以把这些行为集合理解成隐含的接口（protocol）
* 访问attribute时按照实例内部、类定义、基类定义顺序进行查找

###5. 静态方法和类方法
**静态方法**：
视作定义在类空间的普通函数，可用于使用不同方法实例化

	class A：
		@staticmethod
		def staticme(args):pass
	A.staticme(args)
**类方法**：
将类本身作为对象操作的方法。一般用于继承中，父类定义类方法，子类调用可返回子类对象。	

	class A：
		@classmethod
		def classme(cls,args):pass
	A.classme(args)

##6. property
在访问时动态生成的attribute

	class Circle:
		@property
		def area(self):
			return math.pi*self.radius**2
		@property
property可以拦截对attribute的设置和删除
	class Foo:
		@property   //setter
		def name(self):
			return self.__name
		@name.setter
		def name(self,value):
			self.__name==value
		@name.deleter
		def name(self)
			raise TypeError
###7. 私有
python没有真正的私有化支持

* 在attribute名字前加上__，表示私有attribute
> 类的定义中，__开始的名字被翻译为_className__name，实际上可以通过这个名字在外面调用。【同名不会与基类冲突】

- 在变量名字前加上_，import *时不会导入，但可以直接调用

###8. 抽象基类

	from abc import ABCMeta, abstractmethod,abstractproperty
	class Foo(meatclass=ABCMeta):
		@abstractmethod
		def span(self,a,b):pass
		@abstractproperty
		def name(self):pass
	Foo.register(SomeClass) //向抽象基类注册，不会检查是否实现抽象attr，只影响类型检查。

###9. 元类
知道如何创建和管理类的对象，是类对象的类型，默认是type
###10. 接口的判断
* hasattr(obj/class,'成员名')：判断是否具有该成员
* hasattr(name,'__call__')：判断是否可调用
* getattr(obj/class,'成员名'[,默认值])：获得成员值
* setattr(obj/class,'成员名',值)：设置成员值

##二、模块与包
* 每个python程序都是一个模块，每个模块有各自的作用域
* 在导入模块时，其中的代码被执行。导入多次只执行第一次！

###1. import
	
	import mod1[as 别名][,mod2,...] //访问时需要模块名前缀
	from mod import var1[as 别名][,var2...]  //可直接使用var
	from mod import * //只导入`__all__`中指定的名字，只能用于模块头，尽量少用
> from可以使用相对路径 .  ..

###2. 模块搜索路径
* 存放在sys.path中，可包含字典名称、zip、egg
* sys.path.append('路径')或在OS中设置PYTHONPATH

###3. 主程序
通过全局变量`__name__`是否等于`"__main__"`确定当前是主程序还是模块加导入

###4. 包
* 包是包含`__init__.py`文件的文件夹
* 包名以.分割层次
####（1）导入包（模块）
* 导入模块若在包中前面要加包名
* from 包名 import 模块
* 第一次导入包的任何部分，都会执行`__init__.py`文件

##三、输入输出
###1. 命令行参数
* 使用sys.argv列表获取，argv[0]是程序名
* 复杂处理可以使用optparse模块

###2. 环境变量
* os.environ字典获取

###3. 文件
	f = open(name, mode='r') //模式r w a r+读写 ,b
	f.read(size=all)			//EOF为空字符串
	f.readline(size=LINE)		//单行输入的最多字符为size
	list(f) or f.readlines()	//读取全部（剩余）文件
	for line in f 	//文件为可迭代对象，每次返回一行
	f.write(str) 		//返回写入的字符数
	f.writelines(iterable)
	print("",file=f)//写入文件 py3
	print >>f,""	//写入文件 py2
	f.tell() 		//当前位置
	f.seek(offset, from_what=0) //0表示头，1表示当前，2表示尾。文本模式from_what只能是0，offset只能是0或tell返回值
	f.close()
###4. 标准输入、输出和错误
* sys.stdin/stdout/stderr，可以重定向
* print关联stdout； input关联stdin
* 键盘中断为KeyboardInterrupt

####print

	print(value, ..., sep=' ', end='\n', file=sys.stdout, flush=False)	
####input：
	x=input([提示语句])		
###5. 对象持久化(pickle和shelve模块)
####pickle:序列化为字节流
* dump(obj,file):写入文件
* load(f):从文件读取

####shelve:类似字典的数据库
	db = open(filename)//打开文件
	db[key1]=obj1      //key必须是字符串
	obj2=db[key2]
	db.close()

##四、多线程
###1. threading模块

##五、HTTP 
urllib包 Beautiful Soup