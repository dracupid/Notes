# Javascript
1. DON'T use `typeof` to do type checking(except for `undefined`). Using toString.call(X) instead.
	- Everything created by `new` will be regarded as an Object. Even worse for Array and RegExp.
	- **Recommond**: Using `_.isXXX()` in lodash, or `$.type` in jQuery.
	- Sometimes, **Duck Type** may be a good idea.
2. DON'T use `instanceof` on built-in objects.
	- `Instanceof` only compare the constructor.
	- Make no sence for object not created by `new`.