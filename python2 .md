#python advanced
------------------------

##2. 魔法/特殊方法
由python在特殊情况下调用，不需要显式调用。以__name__命名
###（1）构造方法——__init__(self[,arg...])
####调用父类构造方法
* Superclass.__init__(self[,arg...])  //叫做未绑定方法，与直接使用对象访问的绑定方法对应
* super(当前类名，self).__init__()	  //可以用这种方式调用父类各种方法。绑定方法。
> 3.0中super不需要参数
###（2）序列和映射规则
可根据需要选择

* \__len__(self)
* \__getitem__(self,key)：用于[]
* \__setitem__(self,key,value)
* \__delitem__(self,ley)：用于del
> 可以继承内建类型。
##3. 迭代器
* 迭代器：实现了next方法的对象（3.0中为__next__方法）
* 可迭代的对象：实现了__iter__方法
* \__iter__(self)：返回该可迭代对象的迭代器。
* next(self)：返回可迭代对象的下一个值。无返回时引发StopIteration异常
* iter(可迭代对象)：返回迭代器
> 可迭代对象通常用于for循环进行迭代。<br/>
> 有限长度（通过StioIteration异常停止next）的可迭代对象可以用list()转换成列表。


##7. JSON



pprint.pprint()：更智能的print
#常用模块
* sys：与解释器相关
	* 命令行参数：sys.argv
* os：与操作系统服务相关
* os.path：检查、构造、删除目录和文件的函数，处理路径
* webbrowser：浏览器相关
* fileinput：从文件输入
* set： 以前在sets模块，现在不需要导入，直接是内置类型set(可迭代对象)构建。方法和等价的运算符有：union|、issubset<=、issuperset>=、intersection&、difference-、symmetric_difference^、copy、add、remove：集合可变，其中元素不可变，因此不能使用集合的集合，可以用frozenset做元素。
* heapq：堆操作，基于列表（必须之前是空的）。
* collections.deque：双端队列，通过可迭代对象创建集合
* time：获取时间、解析时间str、格式化时间为str。日期可以用实数或9个数组的元组表示
* random：生成随机数，获得随机性
* shelve：简单的存储方案
* re：正则表达式