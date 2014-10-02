#CSS(Cascading Style Sheets)
-------------------------------
  
**优先级从低到高：**
- 浏览器缺省设置
- 外部样式表
- 内部样式表/documeny style sheet/embedded style sheet (`<script type = 'text/css'>`)
- 内联样式（在 HTML 元素内部）  

包含空格不会影响CSS效果; CSS 对大小写不敏感。不过与 HTML 文档一起工作的话，class 和 id 名称对大小写是敏感的。  
不要在属性值与单位之间留有空格
##1. Grammar
###1.1 Basic
```css
selector { declaration1; declaration2; ... declarationN }
```
declaration = property + value   
```css
selector { property: value;}
```
> IF: 值为若干单词，则要给值加引号<br/>
> ELSE: No comma and quote in value,except font-family.<br/>
> font 属性中可以用/分隔字体大小和行高 `font：large/150% Helvetica;` 
  
被分组的选择器就可以分享相同的声明
```css
h1,h2,h3,h4,h5,h6 { color: green;}
```

###1.2 继承
HTML子元素将继承祖先元素所拥有的属性，可以覆写。
> 部分属性无法基础，如盒模型边框和尺寸相关的属性。可用常识判断

###1.3 包含
`@import url(XX)`, 用在最前。
##1.4 创建CSS
###（1）外部样式表
```html
<head><link rel="stylesheet" type="text/css" href="mystyle.css" /></head>
```
###（2）内部样式表
```html
<head><style type="text/css"> hr {color: sienna;}</style></head>
```
> 考虑不支持style标签的老浏览器，应将标签内容用`<!-- -->`包裹

###（3）内联样式
```html
    <p style="color: sienna; margin-left: 20px">Thi</p>
```
##2. Selector
###2.1 HTML/XML tag name and *
###2.2 Class Selector
```css
.className {text-align: center}
.className1 .className2 {text-align: center} // 同时有两个类，顺低版本IE有兼容问题)
td.fancy {color: #f60;background: #666; } //元素可以基于类而被选择
```
```html
<h1 class="className">center-aligned</h1>
<td class="fancy">
```
###2.3 Id Selector
```css
#red {color:red;}
```
> 相同id在每个HTML文档中理应只出现一次。

###2.4 Attribute Selector (CSS2)
- [attr]           有指定属性
- [attr=value]     指定属性为指定值，完全字符串匹配
- [attr~=value]    属性值中包含指定值（作为单词）
- [attr|=value]    属性值以指定值开头（作为单词）
- [attr^=value]    属性值以指定值开头
- [attr$=value]    属性值以指定值结尾
- [attr*=value]    属性值中包含指定值
> 可同时使用多个

###结合选择器
```css
input[type="text"]{ width:150px;}
```
###2.5 Descendant/Contexual Selector
```css
li .strong {font-style: italic;font-weight: normal; }  
```
```html
<li><span class = 'strong'>here</span></li>
```
- 只选择子元素
```css
h1 > span {}
```
- 选择其后的兄弟元素
```css
h1 + p {}
```

##3. Pseudo-class & Pseudo-class Selector
静态；
a:link          具有href属性且未访问过
a:visited       已访问过
:first-child    作为第一个子元素地（而不是元素的第一个子元素）    
:lang(XX)       根据元素语言，功能类似|=属性选择器，建议使用伪类选择语言。

动态：
:focus          获得焦点
:hover          鼠标悬停
:active         被用户激活

> 常用于a或input<br/>
> 使用顺序为 link-visited-focus-hover-active<br/>
> 尽量不要使用伪类进行需要重绘文档的事情，比如调整大小<br/>
> 可以把不互斥的伪类结合使用。如`a:link:hover`

##4. Pseudo-element & Pseudo-element Selector
:first-letter   第一个字母
:first-line     第一行
:before         元素之前（结合content属性）
:after          元素之后（结合content属性）
> 伪元素只能作为选择器的最后一个出现

##5. Element
-  Replaced Element & Nonreplaced Element
    -  Replaced Element: `<img>(src) <input>(type)`
    -  Nonreplaced Element: directly display
-  block-level & inline-level
    -  block: 占领一行， `<p> <div>`
    -  inline: 共享一行， `<a> <strong> <em>`

##6. Specification
选择器的优先级，说的越具体越优先
- 内联样式 > ID > 类/属性/伪类 > 元素/伪元素 , 同级则层级深的优先
- 重要声明优先于普通声明
```css
h1 {color: #333 !important ;}
```
- 都相同则后定义的优先

##7. Value and Unit
###7.1 Length
- em: 1em = font-size
- px

###7.2 Color
- name: red 
- RGB: rgb(100%,0%,100%)  rgb(0,100,100)
- hex: #ff0000  #f00

###7.3 URL
- url(path)，相对于css而不是html文件

###7.4 keyword
none, inherit, ...

###7.5 others
deg, gead, rad, ms, s, Hz, MHz

##8. Font
- font：使用一种通用字体作为最后选择（sans-serif）