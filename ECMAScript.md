#ECMAScript
-------------
**\#define 属性 property**<br/>
**\#define 特性 attribute**

##term tree
* type
	* primitive type——primitive value
		* Undefined——undefined（only）
		* Null——null（only）
		* Boolean——true/false
		* Number ——number value,NaN,infinity[64bit]
		* String [16bit]
	* Object--object
		* 通过内置constructor提供的类型
			* Boolean/Number/String object
		* Function object [都有prototype属性]
			* constructor [每个native对象都对应built-inconstructor]
		* Prototype object [constructor's prototype property]
		* ...

* Object
	* native Object: Semantics are fully defined by language specification
		* built-in object: supplied by an ECMAScript implementation, independent of the host environment [程序开始执行时就存在]
			* 直接使用的对象:global object,Math,JSON
			* constructor:
				* Object Function Array String Boolean Number Date RegExp;Error EvalError RangeError ReferenceError SyntaxError TypeError URIError.
		* object constructed during execution
	* Host Object: Supplied by the host environment to complete the execution environment of ECMAScript



##概述
- host environment（不仅是browser）提供一些完成特定功能的objects和facilities，脚本语言实现操作对象的方式。
- **ECMAScript object** ： a collection of ***properties*** each with zero or more ***attributes*** internal value that defines some characteristic of a property.Object has a single nullable prototype object(not property).
- **Property**：Containers that hold other objects, primitive values（Undefined, Null, Boolean, Number, and String）,or functions（callable object）.
	- **own property**: directly contained by its object
	- **inherited property**: property (either own or inherited) of the object's prototypes
<br/><br/>-------------------------------------
	- **named data property**：Associates a name with a value and a set of Boolean attributes
	- **named accessor property**：Associates a name with one or two accessor functions, and a set of Boolean attributes.
	- **internal property**：Has no name and is not directly accessible via operators. For specification purposes.
- **attribute**:

	| Attribute Name| Type           	| default 	| comment |
	| ------------- |---------------		|-------		| ------
	| Value      	| Any			 	| undefined | [data]
	| Writable      | Boolean  	  		| false	 	| [data] 使用Pet进行修改
	| Enumerable  	| Boolean   	 	| false 	| 使用for-in枚举 
	| Configurable 	| Boolean    	 	| false 	| 删除属性/修改特性/data和accessor的切换 
	| Get		  	| function/Undefined  | undefined | [accessor]
	| Set		 	| function/Undefined  | undefined | [accessor]


- **Method**：A function associated with an object via a property.The object is passed to the function as its *this* value.
- **built-in operator**: unary, multiplicative, additive, bitwise shift, relational, equality, binary bitwise, binary logical, assignment, comma.
- 无类型，函数不需要声明。
- 函数传递的参数个数不会被检查，但传递的每个参数都会被求值。
##Object
- 使用literal notation or constructors+new创建对象，而不使用class
- constructor：使用prototype属性（用来实现prototype-based inheritance和shared properties）的function.
- *prototype本质是通过链对作用域进行延伸，指向一个对象（的作用域）。prototype的所有内容（值）都是共享的。
	- constructor中的prototype是一个属性，是显性的，不延伸作用域。
	- object中没有prototype属性，prototype是隐形的（有的实现中是Object.__proto__），指向constructor的prototype，可以延伸object的作用域。可以使用Object.getPrototypeOf访问
- new的本质就是以下步骤:
			
		var o = {}; 
		o.__proto__ = Array.prototype;
		Array.call(o);   //var o = new Array()
- In a class-based object-oriented language, state is carried by instances, methods are carried by classes, and inheritance is only of structure and behaviour.
- In ECMAScript, the state and methods are carried by objects, and structure, behaviour, and state are all inherited.

##Strict Variant（Strict Mode）
- 特点
	- excludes some specific syntactic and semantic features
	- modifies the detailed semantics of some features
	- specifies additional error conditions that must be reported by throwing error exceptions
- 作用只局限在一个code unit

##内置对象
###全局对象
- Value Properties
	- NaN = NaN
	- Infinity = Infinity
	- undefined = undefined
- Function Properties
	- eval(x)
	- parseInt(string , radix)
	- parseFloat (string)
	- isNaN (number)
	- isFinite (number)
- URI Handling Function 
	- decodeURI (encodedURI)
	- decodeURIComponent (encodedURIComponent)
	- encodeURI (uri)
	- encodeURIComponent (uriComponent)
- Constructor Properties

- Other Properties
	- Math
	- JSON