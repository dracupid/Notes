#Git教程#
----------
##1. 安装Git##
	Linux：sudo apt-get install git
	windows：msysgit 
###初始化用户信息
	git config --global user.name "Your Name"
	git config --global user.email "email@example.com"
###显示颜色
	git config --global color.ui true
###忽略某些文件时，需要编写.gitignore。
###配置别名
	git config --global alias.newName oldName
##2. 创建仓库(Repository)
>在空目录:    

	git init
##3. 向仓库添加文件
>仓库目录包括：**工作区(Working Directory) ---add---> 暂存区(stage) ---commit---> 仓库/班本库(.git)**  
>只能跟踪本件文本的改变。建议使用UTF-8 without BOM。不要使用windows记事本  
	
	git add a.txt			//将要提交的、变化了的文件添加到仓库暂存区
	git add -A .				//提交所有变化，-A包含删除
	git add '*.txt'			//必须加引号才能穿越文件夹层级，不会被bash拦截
	git commit -m "XXX"		//向仓库提交文件
>可以多次ddd，一次commit  
>add后未commit时，文件的修改不影响add的文件，应再次add————git管理修改而不是管理文件
##4. 从仓库删除文件
	git rm a.txt

>会自动删除工作区内的a.txt
##5. 仓库状态
查看工作区的修改状态

	git status
查看最近add/commit文件和工作区文件的区别（行粒度）
	
	git diff a.txt 
##6. 版本控制
>恢复到某个已commit的版本  

查看commit日志
	
	git log
	git log --pretty=oneline  //简化版显示
	git log --summary		//每次提交的详细信息
>--graph参数可以显示分支-合并图

	git log --pretty=oneline --abbrev-commit	//查看commit id缩写

回退

	git reset --hard HEAD^^    //HEAD代表当前版本,每个^代表上一版本
	git reset --hard HEAD~2    //另一种方法

前进

	git reset --hard 165d      //165d替换为要进到版本的hash code前N位（自动补全）
查看命令日志
	
	git reflog
>可以用来查找“未来”版本的hash code
###撤销更改（单文件）
将工作区的更改撤销，恢复到暂存区或已提交的上一版本

	git checkout -- a.txt
>回退是基于所有文件，撤销基于单个文件
###撤销add（单文件）
	git reset HEAD a.txt
## 7. 远程仓库
>自己搭服务器或者使用github  

创建SSH key，添加到github

	ssh-keygen -t rsa -C "youremail@example.com"
在github创建仓库后，与本地进行关联。在初始化过的git工作区内：

	git remote add origin git@github.com:dracupid/仓库名称.git
>远程库的名字就是origin，这是Git默认的叫法，也可以改成别的  
>也可以使用https（速度慢，每次输口令），一般用ssh  
###查看远程仓库信息
	git remote [-v]

>-v查看详细信息
###指定本地分支与远程分支的关联
	git branch --set-upstream branchName origin/branchName
###推送/上传
首次推送
	
	git push -u origin branchName/tagName
>把当前分支master推送到远程，-u是remember the parameters

普通推送

	git push origin branchName/tagName
	git push origin --tags 			//推送所有标签
###克隆/本地抓取
	git clone git@github.com:dracupid/仓库名称.git

>clone只抓取master分支
###克隆其他分支
	git checkout -b branchName origin/branchName
###获取最新版本（merge）
	git pull
##8. 分支
>每个分支当做一个指针

查看所有分支，*为当前分支

	git branch
**创建分支**

	git branch branchName
**切换分支**
	
	git checkout branchName
>切换前，必须commit或stash

**创建并切换分支**（等价于前两个）
	
	git checkout -b branchName
**合并分支**
>将分支A合并到当前分支（指针移动）——fast-forword  
>若合并时有冲突，则将冲突处标识出放入工作区，需自己检查后再次提交完成合并

	git merge branchA
>不使用fast-forward

	git merge --no-ff -m "merge with no-ff" branchA

>合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。  

**删除分支**

	git branch -d branchName
**强制删除未合并的分支**
	
	git branch -D branchName
##9. 工作区“储藏（stash）”
**储藏工作区**

	git stash
**查看已经储藏的工作区**

	git stash list
**恢复工作区**

	git stash apply
**删除储藏的工作区**

	git stash drop
**恢复并删除工作区**

	git stash pop
**多次stash恢复**
>先用git stash list查看，然后恢复指定的stash，用命令：
	
	git stash apply stash@{0}
##10. 标签tag
>不能移动的分支，一种版本快照

**创建标签**
>切换到要打标签的分支

	git tag v1.0			//当前commit
	git tag v0.9 commit_id	//史上某次commit
	git tag -a v0.1 -m "version 0.1 released" 3628164//创建带有说明的标签
**查看所有标签**

	git tag
**查看标签信息**

	git show tagName
**删除标签**

	git tag -d tagName				//删除本地标签
	git push origin :refs/tags/v0.9	//删除远程标签


-----------------
Create by dracupid at 2014/2/3 22:26:16