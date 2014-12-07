# If a value is exactly `NaN`
# Param: {Any}
# Return: {Boolean}
isNaN = (val)->
	val isnt val

###
UTF-16有两种长度：
对于U+0000到U+FFFF之间的字符，长度为16位（即2个字节）；
对于U+10000到U+10FFFF之间的字符，长度为32位（即4个字节），而且前两个字节在0xD800到0xDBFF之间，后两个字节在0xDC00到0xDFFF之间。
浏览器会正确将这四个字节识别为一个字符，但是JavaScript内部的字符长度总是固定为16位，会把四个字节视为两个字符
###
strToArray = (str)->
	length = str.length
	index = -1
	array = []

	while(++index < length)
		char = str.charAt index
		charCode = char.charCodeAt 0

		if 0xD800 <= charCode <= 0xDBFF
			array.push char + str.charAt ++index
		else
			array.push char
	array

btoaUnicode = (str)->
	btoa unescape encodeURIComponent str

atobUnicode = (str)->
	decodeURIComponent escape atob str

# Array-Like objects, such as arguments Object, HTMLCollection
class ArrayLike
	constructor: (@length = 0)->
		for i in [0...length]
			@[i] = null
	toArray: (self = @)->
		Array.prototype.slice.call self
	forEach: (self, func)->
		if arguments.length is 1 then 
			Array.prototype.forEach.call @, self
		else
			Array.prototype.forEach.call self, func

ArrayLike.toArray = Array::toArray
ArrayLike.forEach = Array::forEacgh

