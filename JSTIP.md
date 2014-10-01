##匿名自执行函数（self-executing anonymous function）
	(function(){
    	alert(1);
	})();

- 括号内是一个匿名函数，后面跟一对括号以调用执行。可以传递参数
- 主要作用是进行封装，保持变量和函数的独立性。

##变量提升（variable hoisting）
- 在局部作用域中，使用var定义和使用局部变量，不会对同名全局变量产生影响
		
		a=2;
		function fun(){
		    var a=1;
		}
		console.log(a); //a=2
		fun();
		console.log(a); //a=2
- 无论var出现在局部变量的那一次使用中，都会被提升，其之前的使用都会被当作局部变量。

		a=2;
		function fun(){
			a=3;  //a是局部变量
		    var a=1;
		}
		console.log(a); //a=2
		fun();
		console.log(a); //a=2
- 在局部变量中，不使用var会访问全局变量。

		a=2;
		function fun(){
			a=1;
		}
		console.log(a); //a=2
		fun();
		console.log(a); //a=1
- 如果全局变量未定义，不会定义全局变量，而会报错。？？存疑
- 类似的提升行为还存在函数中。用function定义的函数可以在定义之前被使用。变量方式定义的不可以。

##this
- 函数中的this，指向函数名称被定义在的对象。
	- 全局代码中：指向window  `alert(this)//window`
	- 普通的函数调用中：指向window。严格模式下undefined
	- 作为对象的方法：指向所属对象。
	- 构造函数中：指向新创建的对象
	- 内部嵌套函数：总是指向window，而不与外部函数相同。设计失误
- 可以使用call或apply函数改变函数的this。而这的区别在于参数格式。

		var myFunction = function(arg1, arg2) {
		  console.log(this, arg1, arg2);
		};
		 
		var newObject = {};
		 
		myFunction.call(newObject, 'foo', 'bar'); //输出 newObject "foo" "bar" 
		myFunction.apply(newObject, ['foo', 'bar']); //输出 newObject "foo" "bar"

- 使用bind可以持久的更改函数this的值