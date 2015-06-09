- 强类型
- 每个函数和表达式都要返回一个值
- 惰性求值
- 函数式程式语言的一般思路：先取一个初始的集合并将其变形，执行过滤条件，最终取得正确的结果。

## 代数运算
- 自动处理小数
- 运算符后的负数需要括号

## 比较运算
== /= > >=

## 关系运算
True, False; && || not

只能用于布尔值

## 命名
- 可以用单引号
- 函数名首字母不能大写

## 函数
- 分类
    - 中缀函数
    - 前缀函数
- 定义
    + `funName arg1 arg2 = body`
    + 没有参数的函数通常被称作定义或者名字
    + 在交互模式中需要使用`let`定义
- 调用:
    + `funName arg1 arg2 arg3`
    + 两个参数可以使用中缀 <code>arg1 \`funcName\` arg2</code>
        * 定义函数时也可以使用
    + 默认为中缀的函数可转位前缀 `(==) 1 2`
- 函数调用优先级最高
- 内置函数
    + pred/succ: 返回一个值的前驱/后继 (successor)
    + min, max
    + div：求商
- 模式匹配
    + 通过定义单个值的输入输出（模式）定义函数

        ```haskell
        fact :: (Integral a) => a -> a
        fact 0 = 1
        fact n = n * fact (n - 1)
        ```
    + tuple/list解包

        ```haskell
        addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
        addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
        funName x:[] = x
        ```
        也能用于List Comprehension，变量赋值

        ```haskell
        [a+b | (a,b) <- [(1, 2), (3, 4)] ]
        (a, b) = (1, 2)
        y:x:xs = [1, 2, 3]
        ```
    + as模式
        在按模式分割什么东西时仍保留对其整体的引用

        ```haskell
        capital :: String -> String
        capital "" = "Empty string, whoops!"
        capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
        ```

- guard
	- 跟在函数名及参数后面的竖线标识，通常他们都是靠右一个缩进排成一列。
	- 一个 guard 就是一个布尔表达式，如果为真，就使用其对应的函数体。 类似对参数使用switch

		```haskell
		bmiTell :: (RealFloat a) => a -> String
		bmiTell bmi
		    | bmi <= 18.5 = "You're underweight, you emo, you!"
		    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
		    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
		    | otherwise   = "You're a whale, congratulations!"
		```
		若未指定otherwise，会进入下一个模式

- where绑定

	在函数底部定义名字，类似于声明函数级局部变量

	```haskell
	calcBmis :: (RealFloat a) => [(a, a)] -> [a]
	calcBmis xs = [bmi w h | (w, h) <- xs]
	    where bmi weight height = weight / height ^ 2
	```

- let绑定
	- 类似于声明块级局部变量
	- `let [bindings] in [expressions]`
	- let 绑定本身是个表达式，而 where 绑定则是个语法结构

- case语句

	模式匹配本质是 case 语句用于函数参数的语法糖

	```haskell
	case expression of pattern -> result
	                   pattern -> result
	                   pattern -> result
	                   ...
	```

- 高阶函数
    - 本质上，Haskell 的所有函数都只有一个参数——柯里化
    - 调用函数时，如果参数不全，返回柯里化后的函数。 `max 4`
    - 中缀函数: `(/4)` 或 `(4/)` 补缺少的一侧

- lamda

	`\ arg -> body`

- $
    + 函数呼叫符，是个函数
    + 优先级最低
    + 可以视作在$右面加一对括号
    + $ 还可以将数据作为函数使用
        * `map ($ 3) [(4+),(10*),(^2),sqrt]  `

- Function composition
    - f . g
    - 注意参数的一致性

## 载入文件
`:l fileName`

## 分支
- `if then else`
- else 不可省略
- 是一个有返回值的表达式

## List
- haskell的数组, `[1, 2, 3]`
- 只支持同种类型
- 字符串是的语法糖, 区分两者引号
- 运算
    + `++`: concat同类型list, `[1, 2] ++ [3, 4]`
    + `:`: 头部插入, `'A' : " bee"`, `[1,2,3]` 本质就是 `1:2:3:[]` 的语法糖。
    + `!!`: 取元素, `[1, 2, 4] !! 2`
- list可以嵌套，但必须是同类型的list
- 比较运算可用于列表，逐个元素比较。
- Range 构造list
    + 用于可枚举的元素
    + [start, next=1..end=infinity]: `[1..10]`, `['a'..'z']`, `[1, 3..10]`, `[1..]`
    + 避免使用浮点数
- List Comprehension
    + 从list中，以某种规则提取元素，并执行某种变换得到新list。可以替换map
    + [transform | list, predicate ] list可一个或多个，predicate(filter)可没有或多个
    + `[x * y | x <- [1..10], y <- [2..10], x * 2 >= 12, y < 7]`

## Tuple
数量和类型明确，tuple的类型取决于这两者。`(1, 'a')`
- 最少2个值

## Type
强类型，但支持类型推导

- 检测类型: `:t value`
- 类型:
    - Int, Integer(大整数), Float, Double, Char, Bool
    - List[], Tuple(每种都是独立类型，类似class)
    - Maybe: Just, Nothing
    - 枚举
        - Ording: LT, EQ, ET
    - 函数但类型是其签名
    + [Char]等价于String
- 类型声明: `:: type`, 类型声明也是一种值, 可以传给minBound等函数，但不能复制变量
- 函数类型声明: `funName :: (TypeClass var) => arg1Type -> arg2type -> retunType`
    - `->`是右结合
    - 类型声明中的单字母表示可变类型，类似泛型和多态
- 定义新类型
    + `data typeName = ValueConstructor`
    + 在声明数据型别时，等号=左端的那个是型别构造器，右端的(中间可能有|分隔)都是值构造器。
    + 对于|分割但值构造子，认为排在前面的小。
    + Value Constructor本质是个函数
    + 加入某个typeClass——deriving

    ```haskell
    data Bool = True | False
    -- 定义了一个叫Shape的类型，定义了Circle，Rectangle两个构造器函数
    data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    data Point = Point Float Float deriving (Show)
    ```

    + 类型的构造器可以用于模式匹配，借此实现了多态

    ```haskell
    surface :: Shape -> Float
    surface (Circle _ _ r) = pi * r ^ 2
    surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)
    ```

    - 导出类型, 及其所有构造器

    ```haskell
    module Shapes
    ( Point(..)
    , Shape(..) -- Shape(Rectangle,Circle)
    ) where
    ```

    - Record Syntax 使用类似对象的方式定义类型, 自动生成按类型名为名的函数，取某个项

    ```haskell
    data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Show)

    person = Person {firstName = "aa", lastName = "bb", age = 34}
    ```

    + 类型参数

    以类型作为类型的参数

    ```haskell
    data Maybe a = Nothing | Just a
    ```

## TypeClass
类型的类别，类似接口。

- 内置TypeClass
    + Eq: 可比较相等性
    + Ord: 可比较大小
    + Show: 可用字符串表示
    + Read: 可从字符串还原为原始类型
    + Enum: 可枚举
    + Bounded: 有上下限
    + Num: 数值
    + Integral: 整数
    + Floating: 浮点数

- Type synonyms

```haskell
type String = [Char]
type 别名 = 原名
```


## 模块
模块是一组函数、type和typeClass的jihe

`import moduleName` `:m moduleName moduleName`(仅交互模式)

```haskell
import moduleName (fun1, fun2)
import moduleName hiding fun1 -- exclude
import qualified moduleName -- name space
import qualified moduleName as M -- name space
```

创建模块

```haskell
module moduleName
( funName1
，funName2
，funName3
) where
...
```
