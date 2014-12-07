#JavaScript#
------------------
* JavaScript = ECMAScript + BOM + DOM
* 基于对象，不支持自定义的对象
* Delimiter: `;(optional) {} ()`
* Comment: `// and /**/`

###书写js的位置
- `<script>`标签对中
- `<script>`的src或archive属性中引用外部js文件
- 某个html标记的事件处理器。如<body>的onLoad和onUnload

##1. Type System
- Dynamic Type
- Type Check:
    * Variable Type：`typeof x`
        * x can be an undefined variable.
        * `typeof null` is `object` (bug)
    * Object Class：`a instanceof b`
    * Object.prototype.toString
###1.1 Variable
- Define and Assign：Definition is Optional 
    - Initial Value: `undefined`
```javascript
var hello   // local variable
hello = ""  // global variable, actually this is an assignment.
```
- Declare: No.
- Delete
- Null Value: `null`
- Hoisting: yes
###1.2 Primitive Type
* Undefined：只有undefined一个值，是未初始化变量的类型。用typeof时也是未定义变量的值。使用void()可以将任何值控制为undefined，用于避免不必要的返回值。
* Null：只有null一个值。是对象的类型。
* Boolean：`true | false`（false: 0、-0、null、""、false、undefined、NaN）
* Number：一律为64为浮点数；精度整数15位，小数17位
    *  NaN：not a number
        *  **NaN不等于任何值，包括其本身（唯一不等于其本身的）！**
        *  NaN与任何值运算结果都是NaN
        *  使用`a ！== a`判断，isNaN()不可靠
    * Infinity：有正负之分
* String：Unicode，`'' or ""`；不可变。 
    * 可被视为字符数组读取，但不能用这种方式删改。 

> Boolean, Number, String类型的变量是伪对象（也有相应的真对象，可以看做包装器），可以使用一些属性和方法 [数字调用方法要加括号]
> 在表现形式上，Array, RegExp和primitive type是一致的，都有一个字面量，可以当作对象使用

###1.3 Reference Type（引用类型）
引用类型的值是地址
- Array
- Function
- Object

###1.4 Type Conversion（类型转换）
* 可以toString。
* 使用TypeName()格式通过创建对象的方式强制类型转换

- Convert Anything To String
    - `toString()`
- Convert Number To String
    - `toString([base = 10])` 
    - `toFixed(n)` 保留n位小数
    - `toExponential(n)` 指数表示法,保留n位小数
    - `toPrecision(n)` n位有效数字
- Convert String to Number
    - `parseInt(str， radix) parseFloat()`
        -  自动忽略数字后的非数字字符


###1.5 Memory Model（内存模型）
* 原始类型在栈，引用类型在堆



##2. Statement and Expression（语句和表达式）
###2.1 Scope（作用域）

###2.2 Operator（运算符）
Auto type conversion.

- Unary: `+ -`
- String: `+`
    - Can be used to convert String to Number
    - `Number + String` is always String because of the priority, whatever the order is.
- Arithmetic: ` + - * / %`
- Assignment: `=`
- relational: `== != === !=== >= > <= <`
    - `===`： No type convertion
    - 两个对象比较的是引用（地址），两种等于无差别
    - string is comparable.
- Logic: `&& || !`  
    - ！返回boolean，可以用!!将值转化为boolean类型
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
- Bit
- Ternary: `?:`
###2.3 Branch（分支）
```javascript
if(expression){
    statements
}else{
}
```
- For one statement, braces can be omitted.
```javascript
switch(expression){
    case expression :
    default:
}
```
- Use `===` to compare.
###2.4 Loop（循环）
```javascript
while(expression){}

for(initialize; test; increment){}

do{
}while(expression);
```
- For one statement, braces can be omitted.
- `break` and `continue`, with label.
###2.5 Context（上下文）
- With


