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
```javascript
console.log(a);
var a = 10;
var fun = function(){}
function fun1(){}
```
Is the same as
```javascript
var a, fun;
function fun1(){}
console.log(a);
a = 10;
fun = function(){}
```

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

> Boolean, Number, String类型的变量可以使用一些属性和方法（js引擎自动打包为对象）
> 在表现形式上，Array, RegExp和primitive type是一致的，都有一个字面量，可以当作对象使用

###1.3 Reference Type（引用类型）
引用类型的值是地址
- Array
- Function
- Object

###1.4 Type Conversion（类型转换）
* 自动类型转换
    - 不同类型的数据进行互相运算；
    - 对非布尔值类型的数据求布尔值;
    - 对非数值类型的数据使用一元运算符
* 使用TypeName()格式通过创建对象的方式强制类型转换
    - Number()
        + String：不能完整转换则NaN，自动trim
        + Boolean：0/1
        + Undfined：NaN
        + Null: 0
        + Object：
            * 先调用对象的valueOf方法，若返回原始类型则使用Number
            * 否则调用toString，若返回原始类型则使用Number
            * 否则报错
    - String()
        + Object:
            * 有Number类似，不过先toString后valueOf

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
- Conver any to Number
    + `+any`
    + `-(-any)`
    + `+{} --> NaN` `+[] --> 0`

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
- Assignment: `=` and `+= -= *= /= %= >>= <<= >>>= &+ |+ ^=`
- relational: `== != === !=== >= > <= <`
    - `==`: Auto type convertion
    - `===`： No type convertion
    - 两个对象比较的是引用（地址），两种等于无差别
    - string is comparable.
- Logic: `&& || !`  
    - ！返回boolean，可以用!!将值转化为boolean类型
    * a && b：
        - if a is true, reutrn b
        - if a is false, return a
    * a || b:
        - if a is true, return a
        - if a is false, return b
- Bit: `| & ~ ^ << >> >>>`
    + 进行位运算时，会被转化为32位整数
- Ternary: `?:`

Else
- 圆括号:如果把表达式放在圆括号之中，作用是求值；如果跟在函数的后面，作用是调用函数。
- `void`: 执行一个表达式，然后返回undefined。
- `,`：对两个表达式求值，并返回后一个表达式的值
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

###2.6 Else (其他)
- eval: Execute a string as statement.
    + 没有独立的作用域
    + 不推荐使用
```javascript
eval('var a = 10;')
```

##5. Function（函数）
- First Class
- Actually, function is a `Function` object.

###5.1 Define
```javascript
    function funName(args){}    // Normal definition
    funName = function(args){}  // Anonymous function and Assignment
    funName = function funName(args){}  // Named function and Assignment, easy to debug and recursive
    var funName = new Function("args","funBody") //可以动态生成程序
```
- Definition can be nested.
- 不要在非函数的代码块（如，分支、循环）中声明函数（第一种）

###5.2 Argument
- Actual arguments can be less or more than definition
- Default value: undefined
- Function.length is the number of defined arguments, not real arguments.
- 值/地址传递
- `arguments` object
    + 包含所有参数的类数组对象
    + arguments.callee：对应的函数

###5.3 Return（返回值）
- `return` a value
- `rerurn` without a value or no `return`——`undefined`

###5.4 Override
- No

###5.5 closure
closure = function + scope

###5.6 Immediately-Invoked Function Expression
```javascript
(function(){ /* code */ }()); 
(function(){ /* code */ })();
```






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
    - 但可以通过给构造函数（对象）添加成员方法（而不是对原型添加）实现类似效果
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

###4.10 Attributes
对象的每个属性都有一个对应的attributes对象，保存该属性的一些元信息。
- 元信息
    - value：属性的值[undefined]。
    - writable：属性的值是否可以改变[true]。
    - enumerable：属性是否可枚举[true]
    - configurable：属性能否删除，attributes对象可否改变[true]。
    - get：属性的getter[undefined]。
    - set：属性的setter[undefined]
