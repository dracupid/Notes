#JavaScript#
------------------
* JavaScript=ECMAScript+BOM+DOM
* 基于对象，不支持自定义的对象
* 分号可选
* 大小写敏感
* 基础语法上和java类似
###**书写js的位置**

- <script\>标签对中
- <script\>的src或archive属性中引用外部js文件
- 某个html标记的事件处理器。如<body>的onLoad和onUnload

##1. 变量和数据类型
	var hello;
> 重复声明不产生影响<br/>
> 声明不是必需的
###数据类型（动态）
* 引用类型：数组、对象
* 原始类型：Undefined、Null、Boolean、Number 和 String
* 查看变量类型：`typeof x`
* 查看对象类型：`a instanceof b`
> typeof 运算符对于 null 值会返回 "Object"。(bug,把null视为对象占位符，本质还是原始类型)<br/>

####原始类型
* Undefined类型：只有undefined一个值，是未初始化变量的类型。用typeof时也是未定义变量的值。使用void()可以将任何值控制为undefined，用于避免不必要的返回值。
* Null类型：只有null一个值。比较上等同于undefined。是对象的类型。
* Boolean类型：true/false（逻辑对象无初始值或者其值为 0、-0、null、""、false、undefined、NaN）
* Number类型：34 34.00 123e5；一律为64为浮点数；精度整数15位，小数17位
	*  NaN：not a number——isNaN() ；**NaN与自己不相等！**
* String类型：Unicode，单双引号等价；不可变。
####类型转换
* Boolean,Number,String类型的值是伪对象（也有相应的真对象，可以看做包装器），可以使用一些属性和方法，可以toString。
* parseInt() 和 parseFloat()讲字符串转换成数字。能转多少就转多少，不要求字符串全是数字。
* 使用Name()格式强制类型转换
###内存模型
* 原始类型在栈，引用类型在堆

##2. 函数（Function对象）
**函数实质也是一个功能完整的对象**

	function funName(args){}	等价于
	var funName = new Function("args","函数体") //可以动态生成程序
	funName = function(args){} //????
- 可以传递函数名作为参数
- 如果函数无明确的返回值，或调用了无参return，那么返回undefined。
- 支持函数嵌套
###agguments[]
在函数代码中，使用arguments数组，无需明确指出参数名，就能访问参数。
> js不对参数个数进行检验
###属性
length：定义的参数个数
###闭包
闭包，指的是词法表示包括不被计算的变量的函数，也就是说，函数可以使用函数之外定义的变量。

##3. 对象
* 复合数据类型或属性/方法集合
* JavaScript 基于 prototype，而不是基于类的。
* 没有static，但可以通过给构造函数（对象）添加成员方法实现类似效果。
###类型
本地对象：ECMA-262 定义的类（引用类型）
内置对象：开发者不必明确实例化内置对象，它已被实例化了。只有 Global 和 Math（也是本地对象）
宿主对象：宿主环境提供的对象吗，如DOM何BOM对象
###私有
只有public对象，使用_name_命名来约定为私有变量
###创建
	var objectName = new Object();	//无参数可省略括号
	var objectName = {attrA:value, attrB:value...};//创建+赋值
####构造函数（对象构造器）——无法共享函数
	function objName(args...){	
		this.attrA=value;	//引用对象的成员时，必须使用 this 关键字
		this.methodA=function(){};	
	}
	var x = new objName(a,b...)
- 没有return
- this指代调用该方法的对象
####原型方式——无法传递参数
	function Name(args...){						
	}
	Name.prototype.attrA="";
	Name.prototype.methodA=function(){};
	var x=name();	//Name的原型的所有属性都被立即赋予要创建的对象
	x.attrA="**";
* prototype是个默认new了的对象，可以用对象的赋值方法。
* 原型对象相当于类的成员，有默认值，但所有类共享，类似COW的静态成员。
* 只有对象进行赋值是prototype才会COW，如果是成员对象进行操作改变了对象的值，不会COW。如arrayName.push("");
####原型混合构造函数——主要使用，综合两种的优点
	function Name(args...){
		this.attrA="";				
	}
	Name.prototype.methodA=function(){};
	var x=name();	