##5. Function（函数）
- First Class
- Actually, functions are `Function` objects
###5.1 Define
```javascript
    function funName(args){}    // Normal definition
    funName = function(args){}  // Anonymous function and Assignment
    var funName = new Function("args","funBody") //可以动态生成程序
```
- Definition can be nested.
###5.2 Argument
- Actual arguments can be less or more than definition
- Default value is undefined
###5.3 Return（返回值）
- `return` a value
- `rerurn` without a value or no `return`——`undefined`
###5.4 Override
- No

##2. 函数（Function对象）
**函数实质也是一个功能完整的对象**

###agguments[]
在函数代码中，使用arguments数组，无需明确指出参数名，就能访问参数。
> js不对参数个数进行检验

###属性
length：定义的参数个数
###闭包
闭包，指的是词法表示包括不被计算的变量的函数，也就是说，函数可以使用函数之外定义的变量。


##4. Object（对象）
- Definition（定义）
复合数据类型或属性/方法集合，本质是key-value map
    - 如果key不是标准的变量命名，则必须加引号，否则引号可选。

```javascript
var obj = {
    key1: value1,
    'key2': value2
}
```
- Peculiarity（特点）
###4.1 Membership（成员）
- Term for different members
    - Property: All members
    - Method: Function members.
- Check
```javascript
"propertyName" in obj
```
- Static Member: No
    - 但可以通过给构造函数（对象）添加成员方法实现类似效果
- This/Self

###4.2 Class（类）
###4.3 Object Creation and Deletion（对象创建与删除）
- Create/Instantiation
```javascript
objName = new Object(args); // () is optional when there's no args
objName = {attrA:value, attrB:value...};//创建+赋值,对象字面量
```

###4.4 Object Access（对象访问）
- Read/Write
```javascript
objName.name
objName[name]   // name can be a expression which products a string
```
> Object can be used as a map or dictionary

- Create: Just write. 
- Delete
```javascript
delete objName.attrA； //只能删除自己定义的，非继承的属性
```
- Iteration
    - enumberable properties
```javascript
for(var key in obj){    // 'key' is not the value of a property. 
    console.log(obj[key])   
}
```

- Access Control
###4.5 Constructor（构造函数）
###4.6 Destructor and Garbage Collection（析构函数与垃圾回收）
###4.7 Inheritance（继承）
###4.8 Abstract Class and Interface（抽象类与接口）
###4.9 Polymorphic（多态）


##3. Object
* JavaScript 基于 prototype，而不是基于类的。



###类型
本地对象：ECMA-262 定义的类（引用类型）
内置对象：开发者不必明确实例化内置对象，它已被实例化了。只有 Global 和 Math（也是本地对象）
宿主对象：宿主环境提供的对象吗，如DOM何BOM对象
###私有
只有public对象，使用_name_命名来约定为私有变量
####构造函数（对象构造器）——无法共享函数
```javascript
function objName(args...){  
    this.attrA=value;   //引用对象的成员时，必须使用 this 关键字
    this.methodA=function(){};  
}
var x = new objName(a,b...)
```
- 没有return
- this指代调用该方法的对象
####原型方式——无法传递参数
```javascript
function Name(args...){                     
}
Name.prototype.attrA="";
Name.prototype.methodA=function(){};
var x=name();   //Name的原型的所有属性都被立即赋予要创建的对象
x.attrA="**";
```
* prototype是个默认new了的对象，可以用对象的赋值方法。
* 原型对象相当于类的成员，有默认值，但所有类共享，类似COW的静态成员。
* 只有对象进行赋值是prototype才会COW，如果是成员对象进行操作改变了对象的值，不会COW。如arrayName.push("");
####原型混合构造函数——主要使用，综合两种的优点
```javascript
function Name(args...){
    this.attrA="";              
}
Name.prototype.methodA=function(){};
var x=name();
```
* 成员变量使用构造函数，成员方法使用原型。
####动态原型方法——也可使用（看起来更紧密）
```javascript
function Car(sColor,iDoors,iMpg) {
  this.color = sColor;
  this.drivers = new Array("Mike","John");
  
  if (typeof Car._initialized == "undefined") {
    Car.prototype.showColor = function() {};
    Car._initialized = true;
  }
}
```
* 原型最大的作用是对非自定义对象进行修改。！