- 读取：Object.getOwnPropertyDescriptor()
- 设置：Object.defineProperty()，Object.defineProperties()
    + 未设置项为false或undefined，而不是默认值
- getter/setter
```javascript
var o = {
    name: 'Joe',
    get age() {},
    set age(value) {}
}
```
```javascript
var user = {name:'Joe'}
Object.defineProperty(user, 'age', {
    get: function() {}, 
    set: function(value) {}
});
```
```javascript
var o = Object.create(Object.prototype, {
    foo: { 
        get: function () {},
        set: function (value) {);
    }
}});
```

###4.11 控制对象状态
- Object.preventExtensions：对象无法添加新属性
- Object.seal：对象无法添加新属性，属性configurable为false
- Object.freeze：对象不可变

###4.12 内置对象（类）

####Object
+ 继承树的根
+ 作为构造函数使用时，可以接受一个参数。
    + 如果该参数是一个对象，则直接返回这个对象；
    + 如果是一个原始类型的值，则返回该值对应的包装对象。

> a = new Object() 等价于 a = {}

- 重要属性：
    * constructor：对构造函数的引用。
    * Prototype：对对象原型的引用。

#### Array
动态增长，0-index。
本质是属性名为index的一个对象。
- Create/Instantiation
```javascript
var arrName = new Array();
var arrName = new Array(size);
var arrName = new Array(d1,d2,d3...);
var arrName = [d1,d2,d3...];
```
- Access
    - Items can have different types.
    - Dynamic growth.
```javascript
arrayName[5]=78;    //创建空间（首次访问）并赋值
arrayName.length    //数组长度
```

> .length可写，进行拓展或截断（不可复原）数组

- 数组转换成字符串
```javascript
a.toString() 等价于 a.ValueOf()    //,分隔
a.join("分隔符")   //数组元素按指定分隔符分隔输出
```
-  Array-like Objects
有数字键和length属性
arguments对象，以及大多数DOM元素集，还有字符串。

#### 包装类
- Boolean——尽量别用
- Number
- String

#### Math(对象)
#### Date
#### RegExp
- 参照Perl 5
- Create/Instantiation
```javascript
var var regex = /xyz/g;
var regex = new RegExp("xyz", 'g');
```

