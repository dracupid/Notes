###**Type Introspection**
The ability of a program to **examine** the type or properties of an object at runtime.

- Using keywords such as `type` `typeof` `instanceof`, or a method or property to possess the ability.

###**Reflection** 
The ability of a program to **examine and modify** its structure and behavior (specifically the values, meta-data, properties and functions) at runtime

- Code can be generated at runtime by variables, instead of hard-coding.
- A key strategy for metaprogramming.
- `eval` is the most straightforward way, but more complicated methods or functions can be used to create a class or get its property whose name is a value or variable .
- In my view, reflection in Javascript may be on of the easist to use.

### **First-Class Citizen**
An entity which supports all the operations generally available to other entities in a language, including being passed as arguments, returned from functions, and assigned to variables or data structures.
- It should be able to be a plain value without a variable name.

### **Parameter & Argument**
Strictly speaking:
- **parameter** means *formal parameter*
- **argument** means *actual parameter*
However, mixing up is acceptable.

### **Funarg Problem**
- The difficulty in implementing **first-class functions** in programming language implementations so as to use stack-based memory allocation of the functions.
- Only arises if the body of a nested function refers directly to identifiers  in the environment in which the function is defined rather than the environment in which it is called.
- Solutions: Forbid such references or to create **closures**
1. Upwards funarg problem
- Returning a function from a function
- The calling function refers to the exited function's state after tshat function has returned. eg. nested function
- Solution
    - **Representing function as heap-allocated closures**
    1. Heap and garbage collection——significantly degrade performance
    2. Copy the variables into the closure at the time the closure is created
        - The state will no longer be shared between closures.
        - Thus, in some language,such as Java, only const variables is allowed to be referred
2. Downwards funarg problem
- Passing a function as a parameter to another function
- Refer to a function's state before that function executing

## **Partial Application**
Fixing(binding) a number of arguments to a function, producing another function of smaller arity(fewer arguments). 
- Produce functions by functions with given arguments. `add(x)(y) {x+y}`

## **Curry**
Takes multiple arguments into a sequence of functions, each with a single argument.
## **Uncurry**
Takes a function f(x) which returns another function g(y) as a result, and yields a new function f′(x,y) which takes a number of additional parameters and applies them to the function returned by function f.


## Clousure

In my view, clousure is a function with the environment in which it is defined.