* 将对象内部想象成map，遍历的是key（属性名称）
###继承
* 只有自定义的类可以做基类。
* 很多间接实现的方法
####对象冒充（可实现多继承）
```javascript
function ClassB(sColor, sName) {
    this.newMethod = ClassA;
    this.newMethod(sColor);     //调用构造函数但不创建新变量
    delete this.newMethod;

    this.name = sName;
    this.sayName = function () {
        alert(this.name);
    };
}
```
* 前三行可以用一下函数替换
    * `ClassA.call(this, sColor);`      //每个参数都是call的参数
    * `ClassA.apply(this, new Array(sColor))`;//参数数组是call的参数，arguments[]
####原型链（不支持多继承）
```javascript
    ClassB.prototype = new ClassA();    //不能有参数
```
* 类型检测时可以同时具备父类型和子类型
####混合方式
```javascript
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
```


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
本质是属性名为index的一个对象。
###Create/Instantiation
```javascript
var arrName = new Array([size]);
var arrName = new Array(d1,d2,d3...);
var arrName = [d1,d2,d3...];
```
###Access
- Items can have different types.
- Dynamic growth.
```javascript
arrayName[5]=78;    //创建空间（首次访问）并赋值
arrayName.length    //数组长度
```
* 开始时有size，也可以增长。
* .length可写，进行拓展或截断（不可复原）数组
###数组转换成字符串
```javascript
a.toString() 等价于 a.ValueOf()    //,分隔
a.join("分隔符")   //数组元素按指定分隔符分隔输出
```
### Array-like Objects
有数字键和length属性
arguments对象，以及大多数DOM元素集，还有字符串。

###6. 语句
* 循环语句支持 `for x in xs`
* 可以使用标签标记语句块。
* break可以跳出循环和任何带标签的语句块。continue只能用于循环<br/>

例如：
```javascript
list:
{
    document.write(cars[0] + "<br>");
    break list;
    document.write(cars[3] + "<br>");
}
```
* with语句：设置语句块的默认对象（避免使用）<br/>

例如
```javascript
function validate_required(field,alerttxt)
{
    with (field)
    {
        if (value==null||value=="")
            {alert(alerttxt);return false}
        else {return true}
    }
}
```
###7. Exception
try-throw-catch-finally异常
```javascript
try{
    throw "error message"
}catch(e){
    console.log(e.message)
}finally{}
```
##8. window
window是浏览器的全局对象，所有的全局变量/函数都是window的成员。
使用window中对象时可以省略window.
    var a;
    a与window.a等价
###简单对话框
```javascript
alert("文本");
confirm("文本");          //选择是否
prompt("文本","默认值"); //输入框
```
###状态栏
```javascript
window.status
window.defaultStatus
```
###定时器
```javascript
setInterval("js代码",时间间隔ms) //每隔一段时间做
setTimeout("js代码",时间间隔ms)   //一段时间后做
clearTimeout(setTimeout_variable)     //取消setTimeout
```
###窗口控制
```javascript
window.open(页面URL,新窗口名字，"显示参数"); //返回新开窗口的window对象。根据新窗口名字查看是否已打开
window.close();
window.moveTo(x,y);
```
###窗口大小
```javascript
var w=window.innerWidth
    || document.documentElement.clientWidth
    || document.body.clientWidth;
```
##9. window.document
**window.document**，浏览器窗口中的html页面
###获取html元素
```javascript
getElementsByName("");  //在html标签中定义name属性
getElementsById("");    //名字不能重复，ID可以重复
```
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







