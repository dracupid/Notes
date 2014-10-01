#Python Basic 1
------------------------
- 帮助：help()/F1
- 空值：None
- 【CMD】执行语句： python -c 'command' [arg]
- 【CMD】执行模块： python -m module [arg]
- 【交互模式】中止输入： ctrl+C，尤其是用于多行语句
- 结束程序：Ctrl+D（UNIX），Ctrl+Z（Win），raise SystemExit（可带参数）
- attribute=data attributes +method
* \_ 表示上一个**输出**的表达式的值
##一、 词汇和语法
###1. 行结构和缩进
* 跨行符：\
	* 包含在括号和三引号中的语句不需要跨行符。
* 缩进建议使用空格
* ; 可选 ，可用于一行多条语句分隔。
* 注释：#

###2. 标识符
* `_name`：不能import
* `__name`：私有成员
* `__name__`：特殊方法

###3. 字面量
* 布尔值：True（1），False（0）
* 整数：
	* 0x 0o 0b表示十六、八、二进制。【py3不支持0开头八进制】
	* 无大小限制【py3中没有long】
* 浮点数
* 复数：使用j/J做虚部。
* 字符串：
	* 单引号、双引号
	* 三引号：多行字符串，内部引号、换行、tab等不需要转义
	* Unicode字符串
		* py3：所有字符串都是Unicode
		* py2：u'UnicodeString'
	* 原始字符串：保留转义字符字面值，尤其适用于正则表达式	`r'raw\string'`
		* 字符串末尾不能是\，除非`\\`。
* 空值：None
* 容器：｛｝，[]，()（序列、映射、集合）

###4. 文档字符串
模块、函数、方法、类的第一条语句是字符串，作为其一部分储存。

	def funcName(arg):
		'what does this do'
		return
	funcName.__doc__	//查看文档字符串

###5. 装饰器
函数、方法、类定义前使用，修改定义其行为
###6. 代码修饰
	#!/usr/bin/env python
	# -*- coding:UTF-8 -*- //py3中源文件默认为UTF-8

##二、内置类型
	type(objName)
* 一切都有类型
* 对象的类（类型）也是一个对象
-----
* NoneType
* 数字 —— int、long(py2)、float、complex、bool
	* 都有复数兼容的属性real、imag和方法conjugate()
	* 整数有有理数兼容的属性numerator、denominator
	* float.as_interger_ratio(): 浮点数转换成（分母，分子）元组
	* float.is_integer()：浮点数是否表示整数值。
	* float.hex()  float.fromhex()：十六进制浮点数
	* 假：False(0)、None、各种0、各种空
	* 真：True(1)、一切其他
* 序列 —— str、unicode（py2）、list、tuple、xrange（py2）、range（py3）
	* 字符串只能包含字符，列表元组包含任意类型。
	* 字符串元组不可变，列表可变
	* 序列都是可迭代对象。	
	* 可以嵌套
	* 0-index
* 映射 —— dict
	* 可变、无序
	* 字典是python唯一内建的映射类型
* 集合 —— set、frozenset
	* 无重复、无序
	* set可变，frozenset不可变
	
> 序列、映射、集合统称容器

####类型检查：
	isinstance(obj,type/vlass) //可以检查继承，首选
	type(0) == int
	type('a') is str

	issubclass(cls，cls)
###0. 可迭代对象
包括序列、集合、字典（可看作key的集合）、迭代器、生成器等。
####（1）可迭代解包（常用于元组）
将多个值的可迭代对象=解开，放到变量的序列里

	v1,v2,...,vn = iterable
	x,y,z=1,2,3	//多变量赋值，两侧要等量
	x,y=y,x		//交换变量
	x,y,*rest=1,2,3,4,5,6	//py3中，将多余的都收集到rest中
> 函数利用元组返回多个值，赋给多个变量

####（2）参数可以为可迭代对象的函数：
* len(obj)：长度
* min/max(iterable, key=None)：最值
* sum(iterable, start=0)：和+start的值。对于数字运算，start可以决定返回值的类型
* all/any(iterable)：所有/任意项为True?
* sorted(iterable, key=None, reverse=False):返回一个列表。key为比较器函数，对指定函数作用于元素的返回值排序
	* 可配合reversed()使用



###1. 序列通用方法
（1）索引index————访问某个元素

	"hello"[0] //越界IndexError
	seq[-1] 	//-1为最后一个元素，-2为倒数第二
