* html大小写不敏感，但最好用小写。
* 属性值应该始终被包括在引号内。双引号最常用，单引号也可。
* 注释：`<!-- This is a comment -->`
* 所有连续的空格或空行都会被算作一个空格。

####基于内容的样式（content-based style）和物理样式（physical style）。
* 基于内容的标签赋予含义，而不是格式化。 如abbr code dfm em等
* 应该避免使用物理标签。应当尽可能地向浏览器提供上下文信息，并使用基于内容的样式。如strike sub等

* 连接中，文件夹末尾最好加斜杠。`http://www.w3school.com.cn/html/`。不加斜杠会多产生一次http请求
* anchor可以使用id来定位

##全局属性
- accesskey；元素获得焦点的快捷键。windows下使用alt + accesskey
```html
<element accesskey= char >
```
- contenteditable[HTML5]：元素内容可编辑性
```html
<element contenteditable="true|false">
```
- 


## Concepts

- HTML entity：浏览器替代特殊字符的代码。
    + 理解为一种编码，类似UTF-8
    + 实体编号：&#XX；实体名称：&xx
- bool attribute：不需要设定值，只需要出现名称。其值是什么都无影响。