* Document Object Model
* W3C DOM 标准被分为 3 个不同的部分：
	* 核心 DOM - 针对任何结构化文档的标准模型
	* XML DOM - 针对 XML 文档的标准模型
	* HTML DOM - 针对 HTML 文档的标准模型
	
-------------------------


* HTML DOM 定义了访问和操作 HTML 文档的标准方法。 
* DOM 定义了访问和操作 HTML 文档的标准方法。
* HTML 文档中的所有内容都是节点：
	* 整个文档是一个文档节点
	* 每个 HTML 元素是元素节点
	* HTML 元素内的文本是文本节点(元素节点的子节点)
	* 每个 HTML 属性是属性节点
	* 注释是注释节点

##方法
* getElementById()	返回带有指定 ID 的元素。
* getElementsByTagName()	返回包含带有指定标签名称的所有元素的节点列表（集合/节点数组）。
* getElementsByClassName()	返回包含带有指定类名的所有元素的节点列表。
* appendChild()	把新的子节点添加到指定节点。
* removeChild()	删除子节点。
* replaceChild()	替换子节点。
* insertBefore()	在指定的子节点前面插入新的子节点。
* createAttribute()	创建属性节点。
* createElement()	创建元素节点。
* createTextNode()	创建文本节点。
* getAttribute()	返回指定的属性值。
* setAttribute()	把指定属性设置或修改为指定的值。
##属性
* innerHTML：获取元素（子节点，实质是标签内的所有文本，包括内部的html标签）内容的最简单方法。
* nodeName（理解为子类型好些）：节点的名称【只读】。元素节点的与标签名相同；属性节点的与属性名相同；文本节点的始终是 #text；文档节点的始终是#document
* nodeValue：节点的值。元素节点的是 undefined 或 null；文本节点的是文本本身；属性节点的 是属性值
* nodeType ：节点类型。数字。
* parentNode、firstChild 以及 lastChild
* document.documentElement - 全部文档
* document.body - 文档的主体
* childNodes：子节点数组
* html标签的所有属性都可进行`标签对象.属性名`访问
* 样式可以进一步使用`标签对象.style.property=new style`访问和修改
##事件
标签事件中可以传递和使用this对象。
onclick=onmousedown+onmouseup、onload（可用于cookie）、onunload、onchange、onmouseover/onmouseout