（2）分片sliceing————获取一定范围内的元素
	
	seq[i=0:j=END:step=1] 	//前闭后开,步长不能为0，越界不报错
	"http://www.baidu.com/"[7:-1]
	seq[2:]
	seq[10:3:-2]	//步长可以为负数。倒序获取，注意索引要对换。
（3）序列连接————**同种**序列连接

	[1,2,3] + [4,5,6]
（4）序列乘法multiplying————生成原序列重复N次的新序列

	'PYTHON'*5
（5）成员资格 in,not in————值是否在序列中

	'wo' in 'world' //返回布尔值，可以是字符或子串
	2 not in [1,4,3]
（6）参数为序列的方法
* reversed(seq)：返回逆序后的list_reverseiterator迭代器对象
###2. 列表List：可变、[]
####（1）创建
	l=[1,2,3,4,5]
	m=l[:] 			//m=l类似于指针或引用，指向同一个列表
	l=[]或l=list()	//创建空列表
	l=list(iterable)		//将其他可迭代类型转换为列表
	l=list("hello")	//使用list从可迭代对象转换，不只是字符串
>列表转字符串：分隔符.join(列表) 
	`' '.join(['hello','world'])`  

####（2）改变列表的操作
* 元素赋值：`x[3]='h'`//越界IndexError
* 分片赋值：
	`x[2:4]=[1,2,3,4]`
	`x[2:4:2]=[1,2]`	
	* 可以用长度不同的列表进行赋值 
	* 可实现插入`x[1:1]=[1,2,3]`和删除`x[1:3]=[]`操作
	* 可以结合分片的各种用法  
* 删除元素/分片：
	`del x[3]`
	`del x[1:4:2]`

####（3）列表方法
* append(obj)【改变列表】：列表末尾追加新对象,等价a[len(a)]=obj
* count(obj)：计算对象出现次数
* extend(list)【改变列表】：列表末尾追加另一个序列，等价a[len(a):]=list
* index(obj,start=START,stop=END)：找出某个对象第一次出现的索引值。未找到ValueError。
* insert(pos,obj)【改变列表】：指定位置插入对象。
* pop(index=lastIndex)【改变列表】：删除并返回指定索引的对象。
* remove(obj)【改变列表】：移除对象的第一个匹配值，无返回值。未找到ValueError
* reverse()【改变列表】：列表逆序，无返回。
* sort(key=None, reverse=False)【改变列表】：排序，无返回。key为比较器函数，对指定函数作用于元素的返回值排序
* clear()：清空
* copy()：浅复制，等价于a[:]

####（4）列表推导式（List Comprehensions）
使用其他列表创建新列表，与for和if子句结合。**声明式编程。**，可用于查询
	
	[新元素表达式 for... if...for... if... ...]  //嵌套循环，表达式中变量为私有
	s=[]   //等价形式
	for xxx in xxx:
		if ...：
			for yyy in yyy：
				if ...: s.append(新元素表达式)

	[x*x for x in range(10)]
	[x+'+'+y for x in range(3) for y in range(3)]	
	[x*x for x in range(10) if x%3==0]

###3. 字符串
####（1）连接字符串
	'str1' 'str2' #只能用于字符串常量，空格、换行或续行
	str1+str2
####（2）toString
把值转换成面向用户的字符串（带引号）
	
	str(string)		//print默认使用，str是类型
	"hello" --> hello
	1000L --> 1000
把值转换成面向python表达式的字符串，该字符串可用eval重新创建该对象
	
	repr(string)	
	"hello" --> 'hello'
	1000L --> 1000L
####（3）字符串方法（不改变字符串）
**返回新字符串**

* capitalize()：首字母大写
* lower/upper():全部小/大写
* swapcase():大小写切换
* title()：首字母大写
* center/ljust/rjust(width,fillchar=' '): 将字符串在指定宽度内居中/左对齐/右对齐，并填充。
* zfill(width): 用0填充成指定长度
* expandtabs(tabsize=8):空格替换为tab
* join(iterable)：使用当前字符串连接字符串序列，返回字符串
* lstrip/rstrip/strip(chars=''):删除字符串头部/尾部/两端空白和chars中的每个字符
* replace(old,new,count=ALL)：替换count数量的子字符串。
* translate(转换表)：字符-->字符的批量替换。
	* 转换表是一个字典
* str.maketrans(转换前字符序列，转换后的对应字符序列)：生成转换表

**返回布尔值**

