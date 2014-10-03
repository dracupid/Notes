# Javascript
1. DON'T use `typeof` to do type checking(except for `undefined`). Using toString.call(X) instead.
	- Everything created by `new` will be regarded as an Object. Even worse for Array and RegExp.
	- **Recommend**: Using `_.isXXX()` in lo-dash, or `$.type` in jQuery.
	- Sometimes, **Duck Type** may be a good idea.
2. Avoid using `instanceof` on built-in objects, although it works well most of the time.
	- `instanceof` is not safe for string literal.
    - In my opinion, `instanceof` should be used on the objects defined by programmer.
    - **Recommend**: You should check the type of the built-in object to achieve the same goal.
3. DON'T use `variable == undefined` to check if the variable has been defined. Use type checking instead.
    - It will cause an ReferenceError.
    - It's fine to use `obj.property == undefined`, which is on the object property(Notice the difference between *property* and *attribute* in different language and OO specification).

# CSS
1. Always use background-image with background-color together.
    - It really helps when the background image fails to load. Especially when the text is white.
