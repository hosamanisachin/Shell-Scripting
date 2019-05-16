# Shell-Scripting
#!/bin/bash #tells the path to interpreter i.e. inside bin and bash named interpreter
*other interpreter are csh; ksh, zsh;
# -> sharp only for the first line ... rest everywhere it is comment
! -> bang
Hence called shebang line
The interpreter is executed and the path used to call the script is passed as an argument to the interpreter.

*******------  Variable's

--variables are case sensitive
--Usually uppercase

variable_name="value"
**--- usage
NAME="SACHIN"
echo "MY name is $NAME." --------------------output MY name is SACHIN

or 

NAME="SACHIN"
echo "MY name is ${NAME}Hosamani." ----------output My name is SACHINHosamani
#the curly braces lets us add more charaters after the variable or else the interpreter won't identify the variable. Note that my last name is typed without anyspace.

How to assign a command to the variable
HERE=$(hostname) or HERE=`hostname` (back quotes)
echo ${HERE}

*******------  File

Syntax:
[ Condition_to_test_for ]

-d File -> True if file is a directory
-e File -> True is file exists
-f File -> True if file exists and is a regular file
-r File -> True if file is readable
-s File -> True if file exists and not empty
-w File -> True if file is writeable
-x File -> True if file is executable
-z string -> True if string is empty
-n string -> True if string is not empty

e.g. [ -e /etc/passwd ] 

*******------ Control Statements
1) if [<space> condition_is_true <space> ]
   then
    #command 1
    #command 2
   fi

e.g.
MYSHELL="bash"
if[ "$MYSHELL"="bash" ]
then 
  echo "This is bash shell"
 else #else does not require a then keyword
  echo "This is not a bash shell"
fi

.....We also have 
elif
then

2) for variable_name in item_1 .... item_n
do
  #command 1
  #command 2
done

e.g.
for COLOR in red pink blue orange
do
  echo "COLOR:$COLOR"
done
----output: 
red
pink
blue
orange

3) while [ condition_is_true ]
   do
    #command 1
   done
   
 e.g.
 INDEX=1
 while [ $INDEX -lt 6]
 do
  echo "Creating project ${INDEX} "
  mkdir /usr/local/project_${INDEX}
  ((INDEX++))
 done
 
 ------output
 6 folders with name project_1 to 6 are created in the mentioned directory.
 
 
 4) case "variable_name" in
    pattern_1 )
      #commands
      ;;
      .
      .
      .
    pattern_n )
      #commands
      ;;
   esac
   
e.g.
var=3
case var in
  1 )
    echo "1"
    ;;
  2 )
   echo "2"
    ;;
  3) 
    echo "3"
    ;;
  esac
-----output
3
 

*******------  Positional Parameters
#on the command line
[root@localhost shell]# script.sh parameter1 parameter2 parameter3

$0: "script.sh"
$1: "parameter1"
$2: "parameter2"
$3: "parameter3"
 

*to accept more than one parameter from the command line arguments
for USER in $@
do
  echo "PARAMETERS ARE: $USER"
done

*******------   Accpeting user inputs (STDIN)
read -p "PROMPT" VARIABLE_NAME

e.g.
read -p "Enter your name" NAME
 echo ${NAME}
 
*******------  Exit Status
Usually ranges from 0 to 255

Q) How to check exit status
ls /not/here
echo "$?"

Q) Compare the exit status 
cat /etc/shadow
var=$(echo "$?")
if [ "$var" == "0" ] or if [ $var == 0 ]

*******------  Operators

&& - AND
|| - OR
;  - one line coding

e.g. mkdir /tmp/bak && cp test.txt /tmp/bak
If the left side condition is true then the right side condition is executed. i.e. exit status is 0 of the L.H.S then the right side operation is performed.

e.g2. 
cp test.txt /tmp/bak ; cp test.txt /tmp

same as 
cp test.txt /tmp/bak
cp test.txt /tmp


*******------  Function
//# can work with or without the function keyword
function function_name()
{
  #code goes here
}
*even functions have exit status code

e.g. function hello()
{
  for Name in $@
  do
    echo "Hello $Name"
  done
}

hello Jason Dan Ryan


Q) Count the number of files/directories present
ls -1 location | wc -l

*******------  Wildcard

* - matches zero or more characters -> *.txt 
                                        a* # all files with start character a 
                                        a*.txt # with start letter a and end with .txt

? - matches exactly one character -> ?.txt #vall files only one character preceeding .txt
                                        a? #vall files that begin with a 
                                        a?.txt # with start letter a and exactly one more character and then end in .txt
                                        
[] - A character class -> matches any of the characters included in the brackets
e.g. ca[nt] -----> can;cat;candy;catch

[!] - exclude characters mentioned in the brackets

[[:alpha:]] # upper and lower case alphabets
[[:alnum:]] # upper and lower case alphabets and decimals
[[:digit:]] # 0 to 9
[[:lower:]] # lower case alphabets
[[:space:]] # wide-spcaes, tab, newline
[[:upper:]] # upper case alphabets

Q How to match with a wildcard character
*\? # the back-slash does the magic

Q Rename files to Date-filename
DATE=$(date +%F)
HERE=$(ls *jpg)
for FILE in $HERE
do
mv $FILE ${DATE}-${FILE}

*******------  Logging
Syntax: 
logger "Message"

logger -p local0.info "Message" #severity and facilty
logger -t myscript -p local0.info "Message" #tag
logger -i -t myscript "Message"
logger -s local0.info "Message" #to display on the screen


*******------  Debugging
Can be given at the shebang line 
-x #prints commands and their arguments as they will be executed, including susbstitutes and expansions
-v #prints commands just like they appear in the script w/o performing substiution and expansion
-e #exit immediately if the command exits with non-zero status

#!/bin/bash -xve

OR 
set -x  # to enable debugging
set +x  # to disable debugging

1) Manual Debugging
DEBUG=true or false 

OR we could say DEBUG="echo" and after every line that might throw an error we could use this variable
%DEBUG ls

OR as a debug function
debug()
{
  echo "Executing: $@"
  $@ #take all arguemtns from command line
}
debug ls


2) PS4 - is expanded and displayed before each command during an execution trace. That means when we use +x for bash script, the contents of PS4 are printed to the screen.


*******------  Control Character 
Plain text contain control character to represent the end of line.
In Unix                         In Windows
- line feed                     - Carriage return(^M) + line feed

So files transferred from Unix to Windows system might interpret the new line characters differently.
So at the shebang line we can mention(^M), indicating this.
On linux system it throws error No such file or directory.
Sometimes we dont write shebang line, so by default any bash could be running. Sometimes it wont work on that default bash in such cases it will help to identify this error.

Also we have commands like
dos2unix script.sh 
unix2dos script.sh 
To take care of this issue.


Q) Reading a file line-by-line
grep xfs /etc/fstab | while read LINE
do
  echo "xfs: ${LINE}"
done
