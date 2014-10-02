# module.exports & exports
- 理解为，二者指向同一个对象
- 对exports赋成员会同时赋给module.exports
- 对二者直接赋值会使二者的关联丢失
# tips
- 同一个模块在运行时之存在一个实例