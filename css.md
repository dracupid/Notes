#CSS(Cascading Style Sheets)基础
-------------------------------

一般而言，所有的样式会根据下面的规则层叠于一个新的虚拟样式表中  
**优先级从低到高：**

- 浏览器缺省设置
- 外部样式表
- 内部样式表（位于 <head> 标签内部）
- 内联样式（在 HTML 元素内部）  

包含空格不会影响CSS作效果; CSS 对大小写不敏感。不过与 HTML 文档一起工作的话，class 和 id 名称对大小写是敏感的。  
不要在属性值与单位之间留有空格
##1. 语法
###（1）选择器语法
selector(选择器)通常是您需要改变样式的 HTML 元素。

	selector {declaration1; declaration2; ... declarationN }

每条declaration由一个属性和一个值组成。   

	selector {property: value;}
> 如果值为若干单词，则要给值加引号
  
被分组的选择器就可以分享相同的声明

	h1,h2,h3,h4,h5,h6 {color: green;}
例：

	h1 {color:red; font-size:14px;}	 
###（2）颜色表示###
* 单词：red
* 十六进制颜色值：#ff0000
* CSS缩写形式十六进制颜色值：#f00
* RGB： rgb(255,0,0)或rgb(100%,0%,0%)
> 使用 RGB 百分比时，即使当值为 0 时也要写百分比符号
###（3）继承
HTML子元素将继承最高级元素所拥有的属性，可以覆写。
##2. 派生选择器
根据HTML文档的上下文关系来确定某个标签的样式

	li strong {font-style: italic;font-weight: normal; }  
- 只对`<li><strong>这里</strong></li>`有效  
- 派生选择器中的某个选择器可以是id/类选择器，由于js需要唯一的引用
##3. id选择器
为标有特定 id 的 HTML 元素指定特定的样式。以#定义

	#red {color:red;}
	#green {color:green;}

	<p id="red">这个段落是红色。</p>
	<p id="green">这个段落是绿色。</p>
>相同id在每个HTML文档中只能出现一次。
##4. 类选择器
选择器以一个点号显示

	.center {text-align: center}

	<h1 class="center">This heading will be center-aligned</h1>
元素可以基于它们的类而被选择：

	td.fancy {color: #f60;background: #666;	}

	<td class="fancy">
##5. 属性选择器
为拥有指定属性的 HTML 元素设置样式

- [attribute]			带有指定属性的元素。
- [attribute=value]		指定属性为指定值的元素。
- [attribute~=value]		属性值中包含指定词汇的元素。
- [attribute|=value]		带有以指定值开头的属性值的元素，该值必须是整个单词。
- [attribute^=value]		属性值以指定值开头的每个元素。
- [attribute$=value]		属性值以指定值结尾的每个元素。
- [attribute*=value]		属性值中包含指定值的每个元素。
###结合选择器
	input[type="text"]{ width:150px;}
##6. 创建CSS
###（1）外部样式表
	<head><link rel="stylesheet" type="text/css" href="mystyle.css" /></head>
###（2）内部样式表
	<head><style type="text/css"> hr {color: sienna;}</style></head>
###（3）内联样式
	<p style="color: sienna; margin-left: 20px">Thi</p>