* 成员变量使用构造函数，成员方法使用原型。
####动态原型方法——也可使用（看起来更紧密）
	function Car(sColor,iDoors,iMpg) {
	  this.color = sColor;
	  this.drivers = new Array("Mike","John");
	  
	  if (typeof Car._initialized == "undefined") {
	    Car.prototype.showColor = function() {};
	    Car._initialized = true;
	  }
	}
* 原型最大的作用是对非自定义对象进行修改。！
###赋值和访问
	objectName.attrName		//attrName固定
	objectName[attrName]	//attrName可计算
	objectName = {attrA:value, attrB:value};
- 类似于数组，构造时不存在的属性也可以创建赋值
###删除属性/方法
	delete objectName.attrA； //只能删除自己定义的
	objectName.attrA=null；	//二者不等价
###遍历属性
	for(var a in objectName){ 	//a是属性的名字
		alert(objectName[a])	//输出属性值
	}
* 将对象内部想象成map，遍历的是key（属性名称）
###继承
* 只有自定义的类可以做基类。
* 很多间接实现的方法
####对象冒充（可实现多继承）
	function ClassB(sColor, sName) {
	    this.newMethod = ClassA;
	    this.newMethod(sColor);  	//调用构造函数但不创建新变量
	    delete this.newMethod;
	
	    this.name = sName;
	    this.sayName = function () {
	        alert(this.name);
	    };
	}
* 前三行可以用一下函数替换
	* `ClassA.call(this, sColor);`		//每个参数都是call的参数
	* `ClassA.apply(this, new Array(sColor))`;//参数数组是call的参数，arguments[]
####原型链（不支持多继承）
	ClassB.prototype = new ClassA();	//不能有参数
* 类型检测时可以同时具备父类型和子类型
####混合方式
	function ClassA(sColor) {
	    this.color = sColor;
	}
	
	ClassA.prototype.sayColor = function () {
	    alert(this.color);
	};
	
	function ClassB(sColor, sName) {
	    ClassA.call(this, sColor);
	    this.name = sName;
	}
	
	ClassB.prototype = new ClassA();
	
	ClassB.prototype.sayName = function () {
	    alert(this.name);
	};



##4. JS常用对象（实质是'类'）
###Object：与Java中地位相同。
属性：

* constructor：对构造函数的引用（指针）。对于Object对象指向原始的 Object() 函数。
* Prototype：对对象原型的引用。对于所有的对象，它默认返回 Object 对象的一个实例。

方法：

* hasOwnProperty(property)：判断对象是否有某个特定的属性。必须用字符串指定该属性。
* isPrototypeOf(object)：判断该对象是否为另一个对象的原型。
* propertyIsEnumerable：判断给定的属性是否可以用 for...in 语句进行枚举。
* toString()：返回对象的原始字符串表示。
* valueOf()：返回最适合该对象的原始值。对于许多对象，与 toString() 的返回值相同。
###Boolean——尽量别用
###Number
*  Number.MAX_VALUE 和 Number.MIN_VALUE
*  Number.POSITIVE_INFINITY， Number.NEGATIVE_INFINITY——isFinite()
###String
###Date
* 自动使用当前的日期和时间作为其初始值
* Date对象可以进行比较

###Math
* 用来执行各种计算
* 没有构造函数，不能也无需创建。
###RegExp 
* 正则表达式
##5. 数组
动态增长，0-index。
理解成属性名为0-n的一个对象。
###创建
	var arrayName = new Array();
	var arrayName = new Array(size);
	var arrayName = new Array(d1,d2,d3...);
	var arrayName = [d1,d2,d3...];
###赋值
	arrayName[5]=78;	//创建空间（首次访问）并赋值
	arrayName.length	//数组长度
