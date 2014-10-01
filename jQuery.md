#jQuery
------------------
* 使用方法：
	* `<script type="text/javascript" src="jquery.js"></script>`
	* src="http://code.jquery.com/jquery-1.11.0.min.js"

##1. 基础语法
	$(selector).action()

	$(document).ready(function(){

		-- jQuery functions go here ----

	});
###（1）选择器
* 元素选择器：
	* $("p") 选取\<p> 元素。
	* $("p.intro") 选取所有 class="intro" 的\<p>元素。
	* $("p#demo") 选取所有 id="demo" 的\<p>元素。
* 属性选择器： XPath 表达式 
	* $("[href]") 选取所有带有 href 属性的元素。
	* $("[href='#']") 选取所有带有 href 值等于 "#" 的元素。
	* $("[href!='#']") 选取所有带有 href 值不等于 "#" 的元素。
	* $("[href$='.jpg']") 选取所有 href 值以 ".jpg" 结尾的元素。
* CSS选择器：
	* $("p").css("background-color","red")//把所有 p 元素的背景颜色更改为红色：
###（2）事件
	$("button").click(function() {..some code... } )
###（3）名称冲突
* $是jQuery的简化形式，等价于jQuery。
* 其他库可能有$函数。
* 使用`var yourName=jQuery.noConflict()`将yourName定义为jQuery的简化
* `$.noConflict()`会释放$供其他使用;
##2. 效果
###callback
如果您希望在一个涉及动画的函数之后来执行语句，请使用 callback 参数
###Chaining
在一条语句中允许多个 jQuery 方法（在相同的元素上）。
##3. jQuery DOM
* text():设置或返回所选元素的文本内容（不含HTML）
* html()：设置或返回所选元素的内容（包括 HTML 标记）
* val()：设置或返回表单字段的值
* attr()：设置或返回属性值
* ...
##4. AJAX
* $(selector).load(URL,data,callback);
* $.get(URL,callback);
* $.post(URL,data,callback);