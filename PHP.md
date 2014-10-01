#PHP
-------------------
* 脚本块以 <?php 开始，以 ?> 结束
* 语句后必须有；
* 注释同JAVA
* 输出：echo、print
* 函数调用暂时按照面向过程理解
##1. 基础语法
###（1）变量
* 以$开始表示变量，之后的命名法同java
* 不需要声明
###（2）字符串
* 字符串连接使用'.'
* strlen(str)：计算字符串的长度。
* strpos(str,subStr)：检索
###（3）语句
* 总体与java相似
* elseif写在一起
* 支持foreach 
```
	foreach ($arr as $value)
	{
  		echo "Value: " . $value . "<br />";
	}
```
###（4）数组
#### 数值数组：
* `$names = array("Peter","Quagmire","Joe");`
* 也可以直接`$names='value'`赋值使用
#### 关联数组（类似map）：
* `$ages = array("Peter"=>32, "Quagmire"=>30, "Joe"=>34);`
*  也可以直接`$ages['Peter'] = "32";`
#### 多维数组：
	$families = array
	(
	  "Griffin"=>array
	  (
	  "Peter",
	  "Lois",
	  "Megan"
	  ),
	  "Quagmire"=>array
	  (
	  "Glenn"
	  )
	);
####（5）函数
* 创建：`function funcName() ｛｝`
####（6）处理表单
* 从数组中获取值
* `$_GET["name"];` 获取get方法发来的表单
* `$_POST["name"];` 获取post方法发来的表单
* `$_REQUEST["name"]; `：包含了 $_GET, $_POST 以及 $_COOKIE 的内容
* `$_FILES["file"]["name"]` - 被上传文件的名称
* `$_FILES["file"]["type"]` - 被上传文件的类型
* `$_FILES["file"]["size"]` - 被上传文件的大小，以字节计
* `$_FILES["file"]["tmp_name"]` - 存储在服务器的文件的临时副本的名称
* `$_FILES["file"]["error"]` - 由文件上传导致的错误代码

##2. date()
* `date(format[,timestamp=now])`
* 把时间戳格式化为可读性更好的日期和时间。
* 格式使用字母，Y m d
* 使用`mktime(hour,minute,second,month,day,year)`创建时间戳
##3. 包含
	 include 'filename'; //错误时停止
	 require 'filename'; //错误时继续
##4. 文件
###打开
	$file=fopen("welcome.txt","r")[ or exit("Unable to open file!")];
	fclose($file);
	feof($file);
	fgets($file);
	fgetc($file); 
	file_exists("upload/" . $_FILES["file"]["name"]);
	move_uploaded_file($_FILES["file"]["tmp_name"],
      "upload/" . $_FILES["file"]["name"]);	//储存提交的表单内的文件

> r只读r+读写w请空只写w+清空读写a追加a+读追加x新建只写x+新建读写
##5. cookie
	setcookie(name, value, expire, path, domain);//设置
	setcookie("user", "Alex Porter", time()+3600);
	$_COOKIE["user"];//取回
##6. session 
* 为每个访问者创建一个唯一的 id (UID)，并基于这个 UID 来存储变量。UID 存储在 cookie 中，亦或通过 URL 进行传导。
* `session_start();` //开始session
* 存取变量： `$_SESSION['views']=1;`
* 释放变量：`unset($_SESSION['views']);`
* 结束并销毁session： `session_destroy();`
##7. email
	mail(to,subject,message,headers,parameters);//发送邮件
##8. filter
* filter_var(variable, [filter, options]) - 通过一个指定的过滤器来过滤单一的变量
* filter_var_array() - 通过相同的或不同的过滤器来过滤多个变量
* filter_input(input_type, variable[, filter, options]) - 获取一个输入变量，并对它进行过滤
* filter_input_array - 获取多个输入变量，并通过相同的或不同的过滤器对它们进行过滤

	$field=filter_var($field, FILTER_SANITIZE_EMAIL);
* Validating 过滤器：用于验证用户输入, 成功则返回预期的类型，如果失败则返回 FALSE
* Sanitizing 过滤器：用于允许或禁止字符串中指定的字符,始终返回字符串

##9. 错误处理
###die
终止并输出错误信息

	die("File not found");
###创建自定义错误处理器
出错时调用的函数。
	set_error_handler("error_function");
	error_function(error_level,error_message[,error_file,error_line,error_context])
###触发错误
	trigger_error(error_message[,error_types=E_USER_NOTICE ])
###错误日志
	error_log(error,[type=0,destination,headers]);
	error_log("Error: [$errno] $errstr");
###Exception
类似java

	try{
		throw new Exception("Value must be 1 or below");
	}
	catch(Exception $e){
 		echo 'Message: ' .$e->getMessage();
 	}
>可以自定义异常类 `class customException extends Exception`

####顶层异常处理器
	set_exception_handler('myException');
##10. mysql数据库
	mysql_connect(servername,username,password);
	mysql_close($con);
	mysql_query("SQL"[,$con=上一个]); //执行SQL语句，返回bool
	mysql_select_db("DBname", $con);//选择数据库
	mysql_fetch_array($result)//从记录集返回一行（一个关联数组）
##11. XML
略