* 开始时有size，也可以增长。
* .length可写，进行拓展或截断（不可复原）数组
###数组转换成字符串
	a.toString() 等价于 a.ValueOf()	//,分隔
	a.join("分隔符")	//数组元素按指定分隔符分隔输出
###堆栈操作
	a.push("");
	a.pop();
###队列操作
	a.push("");
	a.shift();	
###排序
	a.sort();
	a.sort(compareFunction);
	a.reverse();
###其他
	b=a.concat(a1,a2...)   //连接a,a1,a2
	b=a.slice(m,n)		//截取从m到n-1
	splice(开始位置，删除个数，插入元素...) //删除并插入
###6. 语句
* 循环语句支持 `for x in xs`
* 可以使用标签标记语句块。
* break可以跳出循环和任何带标签的语句块。continue只能用于循环<br/>

例如：

	list:
	{
		document.write(cars[0] + "<br>");
		break list;
		document.write(cars[3] + "<br>");
	}
* with语句：设置语句块的默认对象（避免使用）<br/>

例如
	function validate_required(field,alerttxt)
	{
		with (field)
		{
			if (value==null||value=="")
				{alert(alerttxt);return false}
			else {return true}
		}
	}
###7. try-throw-catch异常
	try{
		throw "error message"
	}
	catch(err)//不需要想java一样声明类型
	{
		txt="There was an error on this page.\n\n" + err.message + "\n\n";
		alert(txt);
	}
##8. window
window是浏览器的全局对象，所有的全局变量/函数都是window的成员。
使用window中对象时可以省略window.
	var a;
	a与window.a等价
###简单对话框
	alert("文本");
	confirm("文本");			//选择是否
	prompt("文本","默认值");	//输入框
###状态栏
	window.status
	window.defaultStatus
###定时器
	setInterval("js代码",时间间隔ms) //每隔一段时间做
	setTimeout("js代码",时间间隔ms)	//一段时间后做
	clearTimeout(setTimeout_variable)     //取消setTimeout
###窗口控制
	window.open(页面URL,新窗口名字，"显示参数"); //返回新开窗口的window对象。根据新窗口名字查看是否已打开
	window.close();
	window.moveTo(x,y);
###窗口大小
	var w=window.innerWidth
		|| document.documentElement.clientWidth
		|| document.body.clientWidth;
##9. window.document
**window.document**，浏览器窗口中的html页面
###获取html元素
	getElementsByName("");	//在html标签中定义name属性
	getElementsById("");	//名字不能重复，ID可以重复
###image对象
- document中有image数组
- image.src属性表示图片源
- 可以创建Image()对象提前加载图片
- image.onLoad事件表示图片装载完成 
###write方法
**如果在HTML已完成加载后执行document.write，整个页面将被覆盖**
###document.cookie
格式为name1=value1;name2=value2...的字符串


##10. window.screen对象
window.screen 对象包含有关用户屏幕的信息。
##11. window.location对象
* 当前窗口的URL，可以改写
* 可以查看URL、域名、路径、端口、协议等
* 可以进行跳转
##12. window.history对象
* 浏览器的历史
* 可以后退、前进等。
##13. window.navigator对象
* 有关访问者浏览器的信息。








##运算符
* +/-string可以把字符串转化为数字
* 位运算和逻辑运算同java
* ！返回boolean，可以用!!将值转化为boolean类型
* &&不一定返回boolean：
	* obj && bool——obj；
	* obj1 && obj2——obj2；
	* 有null——null
	* 有NaN——NaN
	* 有undefined——error
* ||不一定返回boolean
	* false || false || obj——obj
	* obj1 || obj2——obj2
	* false || false || null——null
	* false || false || NaN——NaN
	* 有undefined——error
* 字符串可用关系运算比较。字符串与数字比较会把字符串转换成数字
* 如果把数字与字符串相加，结果将成为字符串<br/>
* `===`：全等于，无需类型转换运算数就相等，值和类型都相等。
* 可用三元条件运算