* isalnum():所有字符都是数字字母？
* isalpha():所有字符都是字母？
* isdigit():所有字符都是数字？
* islower/isupper():所有字符都是小/大写？
* isspace():所有字符都是空白？
* istitle():是标题字符串（单词首字母大写）？
* endswith/startswith(str,start=0, end=END]):是否以str结尾/开头

**返回整数**

* count(sub,start=0，end=END):子字符串出现次数
* find/rfind(sub,start=0，end=END):字符串首次/末次出现的位置，未找到-1
* index/rindex(sub,start=0，end=END):字符串首次/末次出现的位置，未找到ValueError

**返回其他序列**

* split(sep=空格、tab、换行, maxsplit=ALL):将当前字符串按照sep分隔成列表。最多分maxsplit次。
* rsplit(sep=空格、tab、换行, maxsplit=ALL):从后往前。区别在maxsplit指定时
* splitlines(keepends=false):将字符串分割成行列表。keepends用于指定是否保留换行符
* partition(sep):使用sep分割字符串，返回(head, sep, tail),未找到sep返回(s,'','')
* rpartition(sep):从后往前搜索，其他同partition

**编码解码**

* encode(encoding='utf-8', errors='strict')：返回字符串的编码版本字节字符串
* bytes.decode(encoding='utf-8', errors='strict') ：解码

