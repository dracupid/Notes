#CSS(Cascading Style Sheets)
-------------------------------
CSS 3 is not included by now.

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
- 一般来说与元素外观相关样式（文字、颜色、字体）会被继承，与元素布局相关的样式（盒模型边框和尺寸）不会继承。
- 可以使用inherit强制继承

###1.3 包含
`@import url(XX)`, 必须用在最前。
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
.className1 .className2 {text-align: center} // 同时有两个类，低版本IE有兼容问题)
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
    -  inline: 共享一行， `<a> <strong> <em> <img>`

##6. Specification
选择器的优先级，说的越具体越优先
- User-Agent（浏览器）样式 < 用户样式 < 外部样式表 < 内部样式表(document/embedded style sheet) < 内联样式（在 HTML 元素内部） 
- 内联样式 > ID > 类/属性/伪类 > 元素/伪元素 , 同级则层级深的优先
- 重要声明优先于普通声明
```css
h1 {color: #333 !important ;}
```
- 都相同则后定义的优先, 与class属性的前后无关

##7. Value and Unit
###7.1 Length
- em: 1em = font-size
- px：定义是相对，但都实现为绝对单位

###7.2 Color
- name: red 
- RGB: rgb(100%,0%,100%)  rgb(0,100,100)
- grba, hsl, hsla： a是不透明度(0-1)，0是全透明
- hex: #ff0000  #f00
- 前景色 & 背景色
    + 前景色：文字和边框颜色，使用color或border-color等属性设置
    + 背景色

###7.3 URL
- url(path)，相对于css而不是html文件

###7.4 keyword
none, inherit, ...

###7.5 others
deg, gead, rad, ms, s, Hz, MHz

##8. Property Tips
- font：使用一种通用字体作为最后选择（sans-serif）
- baseline：小写x底端线。
- text-decoration：不会被后代继承
- 使用简写属性时，未设置的值会被重置为默认值。
- 简化属性按顺时针方向设置值
- background-position：
    + length：从元素的（X，Y）开始显示背景图。负值可以理解成从背景图的（-X,-Y）位置开始在元素中显示，可实现切图
    + percent：元素的（X%,Y%）点与背景图的（X%,Y%）点对齐
- 非替换行内元素和表元素不能使用min/max-width/height

##9. 盒模型
- margin-border(>0,non-%)-padding(>0,透明)-content(>0,仅块级和替换元素)。
- 后三者背景相同，margin通常透明
- margin/border/padding默认为0，width/height默认auto
- **width and height指的是content.**
- 负margin会使元素偏出父元素，但不会影响其他元素的布局。
- 只有margin、weight/height可设为auto，border和padding不会自适应。
- 若margin/padding使用百分比，则四个方向都是相对于父元素的width
- 边距的值复制：T->R->L  T->B,右值不存在时用左值代替。
- 要使用border记得设置border-style，其默认为none

###9.1 block-level
- 元素7项水平属性之和必须等于父元素width，允许其中margin属性为负。
    + 重置margin-right：当水平方向上的margin、width都被限定，七个元素之和不足父元素width（overconstrained），强制margin-right为auto；如果超过，强制margin-right为负数。【优先保证左】
    + 若width为auto，则由元素的padding、margin、border和父元素width关系计算动态得出
    + 若margin-left和margin-right为auto，则元素居中。
    + 若margin和width都为auto，margin为0

- 元素7项垂直属性之和小于若大于父元素height，会影响同级元素的显示，对叔伯元素无影响。
    + 若height为auto，则height由子元素或文字动态决定，不受本身padding、margin、border和父元素height变化影响。
    + 若margin-top和margin-bottom为auto，则他们为0。
    + 垂直相邻margin会被合并，两正取最大值，两负取最小值，正负取和。
    + 若元素height为auto，且未指定padding或border，子元素最外侧的margin-top和margin-bottom会逾越父元素，可视为附加到父元素，并与叔伯们进行margin的合并;若指定了padding或border，会撑起父元素。
    + 若父元素height为auto，则子元素margin为负时父元素height相应减少，减少到0后margin-bottom无法继续减少，margin-top不受影响。
    + 若父元素height为定值，则子元素margin为负时父元素height不变，margin-bottom无效，margin-top不受影响。
    + 如果元素内容高度大于height，由overfolw决定行为.
 
- 对于替换元素，若width/height为auto，则width和height为元素固有宽度。若width或height只指定一个的具体长度，另一个会成比例变化。

- 水平方向有独占性而竖直方向没有导致二者的差异

###9.2 inline-level
- Aonymous text：不包含在in-line元素中的字符串
- 非替换元素：行内框（line-height） = 行间距（leading，上下各半，可为负） + 内容区（同block-level的content，font-size）
    - em框：每个字符的占有面积，由font-size确定，内容区的组成单位。与实际字形大小有差异，或大或小。
    - 非替换元素的margin、border、padding不影响行内框高度
    - 同一行内，文本按baseline对齐，相同line-height下，不同字号的行内框会有位移，行框增大。
    - 增加padding不会影响line-height；margin-top、margin-bottom无效
- 替换元素：行内框 = 内容区(content+padding+border+margin)
    + padding-bottom与baseline对齐
- 行框：包含一行中所有行内框的最小框。

##10. display——change the way it displays, not the real type
- block：略
- inline：略
- inline-block：类似行内替换元素
- run-in：使块级元素成为下一个块级元素的行内部分
- none：元素从文档中移除。（visiability:hidden不会从文档中移除）

##11. float
- 浮动元素会从正常的文档流中删除，并变成块级元素。但仍会影响布局
- 浮动元素的margin不会被合并
- 浮动非替换元素无比声明width
- 浮动元素外边界不能超出父元素的content；浮动元素不能相互覆盖；只在元素所在行浮动。
- 通过将浮动元素的父元素设置为浮动，可以使父元素包裹浮动元素
- clear：规定元素的某侧不允许出现float元素。元素会向下移动。

##12. position
- static：元素呆在文档流中他该呆的位置。不能改变位移
- relative：在原位置基础偏移，但原空间仍保留
- absolute：离开文档流，相对于最近的不是static的祖先元素content定位，成为块级元素。
    - 若位置设为auto，则按照static时的位置。过度受限时优先保证左/上。
    - 水平和竖直方向的规则均与static块系元素的水平方向类似
- fixed：离开文档流，以窗口定位

##13. Generated Content
- 配合:before, :after使用content属性
- content的值会原样显示，包括HTML标签。使用`\A`换行，使用`\`连接多行字符串
- 使用attr()引用元素属性
```css
a[href]:after {content: "[" attr(href) "]";}
```
- 使用counter()和counters()引用计数器的值

#Learning Resource
1. *CSS:The Definitive Guide*, 3th edition. Eric A. Meyer  (no CSS 3)
2. MDN: <https://developer.mozilla.org/en-US/docs/Web/CSS>
3. W3C: <http://www.w3.org/Style/CSS/>
4. W3SCHOOL: <http://www.w3school.com.cn/cssref/index.asp>