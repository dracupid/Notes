#R语言笔记
-------------------
函数式语言

**注释：#**  
**赋值：<-或=**  
**退出：q()**  
**TRUE FALSE缩写为T F**  
***mode(x)：查看①向量里的数据类型②数据结构***  
***typeof(x)：比mode更细***  
Modes have the same set of names as types (see typeof) except that  

- types "integer" and "double" are returned as "numeric".
- types "special" and "builtin" are returned as "function".
- type "symbol" is called mode "name".
- type "language" is returned as "(" or "call".
##数据结构
+ 向量
+ 字符串  
	**paste("","","")**：字符串连接  
	**strsplit(str,"分隔符")**：字符串切隔
+ 矩阵
+ 列表
+ 数据框
+ 类

##R操作
运行代码源文件  
	
	$R CMD BATCH fileName
	
	edit()				#启动文本编辑器
	options(editor="") 	#设置默认的文本编辑器

	getwd()		#查看当前工作目录
	setwd("")	#设置工作目录
帮助  

	help(seq)			#查看帮助，特殊字符和保留字用""括起来，函数名直接使用
	help(files)			#查看一般主题的帮助，其他主题参考书P20
	help.search("")		#搜索帮助
	help(package=MASS)	#查看包的帮助信息
	？seq		#help的简便形式
	？？""		#help.search的简便形式
	？Start		#查看启动时操作帮助文件
	？Syntax
查看示例
	
	example(seq)
执行文件中代码

	source("filePathName")


##一. 向量Vector
类似数组，单个数值（标量）是一元向量
###1. 创建
	x=c(x,y,z)	# xyz是必须是同一种mode的数据
	x=m:n		# 步长1，向量包含m和n，m以大于n，:优先级高于+-*/
	x=rep(x,times,each=1)	#创建重复向量,each是x中元素连续出现数列
	x=seq(from=1,to=1,by=1)	#生成等长数列，步长为by
	x=seq(n)				#from=1，to=n
- 若有可能x=NULL，则for(n in seq(x))，for(n in 1：length(x))会出错   
- 固定长度，修改时需要重新赋值
- 筛选 向量化
###2. 访问（索引运算）
向量1[向量2]	

	x[n]
+ 负数下标表示反选
+ 下标从1开始

###3. 添加和删除
	x<-c(11,12,13,14)
	x<-c(x[1],0,x[2:4])	#添加，重新赋值
- x本质是指针
###4. 声明
一般不需要，但是在引用向量中某个元素前要事先定义或声明向量

	y<-vector(length=n)
###5. 循环补齐
两个不等长向量运算，较短的会循环补齐
###6. 运算
逐项进行运算，求模是%%，平方是^

	a+b
	"+"(a,b)

	any(x>8)
	all(x>8)
相关函数
	cumsum：计算向量的累积和cumulative sums。
###7. 向量化运算符
对向量的每个元素使用函数/运算符等同于对向量使用函数/运算符
###8. 筛选

##二. 矩阵
特殊的按列储存的**向量**，适用于向量的操作，有行数和列数属性
###1. 创建
	rbind(a,b,c)	#按行将多个向量转换成矩阵，每个向量一行
	cbind(a,b,c)	#按列...
	matrix(a,ncol=？)	#向量数据按列排列
+ a,b,c是向量
###2. 访问
	x[1,2]	#提取某个元素
	x[1,]	#提取某行向量
	x[,2]	#提取某列向量
###3. 运算
矩阵乘法：%*%
##三. 列表
可以容纳不同类型值的向量，类似于struct
###2. 访问
	listName$attrName	#attrName可以用无歧义prefix
	str(listName)	#列表简化输出
+ str是structure缩写，用于显示任何R对象的内部结构，不仅列表
##四. 数据框
每个项都是等长向量的列表
	head	#查看前几行
###1. 创建
	data.frame(list(col1=c(),col2=c())
+ 通常通过读取文件和数据库创建
###2. 访问
+ 可以使用矩阵和列表的访问方式。

##五. 类（S3类）
对象都是**列表**，类的重要作用的泛型多态
class(x) 查看类名
attributes(x) 查看属性和类名
##文件I/O
###1.读取文件 
	read.table("fileName",header=F)	#默认文件不包含表头 

##六. 函数
###1. 定义
	name<-function(args){  }
+ return() 或 最后一条语句值作为返回  
+ 值传递，可以使用默认参数

##七. 空值
- **NA：Not Avaliable.**有NA值无法进行计算。  
	在统计函数中使用时可以用na.rm=T参数移除NA
- **NULL:空值**，不参与计算,可用于初始化（声明）  

如:

	mean(1,2,3,NA)=NA
	mean(1,2,3,NULL)=2
>NA可以看做一个数据，不能用于向量初始化，而NULL只是一个空位

-------------------



常用函数
mean 求平均值
abs 求绝对值
rnorm(n) 得到N(0,1)分布的n个随机变量
hist 直方图，返回列表
data 内置数据集列表
sqrt 求平方根
round 四舍五入

lm(y~x):一元线性拟合，y=α+βx，x和y是向量，计算α和β
lm(y~m+n+o):多元线性拟合
summary(x) 生成摘要【泛型】
plot(x) 画图【泛型】
length(x) 数据长度
注意
mod %%
0-1数据的均值是1的比例