####（4）字符串格式化
**基本转换说明符**：

	%[(key)][转换标志][最小字段宽度][.][精度]转换类型
	{arg[绕过__format__]:[[填充[对齐]][符号][0][最小字段宽度][.精度][转换类型]}
* 转换标志：- 左对齐，默认右对齐；+ 转换值前加正负号；0 字段宽度不够用0填充，不设置（或空格）则用空格填充
* 最小字段宽度：输出字符串的最小长度，如果是*则从元组读取
* 精度：输出字符串的最大字段宽度，或浮点数小数点后位数，或整数最小位数，如果是*则从元组读取
* 转换类型：类似C
* 填充：字段宽度不足时使用什么填充
* 对齐：<、>、^分别表示左对齐、右对齐、居中对齐
* 符号：+ 所有数字前加正负号，- 复数前加符号（默认值）， 空格 正数前就爱加空格
* 0：用0填充数字值前面的空白
* 绕过`__format__`:!s，对对象的str()返回值格式化； !r对对象的repr()返回值格式化
**①str % dict**

	"my ID is %(id)10d." % {'id':12358 }  
> 可借助vars()函数，该函数返回当前定义的所有变量-值的字典。

**②str % tuple**

	"Hello,%s. This is %s!" % ('world','zjc')  
>左侧出现%应使用%%  

**③字符串format函数**`str.format(*args,**kwargs)`
str为格式化字符串，使用{参数位置或参数名：格式化说明符}为占位符。本质是通过format()函数调用每个字段的`__format__(self,form_spec)`函数
* 使用位置参数: 
	`"My {0} is {1:03d}".format("age",7) //My age is 007`
* 使用关键字参数
	`"My {key} is {value:03d}".format(key="age",value=7) `

> 可以同时使用两种参数  
> 要输出花括号需要使用 {{ 和 }}  
> 可以占位符中可以使用字典或属性查找，如{0['a']}，{1.attr}
> 可以通过嵌套，从参数中提取格式化说明符中的值。只能嵌套一层。  
> 对于某一项，可以直接使用format(value[,form_spec])	

**④模板字符串 from string import Template**
类似UNIX Shell中的变量替换
	s=Template("hello $name")	//插入$使用$$
	s.subsitute(name="zjc")

	s=Template("I am ${x}ist,$name")	//变量是单词的一部分
	dic={'x':'scient','name':'zjc'}	
	s.substitute(dic)					//使用字典进行替换

###4. 元组tuple：不可变、()
####（1）创建
	t=1,2,3			//使用逗号分隔一些值
	t=(1,2,3)		//一般显式加圆括号
	t=()或t=tuple()	//空元组
	t=42,或t=(42,)	//一个值的元组必须加逗号，否则与算数式2混淆
	t=tuple([1,2,3])//使用tuple从其他序列转换，不只是字符串
####（2）存在的必要性
* 在映射中作为键
* 作为内建函数和方法的返回值

###5. range对象
* py2 是xrange对象。
* 使用range(start=0,end,step=1)产生
	* 从start~end的虚拟数列可迭代对象。
	* 按需计算，不是得到列表后返回。

###6. 字典
- key可以是任何**不可变**类型
- 可以理解为key的set，尤其体现在转换其它类型时
- 同一个字典中可以用多类型的key

####（1）创建
	d={key1:value1,key2:value2} //key有唯一性
	d={}或d=dict()				//空字典
	items=[(key1,value1),(key2,value2)];
	d=dict(items)				//使用dict从其他字典或(key,value)序列创建字典
	d=dict(key1=value1，key2=value2)		//这里的key必须是字符串，不加引号，类似于参数

####（2）操作
- d[key]：取key所关联的value，找不到KeyError
- d[key]=value：插入或修改。
- del d[key]：删除键为key的项。
- key in d：是否有**键**为key的项 

####（3）方法
- clear()：清除所有项
- copy()：浅复制
- fromkeys(keyList,value=None)：用给定的key创建字典，值为value。一般直接dict.fromkeys
- get(key,returnValue=None)：访问value，不存在时返回returnValue
- pop(key,returnValue=KeyError)：返回并删除d[key],不存在返回returnValue
- popitem()：元组形式返回并删除随机项。
- setdefault(key，value=None)：如有d[key]则返回d[key],否则返回value并添加d[key]=v
- update(dict)或update(key1=value1，key2=value2)：使用dict更新当前字典。添加新增项，覆盖原有项。
- items()：返回dict_item可迭代对象，可视作元组列表。【py3】
- keys()：返回dict_keys可迭代对象，可视作key列表。【py3】
- values()：将value以列表形式返回，包含重复值。

####（4）字典推导式
类似列表推导式
	{x:x*2 for x in (2,4,6)}


###7. 集合（set/frozenset）
####（1）创建
	s=set/frozenset() //空集合，不能用｛｝
	s=set/frozenset(序列)
	s={'a','b','c'}  //set
####（2）集合运算
ab都是集合

	'a' in s	//成员资格，属于
	a - b		//集合差  
	a | b		//集合并
	a & b		//集合交
	a ^ b		//集合异或/对称差（不相交部分）
	len(a)		//项目数
####（3）集合通用方法
b可以是任何可迭代对象
* copy()：浅复制
* difference(b)：-
* union(b):|
* intersection(b): &
* symmetric_diference(b):^
* isdisjoint(b):不相交？
* issubset(b):子集？
* issuperset(b):超集？
####（4）可变集合方法
b可以是任何可迭代对象
* add(item)：添加一项
* pop():返回并删除任意项
* discard(item):删除item，不存在无反应
* remove(item):删除item，不存在KeyError
* clear():清空集合
* update(b):添加b中所有项
* difference_update(b):删除b中的项
* intersection_update(b):添加交集
* symmetric_difference_update(b)：添加对称差集

	t.update([1,2,3])	//添加多项
	t.remove('x')

####（5）集合展开式
类似列表展开式

###8. 表示程序结构的内置类型
####（1）可调用类型
可当作函数调用的对象
* function:用户定义的函数，包括lamda
	* 属性：`__doc__,__name__,__dict__,__code__,__defaults__,__globals__,__closure__`
* builtin_function_or_method:内置函数和方法
	* 属性：`__doc__,__name__,__self__`
* method:方法
	* 方法包括实例方法、类方法、静态方法
```python
def Foo:
	def instance_method(self,args):pass
	@classmethod
	def class_method(cls,arg):pass
	@staticmethod
	def static_method(arg):pass
```

	* 属性（attribute）查找和方法调用的分离
		* 属性查找：obj.attrName
		* 方法调用：obj.methodName(arg)
	* 绑定方法：可调用对象，封装了方法和实例
```
f=Foo()
meth=f.instance_method
meth() //调用
```
	* 非绑定方法：可调用对象，封装了方法函数
```
meth=Foo.instance_method
meth(f) //调用
```
	* 属性：`__doc__,__name__,__class__,__func__,__self__`
* type：内置类型和类的类型。即类
	* 类对象用于创建实例
	* 属性：`__doc__,__name__,__bases__,__dict__,__module__,__abstractmethods__`
* object：所有类型和类的祖先。即对象/实例
	* 如果定义了`__call__`方法，obj(args)等价于`obj.__call__(args)`
	* 实例的类型是对应的class
	* 属性：`__class__,__dict__`
	
####（2）模块类型
* module：保存import语句加载对象的容器
	* 属性：`__dict__,__doc__,__name__,__file__,__path__`
	
###9. 解释器内部使用的内置类型
代码对象、帧对象、跟踪对象、生成器对象、切片对象、Ellipsis对象、

##三、对象
* 一切都是（第一类）对象，包括模块、值、类型、函数、方法等等。
* 类也是对象。使用class关键字时解释器会创建对象，类的元类是type
* 类对象可以动态创建：`type(类名, 父类元组，包含属性的字典)`
###1. 对象身份
	id(objName) //返回对象ID（身份）,整数对象
	obja is objb //返回布尔值，是否是同一个对象
###2. 对象引用
理解为所有对象都在栈中，变量保存的是引用。
	
	sys.getrefcount(obj)//获得对象的引用计数
* 赋值：指向同一个对象	
* 浅复制：只进行一层复制——`b= list(a)`,创建新列表b，但是列表元素仍共享
	* 所有单独名字的copy都是浅复制
* 深复制：递归复制——`b=copy.deepcopy(a)`,a b完全无关了

###3. 对象行为与类的特殊方法
* 是方法而不是函数！
* 特殊方法以`__methodname__`命名，通常由解释器触发调用，不需要显式调用
* 用户可以通过定义特殊方法，创建行为类似于内置类型的类。（类似运算符重载）

####（1）对象创建与销毁
* `__new__(cls,[,*args[,**kwargs]])`：创建实例，一般用于元类
* `__init__(self,[,*args[,**kwargs]])`:构造函数
* `__del__(self)`：析构函数。del只是减少引用，本函数在对象销毁时调用

####（2）对象字符串表示
* `__format__(self,format_spec)`：创建格式化后的表示
	* 被format()函数或字符串format方法调用
* `__repr__(self)`:返回表达式字符串，eval(repr(object)) == object【给解释器看的】
	* 如果无法创建，一般返回一个<...message...>形式的字符串
	* 被repr()函数调用
* `__str__(self)`:创建简单的字符串表示，toString()【给人看的】
	* 如果未定义则调用`__repr__`
	* 被str()函数和打印相关函数调用

####（3）对象比较与排序
* `__bool__(self)`:真值判断的返回值。如果未定义则调用`__len__`
* `__hash__(self)`:用作字典中键时的hash值
	* 相等的对象返回值相同
	* 可变对象不应该定义该方法
* `__lt/le/gt/ge/eq/ne__(self,other)`：比较运算时调用，可返回任意类型的值
	* 按需定义。

####（4）类型检查
* `__instancecheck__(cls,object)`:isinstance(obj,cls)
* `__subclasscheck__(cls,sub)`：issubclass(sub.cls)

####（5）属性访问(可用作get/set/del拦截，参见property)
* `__getattribute__(self,name)`:self.name，未定义则使用`__getattr__`
* `__getattr__(self,name)`:self.name,未找到AttributeError
* `__setatr__(self,name,value)`:self.name=value
* `__delattr__(self,name)`:del self.name

####（6）属性包装和描述符
描述符对象的特殊方法：
* `__get__(self,instance,cls)`：get方法，未找到AttributeError
* `__set__(self,instance,value)`：set方法
* `__delete__(self,instance)`：删除属性

####（7）序列与映射方法
模拟序列和映射对象的行为时。切片操作也通过本类方法，传递slice对象进行
* `__len__(self)__`:返回长度
* `__getitem__(self,key)`:self[key]
* `__setitem__(self,key,value)`:self[key]赋值
* `__delitem__(self,key)`:del self[key]
* `__contains__(self,obj)`:self是否包含obj

####（8）迭代
* `__iter__()`:返回一个迭代器对象，用于可迭代对象

####（9）数学操作
所有数学运算符都有对应函数，这里不列举。可以进行运算符重载

####（10）可调用接口
* `__call__(self,[,*args[,**kwargs]])`:模拟函数行为，`self([*args[,**kwargs]])`

####（11）上下文管理协议
用于with语句，在上下文管理器对象控制下执行语句:
```
with context [as var]:
	statements
```
* `__enter__(self)`:进入新的上下文时调用，返回值存在var中
* `__exit__(self,type,value,tb)`:离开上下文时调用，后三个参数是异常（若有）的类型、值和跟踪信息
	* 返回布尔值，False表示异常未处理，会抛出

####（12）对象检查
* `__dir__(self)`:检查对象，由dir()调用，用于隐藏对象细节。
	* 细节仍可通过`__dict__看到`

####（13）对象表示
* `__dict__`:对象命名空间，即attribute字典
* `__class__`:对象的类
* `__slots__`:允许使用的属性名元组