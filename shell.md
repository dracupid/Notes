Shell Programming
============

## comment
- `#`: single line
- `{}`: multiply line, actually a useless function.

## Variable
#### Define/assignment
```bash
varName="value"
```
- Variable name shoud match `/[A_Za-z_][A-Za-z0-9_]*/`, bash keywords are not allowed.
- **NO** space on either side of space.

#### usage
```bash
echo $varName
echo ${varName}    # Recommended. However, bracket is only required in same case(see below)
```

Variable can be a used in a string

```bash
echo "This is $name"
echo "This is ${name}abc" # must use the bracket to identify the boundary.
echo "This is \$name" # print a $
```

#### types
- local
- environment
- shell
    + `$`: pid
    + `0`: filename of current script
    + `n`: the nth cli argument
        * It is a good practice to use $n as "$n" to avoid unwanted effect caused by spaces in arguments
        * just replacemant:
            - $1  : "n a" -> n a
            - "$1": "n a" -> "n a"
    + `#`: number of cli arguments
    + `*`: all of the cli arguments
    + `@`: all of the cli arguments with `""`
    + `?`: exit code or return value of the last command executed
    + `!`: pid of the last background command

> $@ == $* ; "$@"(array) != "$*"(string)

`read VARNAME`: read input from command line to the variable.
`readonly VARNAME`: set the variable to be read only
`unset VARNAME`: delete a variable

## command substitution
Save the result of the command to a variable.

```bash
varName=$(command)
or
varName=`command`
```

## Variable Substitution
- `${var:-VALUE}`: var || VALUE (var is empty or unset)
- `${var:+VALUE}`: var && VALUE
- `${var:=VALUE}`: var || var = VALUE
- `${var:?MESSAGE}`: var || print MESSAGE to stderr and exit

## operator
#### arithmetic
Not supported. Use command `expr` or `awk` instead.
```bash
`expr 10 % 5`
`expr 10 \* 5` # * must be escaped

```

#### relations
**space is required, because `[` is a program!**
numbers
```bash
[ $a == $b ]    # also !=
[ $a -eq $b ]   # also -ne, -gt, -lt, -ge, -le
```

strings
```bash
[ $a = $b ]     # also !=
[ -z $a ]       # string length == 0
[ -n $a ]       # string length != 0
[ $a ]          # string not empty
```

files
```bash
[ -r $path ]   # has read access, also -w, -x
[ -f $path ]   # a file?, also -d(directory), -c(character device), -b(block file)
[ -f $path ]   # empty?
[ -e $path ]   # exists?
[ -g $path]    # SGID set?
[ -k $path]    # Sticky bit set?
[ -p $path]    # named pipe?
[ -u $path]    # SUID set
```

#### boolean
```bash
[ ! $a ]
[ $a -o $b ]   # also -a
```

## string
```bash
str='this is a $string'  # any charatcer is printed as it is, include $ and \
str="this is $name"     # "" is optional, you can use variable and \ in it
```
string operations
- concat: just put them together
```bash
"a"$a$b"b""cd"
```
- length: `${#strVar}`
- substring: `${strVar:from:length}`

## array
```bash
arr=(v1 v2 v3)
or
arr[0]=v4      # Don't need to declare arr as an Array

var=${arr[0]}

${arr[*]}        # all items
${arr[@]}        # same as above
```
- length: `${#arr[*]}` or `${#arr[@]}`

## branch
Use `;` to write in a single line.
```bash
if condition
then
   ...
elif condition
then
   ...
else
   ...
fi

if test expression; then ...; fi

case VALUE in
    VALUE1)
        ...
    ;;   # break
    VALUE2|VALUE3|VALUE4)
        ...
    ;;
    *)
        ...
    ;;
esac
```

## loop
- Use `;` to write in a single line.
- `break n`: n layer number
- `continue n`
- LIST can be
    + `item1 item2 item 3`
    + `item1\nitem2\nitem3`
    + glob pattern
```bash
for var in LIST #for FILE in $HOME/*
do
    ...
done

for ((;;)); do # do can be in the same line
    ...
done

while condition
do
    ...
done

while :  # infinite loop
do
    ...
done

until condition
do
    ...
done
```


## function
a function is a command
```bash
function functionName () { # the function keyword is optional
    ...
    return sth
}

functionName # invoke as a command
```
- return or use the value of the last expression as return value
- return value must be a number, which behaves the same as exit code
- get the return value using `$?`, not `ret=functionName`

```bash
unset .f functionName # 删除函数
```

## Redirect
- `>`: stdout redirect to
- `>>`: stdout append to
- `2 >`: stderr redirect to
- `2 >>`: stderr append to
- `<`: stdin redirect to
- `2>&1`: combine stdout and stderr

```bash
command << delimiter
    document   # use document as stdin
delimiter
```

```bash
command > /dev/null 2>&1 # disable stderr and stdout
```

## include
Follwing two ways are same
```bash
. ./filename
source ./filename
```
- Dont't forget `./`

## commands
- echo: println
```bash
echo abc
echo "abc\c" # no new line
```
- printf: format println
```bash
# template can be reused
printf %s abc def # -> abcdef
printf '%s and %d'    # -> and 0
```
sort
tsort
tr
uniq
cut
paste
join
look
wc
awk
test/[
date
cal/ncal
expr
top
passwd
users
who
w
nroff/troff
pr
finger
df


http://www.tutorialspoint.com/unix/unix-shell.htm
http://www.howtogeek.com/67469/the-beginners-guide-to-shell-scripting-the-basics/