- 正则表达式
    - 字面量字符（literal characters）
    - 元字符（metacharacters）
        + `.`: 除`\r` `\n` 行分隔符(\u2028)和段分隔符(\u2029)外的所有字符。
        + `^`: 字符串的起首。
        + `$`: 字符串的行尾。
        + `|`: 或
    - 字符类 `[]`: 匹配类中某个字符即可
        + `^`: 如果第一个字符是`^`(仅在[]中第一个字符有效), 则表示除了字符类之中的字符，其他字符都可以匹配。`[^abc]`
        + `-`: 字符范围(仅在[]内，且头尾各有一个字符时有效)。`[a-zA-Z]`
    - 重复类 `{}`: 模式的重复次数
        + `{n}`: 重复n次
        + `{n,}`: 重复>=n次
        + `{n,m}`: 重复n <= x <=m 次。
    - 量词符：
        + `?`: {0, 1}
        + `*`: {0,}
        + `+`: {1,}
        - 默认为贪婪匹配，如/a*/对于'aaa'匹配为'aaa'
        - 若要非贪婪模式，可在量词符后面加`?`，/a+?/只匹配`a`
    - 转义
        + `^ . [ $ ( ) | * + ? { \`需要用`\`转义
        + 使用RegExp方法生成正则对象，转义需要使用`\\`。
    - 修饰符
        + `g`: RegExp方法中，`g`记录上次的位置，String方法中，`g`代表全局匹配
        + `i`: 忽略大小写
        + `m`: 忽略换行符
    - 预定义模式（大写形式为小写形式的反）
        + `\d`: [0-9]
        + `\w`: [A-Za-z0-9_]
        + `\s` 匹配空格（包括制表符、空格符、断行符等），[\t\r\n\v\f]。
        + `\b` 匹配词的边界。
    - 组匹配：正则表达式的`()`表示分组匹配，括号中的模式可以用来捕获分组的内容
        + 在正则表达式内部，可以用`\n`引用括号匹配的内容，n是从1开始的自然数
        + 非捕获组 `(?:x)`: 表示匹配的结果中不计入这个括号。
        + 先行断言 `x(?=y)`: x只有在y前面才匹配，y不会被计入返回结果。
        + 后行断言 `x(?!y)`: x只有不在y前面才匹配，y不会被计入返回结果。
- 常用方法
    - RegExp.prototype.test()：字符串是否匹配RE
        + 如果`g`，会记录搜索位置，则每一次都从RegExp.prototype.lastIndex位置开始匹配
    - RegExp.prototype.exec()：返回匹配结果数组。
        + 匹配失败返回Null
        + 结果第一个元素为匹配出的字符串，后面的元素是圆括号对应的组
        + 结果数组包括两个额外属性：input(整个原字符串),index(整个模式匹配成功的开始位置)
        + 如果`g`，则可以多次exec，下一次从RegExp.prototype.lastIndex开始匹配。
    - String.prototype.match()：对字符串进行正则匹配，返回匹配结果
        + 类似exec()
        + 如果`g`，则返回所有匹配成功的结果
    - String.prototype.search()：第一个匹配结果在字符串中的位置。忽略`g`。
    - String.prototype.replace(search, [String|Function]replacement)
        + replacement中特殊含义的字符串
            + $& --> 匹配的子字符串。
            + $` --> 匹配结果前面的文本。
            + $' --> 匹配结果后面的文本。
            + $n --> 匹配成功的第n组内容，n从1开始计数。
            + $$ --> 美元符号$。
        - replacement可以是函数，参数为：
            - 1：匹配到的内容
            - 2~N-2: 组匹配 $1-$n
            - N-1：匹配到的内容在整个字符串中的位置
            - N：字符串
        - `g`表示全局替换
    - String.prototype.split(separator, [limit])
        + 如果正则表达式带有括号，则括号匹配的部分也会作为数组成员返回。

#### JSON
#### ArrayBuffer
一段可以存放数据的连续内存区域
- 创建
```javascript
var buffer = new ArrayBuffer(byteSize)
```

> 通过检测byteLength属性判断是否分配成功

除了slice方法，ArrayBuffer对象不提供任何直接读写内存的方法，只允许在其上方建立视图，然后通过视图读写。
- 视图/Typed Array
ArrayBuffer作为内存区域，可以存放多种类型的数据。通常用作本机内通信
    - Int8Array,Uint8Array,Int16Array,Uint16Array,Int32Array,Uint32Array,Float32Array,Float64Array,
    - 构造函数的参数为
        - 从ArrayBuffer生成：底层ArrayBuffer对象, 开始的字节序号 = 0, 包含的数据个数 = end。
        - 直接生成：length
        - 通过普通数组: array
    - 完全适用普通数组的操作
- DataView
    + 处理网络传来的数据，支持设定大小端
```javascript
var dataView = DataView(ArrayBuffer buffer [, 字节起始位置 [, 长度]]);

```
###6. Exception
- pattern: try-throw-catch-finally
```javascript
try{
    throw "error message"
}catch(e){
    console.log(e.message)
}finally{}
```

> try中return语句的执行是在finanlly代码之前，只是等finnally代码执行完毕后才返回。如果finally中也有return，会覆盖。

6.1 Error类型
- 基本属性：name，message，stack
- 派生错误类型：SyntaxError，ReferenceError，RangeError，TypeError，URIError，EvalError

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







