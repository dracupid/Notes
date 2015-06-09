# Bloom-Filter(BF) 布隆过滤器 1970

### 功能
- 检索元素是否在一个集合中
- 快速的概率算法。可能错判，但不漏判（说不在就不在，说在不一定在）

### 优点
- 节省空间
- 降低查询时间

### 缺点
- 有一定误识别率
- 无法删除元素
- Hash算法的选择影响效果

### 原理
- 要点1: 使用多个独立的Hash算法解决冲突。
- 要点2: 使用位数组表示集合。
- 某个Hash算法得出某元素不在集合中，那么该肯定不在。所有Hash算法得出该元素在集合中时，则假设该元素存在于集合中。
- 好比穷举法证明，有例子失败则错误，都成功亦不保证正确。

![](http://my.csdn.net/uploads/201208/12/1344737660_5943.jpg)
### 应用
拒绝不存在的元素类场景
- 垃圾邮件过滤
- 爬虫的URL过滤，判断页面是否已爬取过。
- 与Key-Value数据库配合，加快查询。
- google bigtable
- proxy-cache

### 扩展
#### CounterBloom Filter
- 给每个位添加计数器
- 能够支持删除

#### Compressed Bloom Filter
- 重新构造，减少额外空间

### 参考
0. http://en.wikipedia.org/wiki/Bloom_filter
0. http://blog.csdn.net/hguisu/article/details/7866173



# Skip List（跳跃表）1989

### 功能
- 一种随机化数据结构，基于并联的链表

### 优点
- 查找等操作的效率可比拟于二叉查找树（对于大多数操作需要O(log n)平均时间）

### 原理
- 一个跳表应该有几个层（level）组成，每层都是有序链表
- 第一层包含所有的元素
- 如果元素x出现在第i层，则所有比i小的层都包含x
- 第i层的元素通过一个down指针指向下一层拥有相同值的元素
- 在每一层中，INT_MIN和INT_MAX两个元素都出现(图中为-1 和 1)
- Top指针指向最高层的第一个元素
- 插入时元素所占的层数是随机的 

![](http://www.spongeliu.com/wp-content/uploads/2010/09/2.png)

### 参考
0. http://blog.csdn.net/topcoder1234/article/details/5841119
0. http://en.wikipedia.org/wiki/Skip_list


# Dancing Links（舞蹈链） 1979
### 功能
- 基于交叉十字循环双项链表，稀疏矩阵

### 原理
- 当元素从链表中被移除时，原有联系并没有真正的删除，只是被隐藏了。
	- x.left.right ＝ x.right;
	- x.right.left ＝ x.left;
- 如果知道元素的指针，可以轻松的在链表中恢复它
	- x.left.right = x;
	- x.right.left = x;

### 应用
解决Algorithm X（完全覆盖问题）

## 参考
http://www.cnblogs.com/grenet/p/3145800.html














