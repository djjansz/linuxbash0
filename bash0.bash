###################################################################################################################
# Github Page
#         https://github.com/januszed/linuxbash0/blob/master/bash0.bash#L496
#
# Examples sourced from the course SYST13416 at Sheridan College: http://www.sheridancollege.ca/
# Scripts sourced from the Linux Documentation Project at: http://tldp.org/index.html
#
# Kate-Konsole Shortcut Keys
#        Focus/Defocus Terminal - Ctrl+Shift+T
#        Pipe to Terminal - Ctrl+Shift+P
#        Go back into Kate - Shift+Tab
#        Ctrl+Shift+C/V to copy/paste in the terminal
#        Window splitting and full screen - Ctrl+Shift+L/R/F
#        Comment or uncomment block Ctrl+D and Ctrl+Shift+D
#        Move line up/down with Ctrl+Shift+Up/Down
#
# Bash Shortcut Keys
#         p+tab (see all commands beginning with p)
#         Ctrl+R/F/G (Reverse/Forward/terminate history search)
#         Ctrl+A/E (Move to start/End of line)
#         Ctrl+K (delete from cursor to end of line)
#         Esc+U/L (Change to Upper/Lower case)
#         Ctrl+D (EOF marker)
#
# Vim Commands
#          :q<enter> to exit
#          :w filename <enter> to save a file
#          :help<enter> or F1 for online help
#          bash $vim filename.txt 
#          i for insert mode
#          <Esc> for command mode
#          ZZ - command mode to save and exit
#          :w save
#          !q - quit without saving
#          ^F,^Y,^B,^E - forward/backward one page/line
#          h,j,k,l - left,down,up,right (j looks like an arrow pointing down)
#          x,dw,dd,9dd - delete character, word, line, 9 lines
#          w,e - move to next/end of word
#          dd,y,p - cut, copy, paste
#          dd,D - delete current line, to the end of the line
#          o,O - insert new line below/above cursor
#          r,R - replace one/many characters
#          v,V - visual mode to select text
#          x,X - delete character under/before cursor
#          u,^R - undo, redo
#          ^,$ - first/last character of line
#          (),{} - beginning of previous/next line/paragraph
#          #,* - search backward/forward for word under the cursor
#          /,? - search mode forward/backword (n to go to to the next occurence)
#          :h vi-differences - differences between Vi and Vim
#          :sh - start the command line
#          /etc/vim/vimrc - config file can be edited to customize commands
#                    (e.g.  map <Esc><Esc> :w<CR>  for triple Esc to save)
######################################################################################################################
#manual of the man command
man man #spacebar to move forward, Esc,V to move back, / to search and Q to exit
#view section 5 (file formats) of the passwd command
man 5 passwd
#view the man page for the American Standard Code for Information Interchange
man ascii
# view a hypertexted file on the ls command
info ls
#whatis = man -f
whatis cal
#apropos = man -k
apropos cal
# view comamnds and files (ar is to create, modify and extract from archives)
apropos ar | less
#help on the ls command
ls --help
#list all files that start with the word linux (asterisk wildcard)
ls linux*
# View the tpe of commands (built-in or shell command and the location of binaries)
type who; type cd;
#change wd
cd Documents
#go home, to parent, back to where you came from
cd ~; cd..; cd -;
#print wd (internal)
pwd
#pipe the pwd command to the basename command to get just the name of the current folder
pwd | xargs basename
#pipe the pwd command to get the path, except for the current folder
pwd | xargs dirname
#list permissions, group, owner, filesize, date and filename
ls -l
#view last access date instead of last modification date
ls -ul
#show the inode number with the ls command
ls -i
#list file types (directory /, executable *, symbolic link @)
ls -F
# list files by size
ls -al --sort=size
du -s * | sort -n
for entry in $(ls); do du -s "$entry"; done | sort -n
#make a directory
mkdir abc
mkdir abcd
#remove directory
rmdir abc
#remove a directory and its content
rm -r abcd
#print wd (external)
/bin/pwd
#print f dis
echo f dis
#exectue myprog
exec myprog
#time an operation
time pwd
#create an environment variable
export NNTPSERVER=news.abiigisp.com
#view the value of the variable
echo $NNTPSERVER
#send the value of the environment variable to the nntpserver.txt file (redirect stdout)
cd /home/dave/Documents
echo $NNTPSERVER > nntpserver.txt
#append some more text to the nntpserver text file
echo "more text" >> nntpserver.txt
#view all environment variables
env
#delete the NNTPSERVER environment variable
unset NNTPSERVER
#find all backup files (ending with ~) in the current and subdirectories (./)
cd /home/dave/Documents
find ./ -name "*~"
#remove all backup files by piping this list to xargs rm (ones without a space)
find ./ -name "*~" | xargs rm
#view listing 1.1
cat listing1.1.txt
cat -e listing1.1.txt #display line ends with a dollar sign
cat -n listing1.1.txt #display line numbers
#view listing 1.2 with a pager command
less listing1.2.txt
#concatenate listing1.1 and listing1.2
cat listing1.1.txt listing1.2.txt > listing1_cat.txt
#inner join on the two files
join listing1.1.txt listing1.2.txt > joined_list.txt
#sort by the first field
sort listing1_cat.txt
#merge the files line by line
paste listing1.1.txt listing1.2.txt
#octal dump (base 16 ASCII)
od listing1.1.txt
#sort by the thrid field (first name) descending
sort -r -k 3 listing1.1.txt
#sort by the thrid field (first name) ascending
sort -k 3 listing1.1.txt
#numeric sort by the first field
sort -n -k 1 listing1.1.txt
#split the file every 2 lines and save the file as numberaa and numberab
split -l 2 listing1.1.txt numbers
#view the processes currently running
ps aux
#view the process running for amarok
ps aux | grep amarok
#kill the process with pid xxxx
kill xxxx
#list all of the pdf files in a directory
cd /home/dave/Documents
ls *.pdf
#make a directory writeable
sudo chmod a+rwx /usr/local/lib/R/site-library
#view firewall information
sudo iptables -L
#/var/tmp can probably be removed. Much in various /var/cache-directories
cd /var
ls -a
# view the current system (32 or 64 bit)
uname -a
#view the file sizes in the cache
du /var/cache/apt/archives
#remove cache files
sudo apt-get clean
#view the file sizes
#Delete all pdf files in the generic directory of texlive-pstricks-doc
sudo find /usr/share/doc/texlive-pstricks-doc/generic -type f -iname '*.pdf' -delete
sudo find /usr/share/doc/texlive-base -type f -iname '*.pdf' -delete
#find all pdfs in the current directory
sudo find  -type f -iname '*.pdf'
#delete all pdfs in the current directory
sudo find  -type f -iname '*.pdf' -delete
# Cleanup log files in /var/log (run as root)
sudo rm /var/log/kern.log.1
sudo find /var/log -type f -iname '*.log' -delete
sudo find /var/log -type f -iname '*.gz' -delete
sudo find /var/log -type f -iname '*.log.old' -delete
# clear firefox cache
cd /home/dave/.cache/mozilla/firefox/lcnz85cr.default/Cache 
rm -rf 0; rm -rf 1; rm -rf 2; rm -rf 3; rm -rf 4; rm -rf 5;
rm -rf 6; rm -rf 7;rm -rf 8; rm -rf 9; 
rm -rf A; rm -rf B; rm -rf C;
#installing some packages and then removing them
sudo apt-get install cmake kdebase-workspace-dev libqjson-dev git libqca2-dev
sudo apt-get --purge remove cmake kdebase-workspace-dev libqjson-dev git libqca2-dev
#remove all directories and subdirectories from a failed install
cd /home/dave
sudo rm -rf kdeconnect-kde
# installing and then removing rpm with apt-get
sudo apt-get install rpm
sudo apt-get remove rpm
sudo apt-get purge rpm
############################################################################################################
#Change to the directory in which you want to install
cd /usr
sudo mkdir java
cd home/dave/Downloads
#Move the tarball to the directory
sudo cp jre-7u45-linux-x64.tar.gz /usr/java/jre-7u45-linux-x64.tar.gz
#Unpack the tarball and install Java
sudo tar zxvf jre-7u45-linux-x64.tar.gz
#Remove the tarball to save disk space
sudo rm jre-7u45-linux-x64.tar.gz
###########################################################################################################
#Alternative Java installation
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer
#installing firefox
sudo apt-get install firefox
##########################################################################################################
# Programming Languages
# Perl - http://www.perl.com/
man perl
# Python - http://www.python.org/
man python
# C - http://www.gnu.org/software/gcc/
man gcc
# FORTRAN - http://www.gnu.org/software/fortran/fortran.html
man g77
# Ada - http://www.gnu.org/software/gnat/gnat.html
info gnat
#Run R interactively - type q() to exit
exec R
#Run octave interactively - type quit() to exit
exec octave
#########################################################################################################
#Perl Programming - view the location of the perl interpreter
which perl
# Write the following program and give it the name hello.pl
#!/usr/bin/perl -w 
#classic hello world shit
print "Hello world!\n"
# At the bash command line - write the following command to execute the perl hello world program
perl hello.pl
########################################################################################################
#Python programming - view the location of the python interpreter
which python
# Write the following program and give it the name hello.py
#!/usr/bin/python
#Classic hello world shit in python
print("Hello world!")
# At the bash command line - write the following command to execute the python hello world program
python hello.py
########################################################################################################
#C Programming - view the version of the GNU C and GNU C++ compilers
gcc --version
gcc -v
man gcc
gcc --help
g++ --version
#send the manual to a text file (view it online at: http://linux.die.net/man/1/gcc)
man gcc | col -b > gcc.txt
which gcc
# write the following hello world program and save it to a file called hello.c
//usr/bin/gcc
//Classic hello world shit in C
#include <stdio.h>
int main() {
    printf("Hello, world!\n");
    return 0;
}
#Compile and link source file hello.c into executable hello.exe
cd /home/dave/Documents
gcc -o hello.exe hello.c
#Execute hello.exe under the Bash shell, specifying the current path (./)
./hello.exe
#Another method - Preprocessing (via C pre-processor cpp), compilation (gcc), assembler (as.exe), linker
cpp hello.c > hello.i
gcc -S hello.i
as -o hello.o hello.s
ld -o hello.exe hello.o
#C pre-processor default include paths
cpp -v
#compile in verbose mode (-v) to study the library-paths (-L) and libraries (-l)
gcc -v -o hello.exe hello.c 
# Yet another hello world program in C - this time using a character array stored as a string constant
// More classic hello world shit in C
#include <stdio.h>
 int main()
{
  char string[] = "Hello World Part II";
  printf("%s\n", string);
  return 0;
}
# save the program as hello2.c
cd /home/dave/Documents
gcc -o hello2.exe hello2.c
#Execute hello2.exe under the Bash shell, specifying the current path (./)
./hello2.exe
# The hello world infinte loop
#include <stdio.h>
#define TRUE 1
int main()
{
  while (TRUE)
  {
    printf("Hello World\n");
  }
  return 0;
}
# save the program as hello3.c
cd /home/dave/Documents
gcc -o hello3.exe hello3.c
#Execute hello3.exe under the Bash shell, specifying the current path (./)
./hello3.exe
# Increment operators in C
// Example of increment operators in C
#include <stdio.h>
int main()
{
    int age;
    printf("Enter your age in years:");
    scanf("%d",&age);
    printf("You are %d years old.\n",age);
    age--;
    printf("Last year you were %d.\n",age);
    age++;
    age++;
    printf("In one year you'll be %d.\n",age);
    return(0);
}
# save the program as age.c
gcc -o age.exe age.c
./age.exe
##########################################################################################################
# Example of running some other programs using the C++ and C compilers
#Compile-only with -c option
g++ -c -Wall -g dice.cpp
#Link object file(s) into an executable
g++ -g -o dice.exe dice.o
#Run the program
./dice.exe
#Compile the Matrix Multiplicaiton Example
gcc -c -Wall -g matrix.c
#Link object file(s) into an executable
gcc -g -o matrix.exe matrix.o
#Run the program (2 Enter 2, 1 space 2 enter 3 space 4 enter, etc.)
./matrix.exe
#Compile the Fibonacci example
gcc -c -Wall -g fibonacci.c
#Link object file(s) into an executable
gcc -g -o fibonacci.exe fibonacci.o
#Run the program (2 Enter 2, 1 space 2 enter 3 space 4 enter, etc.)
./fibonacci.exe
#Convert all odf documents in the current directory to pdf
libreoffice --headless --convert-to pdf *.odt
#Convert the test.doc to pdf
libreoffice --headless --convert-to pdf test.doc
/home/dave/Documents/P&C Act/FAP
find "/home/dave/Documents/P&C Act/FAP" -iname '*.pdf' -exec pdfgrep -H 'casualty' {} \;
#Change the default notification of updates
sudo nano /etc/update-manager/release-upgrades
#math API on Unix systems is a specification on how to use the mathematical functions included in the math library
man 3 sqrt 
#calculating the square root of 30 in linux, python and perl
calc=$(echo "sqrt ( 30 )" | bc -l) ; echo $calc
python -c 'import math; print math.sqrt(30)'
perl -e 'print sqrt(30), "\n"'
#Create a C program from the shell
vi example.c
#press i and then copy the following C program, then press Esc, ZZ
#include<stdio.h>
main()
{
        printf("Another Hello World Program\n");
        printf("Written in C\n");
}
#Enter the following code to compile the hello world program
cc example.c
./a.out
#calculating with echo
let val=3*4
echo $val
val=3*4
echo $val
#bc is a language similar to C with a standard math library
bc
scale = 3
i=.1
(1+i)^2
quit
#using bc as a filter
val=$(echo "scale=4; 2.0 /4.0"|bc) 
echo $val
val2=$(echo "scale=4; 8.0*$val"|bc)
echo $val and $val2
declare -ix val=5*3
echo $val
#create a file called nums.txt and calculate things by field
vi nums.txt
#paste the below into nums.txt
1 2 3 4
5 6 7 8
9 10 11 12
################################################################################################################
# awk - a data driven scripting language
# $NF prints the last field when you use awk
awk '{print $NF}' nums.txt
#get the length of everything you enter (press ctrl+D to exit an interactive awk)
awk '{print length($0)}' 
#get the length of every line in the text file
#compute the square root of every fourth field in a file of numbers like so:
awk '{print sqrt($4)}' nums.txt
#display the name of the terminal
tty
#display settings of the terminal
stty
#open communication with a terminal and start the login process
getty
#sleep for 3 seconds
sleep 3
#send the stout to f and stderr to e
ls /ggg > stdout1 2> stderr1
ls /home > stdout2 2> stderr2
more stderr1
more stdout2
#count the number of lines, words and characters and redirect the output to a file
wc < hello.c > hello_wc
more hello_wc
#store the 2007 calendar in a file and then append the 2008 calandar
cal 2007 > calend
cal 2008 >> calend
more calend #spacebar to scroll through
#December 2009, 2010 and 2011
(cal 12 2009; cal 12 2010; cal 12 2011) >> calend2
more calend2
#send to monitor and to a text file1
who | tee users.txt
#append to the file
who | tee -a users.txt
more users.txt
#display currently logged in users
who
#display who you are
who am i
#Display the current date and time
date
#display the current date with formatting
date +'Date: %m/%d/%Y%nTime: %r'
#view the last 3 commands
history 3
#view the mounted partition
mount
#link hello.c to hellolink.c - a hard link is analogous to a table view
ln hello.c hellohlink.c
#create a symbolic link (allows linking to directories and across filesystems)
ln -s hello.c helloslink.c
#Create a symbolic link to a file that is up a folder and in that folders' subdir 
ln -s ../RSAS/insurance3.xls insurance3slink.xls
#change permissions on a file (CHange protection MODe)
chmod u-r test.r
#change permissions so that a file has rwx-r--r-- (only the owner has read-write-exec)
chmod 744 zvim.txt
#copy to your home directory
cp hello.c ~/hello.c
#copy to the current directory
cp ~/Documents/RSAS/rclust1.r .
cp rclust1.r rclust2.r
#list files named _clust***
ls ?clust*
#remove files named like _clust**
rm ?clust*
#move (rename) a file
cd ~/Documents/CppWOF
mv avg.cpp avg2.cpp
# Display statistics about memory usage (in MB)
free -m 
# view the version of the free command
free -V
# List the header files that have at least one #include directive
grep -l '*#include*' /usr/include/*
#recursively zip all files from backups
zip -r backups2.zip backups
#create archive.tar from files avg2.cpp and dice.cpp
cd ~/Documents/CppWOF
tar -cf archive1.tar avg2.cpp dice.cpp
#view a files type and attributes
file hello.c; file hello.o
#view the text characters inside the /bin/echo binary file
strings /bin/echo | more
#view the first 5 lines of the hello.o object file in octal format
od hello.o | head -5
#display the last 5 lines in hexidecimal format with the -x option
od -x hello.o | tail -5
#creating text files - use touch, vi or else redirect output
echo "Hello World Part II" > hwpii.txt
more hwpii.txt
cat hwpii.txt > hwpII.txt
#change date last modified with touch
ls -l
touch hwpII.txt
ls -l
#Concatenate
cat hwpii.txt
cat hwpii.txt hwpii.txt
cat hwpii.txt hwpII.txt > hwp2.txt
cat hwpii.txt hwpII.txt hwp2.txt
#paginate with more or less. Spacebar to move forward, b to ove backward and q to quit
more faces.java
################hardware components#############
#Force the computer to shut down
sudo poweroff -f
#reboot
sudo reboot
#add new user
sudo useradd djanusz
sudo passwd djanusz
grep djanusz /etc/passwd
#switch to new user, print the new users name, then logout
su - djanusz
whoami
exit
#delete user
sudo deluser djanusz
# add a new user with the home directory /home/sas02
sudo useradd -m -s /bin/bash -d /home/djanusz djanusz
#The list hardware command lshw
sudo apt-get install lshw-gtk
#X Windows interface to this command
sudo lshw -X 
time sudo lshw -html > ~/Documents/lshw.html
sudo lshw -xml > ~/Documents/lshw.xml
sudo lshw -json > ~/Documents/lshw.js
sudo lshw -short > ~/Documents/lshwshort.txt
sudo lshw -businfo > ~/Documents/lshwbus.txt
#view the number of users
cat /etc/passwd
#install some other shells
sudo apt-get install csh
sudo apt-get install ksh
#change the default shell for ordinary users (enter /bin/csh when prompted)
chsh
#change between bash and csh
bash
csh
#view the shells on your system
cat /etc/shells
#run a short shell script
sh ./myVeryFirst.sh
#using bash also works to run shell scripts with the .sh extension
bash ./myVeryFirst.sh
#change the permissions on the shell script
chmod 751 myVeryFirst.sh
#read write, execute for everyone (111 in binary, or 7 in decimal, is rwx)
chmod 777 myVeryFirst.sh
#once it is executable, you ccan run it like other commands
myVeryFirst.sh
#Or if the directory is not in the PATH variable
./myVeryFirst.sh
#Create a shell variable (note that there is no whitespace around a shell variable)
dog="fido"
echo "Don't let $dog near the river"
#weak quote allows interpretation of variables/parameter including the following positional parameter
echo "the average pay is $1000"
#strong quote allows substitution of characters
echo 'the average pay is $1000'
#the backslash is like the strong quote
echo the average pay is \$1000
#weak quotes to show the variables (variable evaluation)
echo "$dog"
#strong quotes and we don't see the variables
echo '$dog'
#weak quotes allows command substitution and variable evaluation
echo "The PATH variable is $PATH and the current directory is `pwd`"
#command substitution
mydir=`pwd`; echo $mydir
#command substitution with and without quotes (the quotes make a trailing newline after each directory listing)
dirListing=`ls -l`
echo $dirListing
echo "$dirListing"
# Shell variables postional parameters command-line arguments
set A B C
echo $2 $3
echo $#
echo $0
echo $*
# Using arguments to the previous command  (enter the bar directory with $_)
mkdir bar
cd $_
#create some files and display thier content
cd ~/Documents
mkdir bar
cd bar
vi some.sh
vi somemore.sh
touch some.sh somemore.sh
mkdir backup
cat some.sh somemore.sh
cp !* ./backup  #pass all arguments from the previous command
#There are 3 types of variables: 1. Shell, 2. Configuration and 3. Environment (Local or Global)
env #list environmet variables
#list environment variables (PATH has the paths that are searched for commands)
printenv
# view the PATH environment variable (a colon-separated list of directories)
echo $PATH
# create a local variable and then export it to the environment
DOCPATH=/home/dave/Documents
export DOCPATH
env | grep DOC
#add the Downoads directory and your current directory to the environment variable
export DOCPATH2=$PATH:/dave/home/Downloads:.
echo $DOCPATH2
# set the variable to readonly
readonly DOCPATH2
# save the current prompt as another environment variable
MYPROMPT=$PS1
echo $MYPROMPT
# revert to your original prompt as needed
PS1=$MYPROMPT
# Customize the prompt - display the time of day and the number of jobs that you are running
export PS1="[\t \j]"
# change the prompt display to: username-host jobs shell version directory
export PS1="\H \j \s \v \w >"
# display the directory and user information ($ indicates user is root)
export PS1="\$PWD (\w) \$ >"
# Customers a user's bash shell
cd ~ # go to home directory
ls -al #view all files including hidden
cat .bashrc
cp .bashrc .bashrcOG
vi .bashrc # add PS1="\$PWD (\w) \$ >" to the end to customize your bash script
# make some alaises
alias ll="ls -al"
ll
# make a backup of the .profile file and add in some useful aloiases
cd ~
cp .profile .profileOG
vi .profile # add in who="who | sort"
#compare two numbers in a bash script
#enter the following in a text file called compareTwoNums:
#compare two numbers entered by the user
read -p "Please enter two different numbers (num1 and num2):" num1 num2
if [ $num1 -eq $num2 ]
then
echo "You entered two equal numbers: " $num1
else
if [ $num1 -gt $num2 ]
        then
echo "num1: $num1 is greater than num2: $num2."
        else
echo "num2: $num2 is greater than num1: $num1."
        fi
fi
#execute the script using chmod +x
chmod +x compareTwoNums
compareTwoNums
# Excecuting programs in different programming languages
# Gibbs sampler algorithm obtained from 
# http://darrenjw.wordpress.com/2011/07/16/gibbs-sampler-in-various-languages-revisited/
# Store the programs in ~/Documents/Gibbs
# Changed the parameters to N=5000 and thin=100 for a faster program executions
cd /home/dave/Documents/Gibbs
time Rscript gibbs.r
time Rscript gibbs2.r > datar.tab
Rscript gibbs_compare.r
kde-open Rplots.pdf
#save the above and run it in a script today (schedule to run with the Bourne shell)
at -f rungibbs.bash 3:18 am today
# Create an alias to open pdf files with open
cd ~
vi .bashrc #alias open='kde-open'  (exit the terminal and re-open so that the alias will work)
cd ~/Documents/Gibbs
open Rplots.pdf
# Run R interactively (enter source("test.r") to run test.r from the R session)
exec R
# Run the gibbs program in the Python programming language
time python gibbs.py > datapy.tab
less datapy.tab
#view where C stores the header files
`gcc -print-prog-name=cc1` -v
# tell C to link to the header files in /usr/include so that the math.h header file links
C_INCLUDE_PATH=/usr/include
echo $C_INCLUDE_PATH
export C_INCLUDE_PATH
gcc gibbs.c -o gibbs -lm -lgsl -lgslcblas
time ./gibbs > datac.tab
# Sort, Cut and Paste Text files
info coreutils 'sort invocation' # the complete manual for sort
# GNU Core Utilities are the basic file, shell and text manipulation utilities of the GNU operating system
man cut -dk
comm --help
#    The defaults are:
# * the join field is the first field in each line;
# * fields in the input are separated by one or more blanks, with
#   leading blanks on the line ignored;
# * fields in the output are separated by a space;
# * each output line consists of the join field, the remaining fields
#   from FILE1, then the remaining fields from FILE2.
man sort
# enter the following into text files 
# vi text1.data
2 jane 45000
1 joe 33000
3 jessica 50000
9 pacha 25000
10 john 60000
# vi text2.data
3 peter 60000
1 paul 70000
2 pam 80000
9 pacha 25000
#vi text3.data
2,"sam snead",48000
1,"sona sanchez",55000
3,"stacey smith",72000
# sorting files with no options
sort text1.data > sorted1.data
sort text1.data > sorted1
cat sorted1
sort text2.data > sorted2.data
sort text2.data > sorted2
cat sorted2
ll | grep sorted
# delete both files (you can perform batch operations with braces {} )
rm sorted{1,2}
ll | grep sorted
# extract the first columns only (note the file is delimited by commas)
cut -d, -f1 text3.data
# extract the second and third colums
cut -d, -f2-3 text3.data
# extract the first and third column
cut -d, -f1,3 text3.data
# extract the third column from the space delimited text1.data file
cut -d" " -f3 text1.data
# sort the space delimted text2.data file on the 3rd field and redirect the results to sorted2on3
sort -t" " -k 3 text2.data > sorted2on3
# display both files one ontop of the other (append vertically without any matching)
cat text2.data sorted2on3
# line the data files up side by side (append horizontally without any matching)
paste text1.data text2.data
# transform the data into one row
paste -s text2.data
# transform the data to two rows (from 4x3 to 2X6)
paste -s -d'\t\n' text2.data
# cut the second column from text2.data and append that horizontally to text3.data
cut -d' ' -f2 text2.data | paste - text3.data
# compare two sorted files with comm
comm sorted1.data sorted2.data
# the vertical intersection of the data files (sql sorted1.data intersect sorted2.data)
comm -12 sorted1.data sorted2.data
# the vertical exception (sql sorted1.data except sorted2.data)
comm -13 sorted1.data sorted2.data
# the vertical exception (sql sorted2.data except sorted1.data)
comm -23 sorted1.data sorted2.data
# show everything except the intersection of the two files
diff sorted1.data sorted2.data
# products.data
# vi products.data
4321:watch:200
4321:video-game:500
5678:cd-rom:150
5678:dvd:2000
8765:phone:3500
# vi names.data 
1234:Johnson:Bob
4321:Jones:Jim
5678:Smith:Dave
7777:Brown:Tim
8765:Martin:Peter
# horizontal joins based on matching columns
join -t: names.data products.data
# join using the -o option with a field list to perform intricate joins
join -t: -o 1.2 2.3 2.2 names.data products.data > purchases
# print the purchases on a double spaced page in the terminal
pr -d -h 'Products Purchased' purchases
# using awk in a similar fashion to a filter (sql where clause)
awk '/joe/{print}' sorted1.data 
# The string /joe/ is the awk target, and the action (in braces) is to print the third field
awk '/joe/{print $3}' sorted1.data
# The delimiter is a colon and the action is to print the second and third columns
awk -F: '/Jones/{print $2,$3}' names.data
# batch editing with awk
# data in file1.txt
14      15      16
15      15      11
5       56      6
5       25      1
# print columns 1 and 2
awk '{print $1,$2}' file1.txt
# multiply columns 1 and 2 and redirect output to a new file
awk '{print $1, $2, $1*$2}' file1.txt > file2.txt
# remove the first column with the printf function (works like the C printf function)
awk '{ for (i=2; i<=NF; i++) printf "%s ", $i; printf "\n"; }' file1.txt
# create the employees file
# vi employees
409,John Baker,56000,civil engineering
678,Fred Smith,73000,physics
429,Julia Tanguay,47000,computer science
349,Peggy Bantin,67000,Physics
268,Mario Hodgkins,55000,programming
# Display all records of employees teaching in the physics department
awk -F, '/physics/ {print}' employees
# Display employee name and department from all records
awk -F, '{print $2, $4}' employees
# Extract all records of employees teaching in the physics department, and display
# their names and salary and ignore case
awk -F, '/[Pp]hysics/{print $2, $3}' employees
# Selecting lines by field value. Display records where the salaries are: 55000
awk -F, '$3 == 55000' employees
# Display records where the salaries are less than 55000
awk -F, '$3 < 55000' employees
# Display records where the salaries are more than 55000
awk -F, '$3 > 55000' employees
# Display records of employees working either in the physics or programming departments
awk -F, '/[Pp}hysics|programming/{print}' employees
# Display records for employees who work in computer science
awk -F, '$4=="computer science"' employees
# Display records for employees who makemore than $55,000 but less than $70,000
awk -F, '$3>55000 && $3<70000' employees
# Display records for employees who make more than $55,000 OR less than $20,000
awk -F, '$3 > 55000 || $3 < 20000' employee
# Complex awk scripts (create the awktest.awk file from the long command below) 
# vi awktesst.awk
/physics/{name= $2 salary=$3 print " employee name is: "name print " employee salary is: "salary}
# run the .awk file
awk -F, -f awktest.awk employees
# Networking Commands
# the machines hostname
hostname
# the domain name that the machine belongs to
hostname -d
# the fully qualified host and domain name
hostname -f
# the IP address
hostname -i
# see the IP of google by sending packets (Ctrl+C to stop)
ping www.google.com
# view network configuration
ifconfig
# the multicast groups (network) subscribed by this host
netstat -g
# display process id of an application being used at that port
netstat -nap | grep port
# display all connections using TCP and UDP
netstat -a
# display only the TCP connection
netstat --tcp
# find the IP address for a given domain name
nslookup www.google.com
# traceroute is a utility to view the number of hops to get to a remote system
traceroute www.loblaw.ca
# display the user's login name, terminal name and write status
finger
# adding and removing users and groups
groupadd grp2
# modify a group
sudo groupmod -n grp21 grp2
# delete the group
sudo groupdel grp21
# view the groups
cat /etc/group
# create a new directory and add a user there
cd /home
mkdir januszed21
sudo useradd -d /home/januszed21 -g grp21 -m -s /bin/ksh -u 887 januszed21
# view the password file which has usernames
sudo cat /etc/passwd
# update a password for a user
sudo passwd januszed88
# view the encrypted password of accounts
sudo cat /etc/shadow
# view the secure group account information
sudo cat /etc/gshadow
# Shell Operators and Shell Scripting
let x=14+5+4*8; echo $x
let y=(14+5)+4*8; echo $y
let z=(14+5+4)*8; echo $z
#!/bin/bash
#Program name: add.sh
#Description: display and add two numbers
let a=1
let b=2
let sum=$a+$b
echo "a=$a, b=$b and sum=$sum"
#!/bin/bash
# Description: show some examples of the test and expr command
#            the exit status is 0 for T and 1 for F in the test command
#            and the opposite for Boolean evaluations in the expr command.
number=20
test $number -eq 20
echo $?
value=10
test $number -lt $value
echo $?
name="Linus"
test $name="Linus"
echo $?
test $name="Brian"
echo $?
#create an empty file and test if the file is executable
touch testfile
ls -l testfile
test -x testfile
echo $?
test -r testfile
echo $?
# the expr command for math. Asterisk must be escaped so that 
# it is not confused with the wildcard. Parenthesis must also be escaped.
# Each argument must be separated by whitespace.
expr 7 + 3
expr 7 \* 3
expr 7 \* \( 3 + 1 \)
expr 7 = 0
expr length "Linux is the best"
expr substr "Linux is the best" 7 8
expr index "Linux is the best" "x" 
# Enter the following into the data1 file for the grep example that follows
# Commands of the grep family search the input files for lines matching a pattern
Harry is smart
Harry
His name is Harry
His name is Harry Potter
The dog likes bones.
I know who you are and I saw what you did.
Who knows what lurks in the hearts of men?
color
colour
# Find all lines that contain the pattern "Harry"
grep Harry data1
# Find lines that begin with "Harry"
grep '^Harry' data1
# Find lines begin and end with "Harry"
grep '^Harry$' data1
# look for empty lines
grep '^$' data1
# find all lines that contain the word starting with "kn"
grep '\<kn' data1
# find all lines that contain the word ending with "ow"
grep 'ow\>' data1
# find all lines that contain the word "colour" or "color"
grep 'colou*r' data1
# What are all the English words that begin with “qu”?
grep '^qu' /usr/share/dict/words | less
# What are all the English words that end with “y”?
grep 'y$' /usr/share/dict/words | less
# What are all the English words that begin with “qu” have one more letter, then ends with “y”?
grep '^qu[a-z]y$' /usr/share/dict/words
# What are all the English words that begin with “qu” has two more letters and then ends with “y”?
grep '^qu[a-z][a-z]y$' /usr/share/dict/words
# What are all the English words that begin with “qu” has three more letters and then ends with “y”?
egrep '^qu[a-z]{3}y$' /usr/share/dict/word
# The grep command makes use of regular expressions (regex) syntax
# the num.list file
 1	15	fifteen
 2	14	fourteen
 3	13	thirteen
 4	12	twelve
 5	11	eleven
 6	10	ten
 7	9	nine
 8	8	eight
 9	7	seven
10	6	six
11	5	five
12	4	four
13	3	three
14	3	two
15	1	one
# print to stdout, the lines that contain '15'
grep '15' num.list
# count the number of occurrences of '15'
grep -c '15' num.list
# the occurences of 1 followed by 1,2 or 5
grep '1[125]' num.list
# lines that begin with a space
grep '^ ' num.list
# lines that do not begin with a space
grep '^[^ ]' num.list
# lines that do not begin with a space (invert the matching, so that you get non-matching lines)
grep -v '^ ' num.list
# lines that begin with the numbers 1 to 9
grep '^[1-9]' num.list
# lines that contain "t"
grep 'te*' num.list
# lines that contain "te"
grep 'tee*' num.list
# Search recursively
grep -r [Ss][Aa][Ss] ~/Documents/*
#find allows you to search for files
cd ~/Documents/RSAS
find *sas*
#find all files that contain means in the pathname
find -type f | grep means
 List all files and subdirectories in your home directory
find $HOME -print
# Search the filesystem, beginning at root, for files that end with .sas
find / -name '*sas*'
# search sas files for the word proc (include both upper lower case) and remove errors by sending them to null
find /home/dave/Documents -name '*sas*' | xargs grep '[Pp][Rr][Oo][Cc]' 2> /dev/null 
# find files based on two conditions with the and operator
find /home/dave/Documents -name '*sas*' and -size +10
# view the users logged into psuedoterminals (pts)
who | grep 'pts'
# Create a new file called young and enter the text the "the night is young"
vim young
# find and replace with the ed text editor (, is all lines, s is find and replace, w is write, \n newline, q quit)
printf ",s/echo/pr\nw\nq\n" | ed bashbang2.bash
# Find and replace the word night with day and save the file as youngday
sed 's/night/day/' young>youngday
# This outputs the word "Sunnight Monday"
echo Sunday Monday | sed 's/day/night/'
# Find and replace all with the "g" for global at the end of the command "Sunnight Monnight"
echo Sunday Monday | sed 's/day/night/g'
# Enter the following text into a file named sample1
one	1
two	1
three	1
one 	1
two	1
two	1
three	1
# Replace "1" with "2", but only after the word two
sed '/two/ s/1/2/' sample1>sample2
# find and replace 1 with 2 on only the fifth and sixth lines
sed '5,6 s/1/2/' sample1>sample2
# print out only lines 3 to 6
sed -n '3,6p' sample1
# delete all lines containing the word "two"
sed '/two/ d' sample1>sample2
# delete everything from line 2 up until the end
sed '2,/^$/ d' sample1>sample2
# delete all lines except for ones that contain the phrase "two"
sed '/two/ !d' sample1>sample2
cat sample2
# variable substitution - print the tail of the cwd (only the current folder)
tail=${PWD##*/}
echo $tail
# Arithmetic Expressions in Bash
typeset -i i=8#120
echo $i
i=50
echo $i
(( i = 16#a5 + 16#120 ))
echo $i
################################################################################################################
# AIX Specific Commands
#     		From the Unix Rosetta Stone at http://bhami.com/rosetta.html
# AIX Version 7.1 Differences Guide http://www.redbooks.ibm.com/redbooks/pdfs/sg247910.pdf
# ls - the List Segments Command
# list user account attributes - executable located at /usr/sbin/lsuser
lsuser -c -a home djanusz
# list user account attributes in stanza form
lsuser -f djanusz
# list device attributes
lsattr -E -l sys0
# list the system configuration and vital product data (VPD)
lscfg -vps | less
# list system devices and their characteristics
lsdev
# displays information about a physical volume within a volume group.
lspv
# list information about the sas02lv
lslv sas02lv
# list the status of a subsystem, a group of subsystems, or a subserver
lssrc -h lakrsaspr0 -a
# list the status of the tcpip subsystem group, enter:
lssrc  -g tcpip
# list paging space commnad to check the swap space
lsps -a
# list filesystems
lsfs
# list records from the audit log.
lsaudrec
# list installed software products
lslpp -w
# display information about installed filesets on my system
lspp -l
# list the fileset that owns all file names that contain teradata
lslpp -w "*teradata*"
# display information about a volume group
lsvg
# list all characteristics of the rootvg
lsvg rootvg
# AIX - System and Process Commands
# 	http://publibn.boulder.ibm.com/doc_link/en_US/a_doc_lib/aixuser/usrosdev/usrosdev.pdf
#	http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp
# print the system configuration information - system model, processors, cpu type
prtconf -svLm
# version, release and maintenance level of AIX (also try lslpp -h bos.rte)
oslevel -r
# find the fileset for the vmstat binary
which_fileset vmstat
# installs filesets associated with keywords or fixes.
instfix -i
# configures or displays network interface parameters for a network using TCP/IP
ifconfig -a
# the ip address
host lakrsaspr0
# display routing table information for an Internet interface
netstat -r -f inet
# display interface information for an Internet interface
netstat -i -f inet
# reports virtual memory statistics
vmstat
# show ethernet device driver and device statistics for the en1 device
entstat -d en1
# captures and analyzes a snapshot of virtual memory
svmon -Pgt 3
# displays statistical information about the Network File System (NFS) and Remote Procedure Call (RPC) calls
nfsstat -r 
# display information about the number of RPC and NFS calls received and rejected by the server
nfsstat -s
# Collects and displays performance statistics for all logical processors in the system
mpstat
# reports logical partition (LPAR) related information and statistics.
lparstat
# To get the information about the partition
lparstat -i
# To get statistics about the shared memory pool and the I/O memory entitlement of the partition
lparstat -m
# get statistics about I/O memory pools inside the LPAR
lparstat -me
# topas - the Top Resource Usage Monitor - /usr/bin/topas contains the topas command
# reports selected local and remote system statistics (run the program with the default options)
topas
# go directly to the topas Workload Partitions (WPAR) mode
topas -@
# display the ten most active processes
topas -p10 -n0 -d0 -f0
# go directly to system processes
topas -P
# go directly to the disk metric display
topas -D
# go directly to the file system display
topas -F
# go to the shared Ethernet adapter on the VIO Server Panel
topas -E
# information and process information
topas -i5 -n0 -p0 -w0 -f0
# interactive commands - topas_nmon
topas_nmon
# interactive commands - system management interface tool
smit
############################################################################################################
# Linux System Status and Utilities to Manage Processes
ps #report a snapshot of the current processes
ps -aux | sort -r -k 3 #sort processes by most to least cpu usage
nohup #run a command immune to hang-ups, with output to a non-tty
tty #print the file name of the terminal connected to standard output
stty #changes terminal settings
fg #send a job to the foreground
bg #send a job to the background
kill #send a signal to a process
kill -9 PID #forcefull SIGKILL 
kill -l #list all of the signals you can send with kill
jobs #view running or stopped jobs associated with your terminal
top #display Linux tasks
ln #make links between files
df #report file system disk space usage
du #estimate file space usage
free #display amount of free and used memory in the system
pstree #show parent-child process relationships
uptime #display the status of the system, how long the system has been up
sleep #deliberately slow down or pause command line
crontab #schedule a periodic process
at #schedule a process for just one execution
#############################################################################################################
#!/bin/bash
# Program Name: case_menu.bash
# Description: Presents the user with a menu to do some tasks
# Usage: bash case_menu.bash
leave=no
while [ $leave = no ]; do
  sleep 7; clear; echo
  echo "$LOGNAME's menu"; echo
  echo "a- Display today's date and time."
  echo "b- Display current working directory."
  echo "c- Display who is logged on and the contents of /home."
  echo "d- Display disk usage." 
  echo "e- Display environment variables."
  echo "l- Display files sorted by most recent date modified"
  echo "p- Display processes sorted by CPU % usage"
  echo "t- Display the process tree"
  echo "x- Exit."
  echo "z- Check for Zombie (Z) processes."
  echo -n "Please enter your selection $LOGNAME: "
  read selection; echo
  case $selection in
    a|A)
            echo -n "The date and time is: "; date;;
    b|B)
      	    echo -n "Your current working directory is: "
      	    pwd ;;
    c|C) 
	    echo -n "Who is logged on: "
	    who;
	    echo -n "The home directory has the following folder: "
	    cd /home;
	    ls;;
    d|D) 
	    echo -n "Disk usage for $PWD:"
	    echo
	    du;
	    echo
	    echo "File system usage: "
	    echo;
	    df -k;;
    e|E)
            echo -n "Environment variables: "
	    env;;
    l|L) 
	    echo -n "Files sorted by most recent date modified:";
	    ls -alt;;
    p|P) 
	    echo -n "Processes sorted by most strenuous on the CPU: ";
	    ps -aux | sort -r -k 3 | less;;
    t|T)
	    echo -n "The process tree: ";
	    pstree;;
    x|X)
      leave=yes;;
    z|Z)
	    echo "The type of processes: "
	    ps -o pid,s,comm;;
    *)
    echo "Your choice was not understood. Try again!"
  esac
done
###########################################################################################################
#!/bin/bash
# Program Name: chmod.bash
# Description: changes all files in the cwd to rwxrwxrwx
# Usage: bash chmod.bash
IFS=$'\n'
for file in $(find $PWD); do
        chmod 777 "$file"
done   
###########################################################################################################
#!/bin/bash
# Program Name: grep3.bash
# Description: Search for a phrase in a directory and it's subdirectories
# Usage: bash grep3.bash /searchPath "pattern" /outputFile
dir=$1
pat=$2
outFile=$3
cnt=0
getlist()
{
	IFS=$'\n'
	for file in $(find $dir); do
		if [ -f "$file" ]
		then
			echo "$file  IS A FILE"
			if [ -r "$file" ]
			then 
				grep -in $pat "$file"
				if [ $? -eq 0 ]
				then
					let cnt++
					echo 
					echo "$cnt: $file CONTAINS THE PATTERN $pat" >> $outFile
				fi
			fi
		elif [ -d "$file" ]
		then
			echo "$file IS A DIRECTORY"
		elif [ -e "$file" ] 
		then
			echo "$file EXISTS"
		else
			echo "$file HAS UNKNOWN TYPE"
		fi
	done
}
getlist
echo
echo "Done sending the file type to stdout and creating the output file $outFile that contains the list of files with the pattern $pat"


##########################################################################################################
#!/bin/bash
#Description: count files in a directory
dir=$1
numFiles=$( ls -l $dir | grep ^- | wc -l )
echo Number of files: $numFiles
numDirs=$( ls -l $dir  | grep ^d | wc -l )
echo Number of dirs: $numDirs
numLnks=$( ls -l $dir | grep ^l | wc -l )
echo Number of Links: $numLnks
#let Total=$numFiles+$numDirs+numLnks
(( Total = numFiles+numDirs+numLnks ))
echo Total Items: $Total
echo first Arg: $1
echo second Arg: $2
echo third Arg: $3
###################################################################################################################
#!/bin/bash
#bashbang.bash - word count of files in a directory
#Usage:   bash<bashbang.bash
for c in $(ls -a); do
  if [ -f $c ]
  then
    #let numFile+=1
    (( numFiles += 1 ))
    numLines=$( wc -l < $c )
    echo File: $c has $numLines lines
else
    if [ -d $c ]
    then
      (( numDirs = numDirs +1 ))
      ls -l $c
else
    if [ -l $c ]
    then
      let numLnks+=1
      echo Link: $c
    else
      echo $c is not a File, dir or link
      let numUnks+=1
    fi
  fi
fi
done
echo Number of files: $numFiles
echo Number of directories: $numDirs
echo Number of links: $numLnks
((TotalNum= numFiles + numDirs + numLnks + numUnks))
echo Total number of files and folders: $TotalNum
#Exploring the UNIX Version 7 Manual
# Commands- cat (catenate & print), ls (list segments), cd (change directory), cc (C compiler),
#           pwd (print working directory), sh (shell), chmod (change mode),             
#           cp (copy), df (disk free), diff (differential file comparator), du (disk usage)
#           echo (echo args), env (environment variables), 
# using the bc language for calcuations
echo "scale=10;sqrt(10)" | bc
# converting decimal (input base) to binary (output base) for the number 21
echo 'obase=2;ibase=10;21' | bc
# Euler's number
echo 'e(1)' | bc -l
# Euler's constant - exp(1), exp(2),....,exp(10)
echo 'scale = 20
      define exp(x){
      auto a, b, c, i, s
      a = 1
      b = 1
      s = 1
      for(i=1; 1==1; i++){
	a = a*x
	b = b*i
	c = a/b
	if(c == 0) return(s)
	s = s+c
	}
      }	
for(i=1; i<=10; i++) exp(i)' | bc -l
# sqrt((12+(-3)^4)/11)-22
echo '12 _3 4 ^ + 11 / v 22 - p' | dc
# print prime numbers with the dc (Reverse Polish Notation)
 echo '2p3p[dl!d2+s!%0=@l!l^!<#]s#[s/0ds^]s@[p]s&[ddvs^3s!l#x0<&2+l.x]ds.x'| dc
# change mode - denies write permission to others
chmod o-w bashbang.bash
# make the file executable 
chmod +x bashbang.bash
# copy the bashbang.bash file into a second file and then compare them with cmp (simalar to comm, diff, uniq)
cp bashbang.bash bashbang2.bash
# compare the files
cmp -s bashbang.bash bashbang2.bash
# view the exit status (the exit status should be 0 as the files compared are the exact same)
echo $?
# view the exit status of true
true    # The "true" builtin.
echo "exit status of \"true\" = $?"     # 0
# view the exit status of false
! true
echo "exit status of \"! true\" = $?"   # 1
# view the exit status of an error
lsfcukthis
echo "exit status of \"lsfcukthis\" = $?"   # 127 (command not found)
# view the exit status of another type of error
ls -z
echo "exit status of \"ls -z\" = $?"  #2 (misuse of shell built-ins)
# date can be used to view the date, or to set the date
date
# dd command to convert and copy files - create a file with 100 random bytes using the kernels random driver
dd if=/dev/urandom of=myrandom bs=100 count=1
# convert the bashang.bash file to uppercase 
dd if=bashbang.bash of=bashbangUp.bash conv=ucase
# view the file and see that it is all uppercase letters now
cat bashbangUp.bash
############################################################################################################
# The Bash Shell - input/output, redirection, wildcard characters, shell variables to customize the env,
#                  shell functions for modularizing tasks, job control, command history, integer arithmetic,
#                  arrays, aliasing, built-in commands, loops and conditional execution. 
# Bash Documentation - http://www.gnu.org/software/bash/
############################################################################################################
# functions in bash - word count of filenames
function fcount {
ls | wc -l
}
fcount
############################################################################################################
#!/bin/bash
#Description: an example of conditional execution with Bash
#             type sudo su to become the superuser
if [ `whoami` = "root" ]
then
        echo "You are the superuser"
elif [ "$USER" = "root" ]
then
        echo "You might be the superuser"
else
read -p "How much money do you got?" bribe
        if [ $bribe -gt 10000 ]
        then
                echo "You can pay to be the superuser"
        else
                echo "You are just an ordinary dude."
        fi
fi
############################################################################################################
#!/bin/bash
#Descrition: script to print the size of a file if it is smaller than 9000 B
read -p "Give a filename in the cwd: " FILENAME
SIZE=$(du -sb $FILENAME | awk '{ print $1 }')
if ((SIZE<1000000)); then
    echo $SIZE;
else
    echo "File greater than 1 MB file";
fi
################################################################################################################
#!/bin/bash
#Description: a short list of my hobbies
echo "The things that I like to do include: "
for myhobbies in smoking, drinking, programming, rapping
do
        echo $myhobbies
done
############################################################################################################
#!/bin/bash
#Description: Inputs a list and prints it out (save your list of hobbies in a file called myhob in the cwd)
echo "My full list of hobbies includes: "
for hob in `cat myhob`
do
        echo $hob
done
################################################################################################################
#!/bin/bash
# Description: Write a shell script whose single command line argument is a file. If you run the
#              program with an ordinary file, the program displays the owner’s name and last
#              update time for the file.
echo "Enter a filename: "
read filename
test -z "$filename"
echo $?
test -f "$filename" 
echo $?
echo
if [ -f "$filename" ];then
  echo “The owner and last update time for $filename is “
  ls -l "$filename" | tr -s ' ' | cut -d' ' -f3,8
elif [ -z "$filename" ];then
  echo "You didn't enter anything"
else
  echo “$filename is not an ordinary file”
fi
###########################################################################################################
#!/bin/bash
#Description: reports the files and directories in the cwd
for x in $( ls -a ); do
if [ -f $x ] 
then
	NUMOFLINES=$(wc -l < $x)
	echo "File: $x, it has: $NUMOFLINES lines"
else
	if [ -d $x ]
	then
		echo "Directory: $x."
	else
		echo "This is neither a file nor a directory!:  $x."
	fi
fi
done
#################################################################################################################
#!/bin/bash
#Description: prompt the user to enter a number and use that number to calculate the factorial of 
#             the number that the user entered and then output the result to stdout.
echo "Enter a number"
read num
number=$num
fact=1
while [ $num -ge 1 ]
do
  fact=$(expr $fact \* $num)
  num=$(expr $num - 1)
done
echo "The factorial of $number is $fact"
##############################################################################################################
#! /bin/bash
# blank-rename.sh
# Replaces blanks with underscores in all the filenamis in the current directory.
ONE=1                     # For getting singular/plural right (see below).
number=0                  # Keeps track of how many files actually renamed.
FOUND=0                   # Successful return value.
curdir=$(pwd)
echo "Replacing blanks with underscores in $curdir." 
for filename in *             #Traverse all files in directory.
do
     echo "$filename" | grep -q " "         #  Check whether filename
     if [ $? -eq $FOUND ]                   #  contains space(s).
     then
       fname=$filename                      # Yes, this filename needs work.
       n=`echo $fname | sed -e "s/ /_/g"`   # Substitute underscore for blank.
       mv "$fname" "$n"                     # Do the actual renaming.
       let "number += 1"
     fi
done   
if [ "$number" -eq "$ONE" ]             
then
 echo "$number file renamed."
else 
 echo "$number files renamed."
fi 
exit 0
###########################################################################################################
#!/bin/bash
# Description: Number of days between two dates.
# Usage: ./daysbtw.bash [M]M/[D]D/YYYY [M]M/[D]D/YYYY
#        for example, use the command
#        $ bash daysbtw.bash 10/10/2010 10/10/2014
ARGS=2                # Two command-line parameters expected.
E_PARAM_ERR=85        # Param error.
REFYR=1600            # Reference year.
CENTURY=100
DIY=365
ADJ_DIY=367           # Adjusted for leap year + fraction.
MIY=12
DIM=31
LEAPCYCLE=4
MAXRETVAL=255         #  Largest permissible                      
diff=                 # Declare global variable for date difference.
value=                # Declare global variable for absolute value.
day=                  # Declare globals for day, month, year.
month=
year=
Param_Error ()        # Command-line parameters wrong.
{
  echo "Usage: `basename $0` [M]M/[D]D/YYYY [M]M/[D]D/YYYY"
  echo "       (date must be after 1/3/1600)"
  exit $E_PARAM_ERR
}  
Parse_Date ()                 # Parse date from command-line params.
{
  month=${1%%/**}
  dm=${1%/**}                 # Day and month.
  day=${dm#*/}
  let "year = `basename $1`"  # Not a filename, but works just the same.
}  
check_date ()                 # Checks for invalid date(s) passed.
{
  [ "$day" -gt "$DIM" ] || [ "$month" -gt "$MIY" ] ||
  [ "$year" -lt "$REFYR" ] && Param_Error
  # Exit script on bad value(s).
  # Uses or-list / and-list.
  #
  # Exercise: Implement more rigorous date checking.
}
strip_leading_zero () #  Better to strip possible leading zero(s)
{                     #+ from day and/or month
  return ${1#0}       #+ since otherwise Bash will interpret them
}                     #+ as octal values (POSIX.2, sect 2.9.2.1).

day_index ()          # Gauss' Formula:
{                     # Days from March 1, 1600 to date passed as param.
                      #           ^^^^^^^^^^^^^
  day=$1
  month=$2
  year=$3
  let "month = $month - 2"
  if [ "$month" -le 0 ]
  then
    let "month += 12"
    let "year -= 1"
  fi  
  let "year -= $REFYR"
  let "indexyr = $year / $CENTURY"
  let "Days = $DIY*$year + $year/$LEAPCYCLE - $indexyr \
              + $indexyr/$LEAPCYCLE + $ADJ_DIY*$month/$MIY + $day - $DIM"
  echo $Days

}  
calculate_difference ()            # Difference between two day indices.
{
  let "diff = $1 - $2"             # Global variable.
}  

abs ()                             #  Absolute value
{                                  #  Uses global "value" variable.
  if [ "$1" -lt 0 ]                #  If negative
  then                             #+ then
    let "value = 0 - $1"           #+ change sign,
  else                             #+ else
    let "value = $1"               #+ leave it alone.
  fi
}

if [ $# -ne "$ARGS" ]              # Require two command-line params.
then
  Param_Error
fi  
Parse_Date $1
check_date $day $month $year       #  See if valid date.
strip_leading_zero $day            #  Remove any leading zeroes
day=$?                             #+ on day and/or month.
strip_leading_zero $month
month=$?
let "date1 = `day_index $day $month $year`"
Parse_Date $2
check_date $day $month $year
strip_leading_zero $day
day=$?
strip_leading_zero $month
month=$?
date2=$(day_index $day $month $year) # Command substitution.
calculate_difference $date1 $date2
abs $diff                            # Make sure it's positive.
diff=$value
echo $diff
exit 0
##############################################################################################################
#!/bin/bash
# mkdict.bash  [make dictionary]
# Modification of /usr/sbin/mkdict (/usr/sbin/cracklib-forman) script.
# Original script copyright 1993, by Alec Muffett.
# Description:  This script processes text files to produce a sorted list of words found in the files.
# Example of Usage :  $ bash mkdict.bash filetoprocess.txt > savetofile.txt
E_BADARGS=85
if [ ! -r "$1" ]                    #  Need at least one
then                                #+ valid file argument.
  echo "Usage: $0 files-to-process"
  exit $E_BADARGS
fi  
cat $* |                            #  Dump specified files to stdout.
        tr A-Z a-z |                #  Convert to lowercase.
        tr ' ' '\012' |             #  New: change spaces to newlines.
#       tr -cd '\012[a-z][0-9]' |   #  Get rid of everything
                                    #+ non-alphanumeric (in orig. script).
        tr -c '\012a-z'  '\012' |   #  Rather than deleting non-alpha
                                    #+ chars, change them to newlines.
        sort |                      #  $SORT options unnecessary now.
        uniq |                      #  Remove duplicates.
        grep -v '^#' |              #  Delete lines starting with #.
        grep -v '^$'                #  Delete blank lines.

exit $?
###########################################################################################################
#!/bin/bash
#  Description: Random password generator for Bash 2.x
# Usage: bash passgen.bash
MATRIX="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
# ==> Password will consist of alphanumeric characters.
LENGTH="8"
# ==> May change 'LENGTH' for longer password.
while [ "${n:=1}" -le "$LENGTH" ]
# ==> Recall that := is "default substitution" operator.
# ==> So, if 'n' has not been initialized, set it to 1.
do
	PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
	# ==> Starting from the innermost nesting...
	# ==> ${#MATRIX} returns length of array MATRIX.
	# ==> $RANDOM%${#MATRIX} returns random number between 1
	# ==> and [length of MATRIX] - 1.
	# ==> ${MATRIX:$(($RANDOM%${#MATRIX})):1}
	# ==> returns expansion of MATRIX at random position, by length 1. 
	# ==> See {var:pos:len} parameter substitution in Chapter 9.
	# ==> and the associated examples.
	# ==> PASS=... simply pastes this result onto previous PASS (concatenation).
	# ==> To visualize this more clearly, uncomment the following line
	#                 echo "$PASS"
	# ==> to see PASS being built up,
	# ==> one character at a time, each iteration of the loop.
	let n+=1
	# ==> Increment 'n' for next pass.
done
echo "$PASS"      # ==> Or, redirect to a file, as desired.
exit 0
#######################################################################################################
#!/bin/bash
# sd.bash: Calculates the Standard Deviation of a one-column text file of numbers
# =========================================================== #
count=0         # Number of data points; global.
SC=9            # Scale to be used by bc. Nine decimal places.
E_DATAFILE=90   # Data file error.
# ----------------- Set data file ---------------------
if [ ! -z "$1" ]  # Specify filename as cmd-line arg?
then
  datafile="$1" #  ASCII text file,
else            #+ one (numerical) data point per line!
  datafile=sample.dat
fi              #  See example data file, below.

if [ ! -e "$datafile" ]
then
  echo "\""$datafile"\" does not exist!"
  exit $E_DATAFILE
fi
# -----------------------------------------------------
arith_mean ()
{
  local rt=0         # Running total.
  local am=0         # Arithmetic mean.
  local ct=0         # Number of data points.
  while read value   # Read one data point at a time.
  do
    rt=$(echo "scale=$SC; $rt + $value" | bc)
    (( ct++ ))
  done
  am=$(echo "scale=$SC; $rt / $ct" | bc)
  echo $am; return $ct   # This function "returns" TWO values!
} <"$datafile"   # Feed in data file.
sd ()
{
  mean1=$1  # Arithmetic mean (passed to function).
  n=$2      # How many data points.
  sum2=0    # Sum of squared differences ("variance").
  avg2=0    # Average of $sum2.
  sdev=0    # Standard Deviation.
  while read value   # Read one line at a time.
  do
    diff=$(echo "scale=$SC; $mean1 - $value" | bc)
    # Difference between arith. mean and data point.
    dif2=$(echo "scale=$SC; $diff * $diff" | bc) # Squared.
    sum2=$(echo "scale=$SC; $sum2 + $dif2" | bc) # Sum of squares.
  done
    avg2=$(echo "scale=$SC; $sum2 / $n" | bc)  # Avg. of sum of squares.
    sdev=$(echo "scale=$SC; sqrt($avg2)" | bc) # Square root =
    echo $sdev                                 # Standard Deviation.
} <"$datafile"   # Rewinds data file.
# ======================================================= #
mean=$(arith_mean); count=$?   # Two returns from function!
std_dev=$(sd $mean $count)
echo
echo "Number of data points in \""$datafile"\" = $count"
echo "Arithmetic mean (average) = $mean"
echo "Standard Deviation = $std_dev"
echo
# ======================================================= #
exit
#  This script could stand some drastic streamlining,
# but not at the cost of reduced legibility, please.
# ++++++++++++++++++++++++++++++++++++++++ #
# A sample data file (sample.dat):
# 18.35
# 19.0
# 18.88
# 18.91
# 18.64bv
# $ bash sd.bash sample.dat
# Number of data points in "sample.dat" = 5
# Arithmetic mean (average) = 18.756000000
# Standard Deviation = .235338054
# ++++++++++++++++++++++++++++++++++++++++ #
###########################################################################################################
#!/bin/bash
# colors.bash
# Displays all 256 possible background colors, using ANSI escape sequences.
# Author: Chetankumar Phulpagare
# Used in ABS Guide with permission.
T1=8
T2=6
T3=36
offset=0
for num1 in {0..7}
do {
   for num2 in {0,1}
       do {
          shownum=`echo "$offset + $T1 * ${num2} + $num1" | bc`
          echo -en "\E[0;48;5;${shownum}m color ${shownum} \E[0m"
          }
       done
   echo
   }
done
offset=16
for num1 in {0..5}
do {
   for num2 in {0..5}
       do {
          for num3 in {0..5}
              do {
                 shownum=`echo "$offset + $T2 * ${num3} \
                 + $num2 + $T3 * ${num1}" | bc`
                 echo -en "\E[0;48;5;${shownum}m color ${shownum} \E[0m"
                 }
               done
          echo
          }
       done
}
done
offset=232
for num1 in {0..23}
do {
   shownum=`expr $offset + $num1`
   echo -en "\E[0;48;5;${shownum}m ${shownum}\E[0m"
}
done
echo
#############################################################################################################
#!/bin/bash
# bingo.bash
# Bingo number generator
# Reldate 20Aug12, License: Public Domain
############################################################################################################
# This script generates bingo numbers.
# Hitting a key generates a new number.
# Hitting 'q' terminates the script.
# In a given run of the script, there will be no duplicate numbers.
# When the script terminates, it prints a log of the numbers generated.
# ############################################################################################################
MIN=1       # Lowest allowable bingo number.
MAX=75      # Highest allowable bingo number.
COLS=15     # Numbers in each column (B I N G O).
SINGLE_DIGIT_MAX=9
declare -a Numbers
Prefix=(B I N G O)
initialize_Numbers ()
{  # Zero them out to start.
   # They'll be incremented if chosen.
   local index=0
   until [ "$index" -gt $MAX ]
   do
     Numbers[index]=0
     ((index++))
   done
   Numbers[0]=1   # Flag zero, so it won't be selected.
}
generate_number ()
{
   local number
   while [ 1 ]
   do
     let "number = $(expr $RANDOM % $MAX)"
     if [ ${Numbers[number]} -eq 0 ]    # Number not yet called.
     then
       let "Numbers[number]+=1"         # Flag it in the array.
       break                            # And terminate loop.
     fi   # Else if already called, loop and generate another number.
   done
   # Exercise: Rewrite this more elegantly as an until-loop.
   return $number
}
print_numbers_called ()
{   # Print out the called number log in neat columns.
    # echo ${Numbers[@]}
local pre2=0                #  Prefix a zero, so columns will align
                            #+ on single-digit numbers.
echo "Number Stats"
for (( index=1; index<=MAX; index++))
do
  count=${Numbers[index]}
  let "t = $index - 1"      # Normalize, since array begins with index 0.
  let "column = $(expr $t / $COLS)"
  pre=${Prefix[column]}
# echo -n "${Prefix[column]} "
if [ $(expr $t % $COLS) -eq 0 ]
then
  echo   # Newline at end of row.
fi
  if [ "$index" -gt $SINGLE_DIGIT_MAX ]  # Check for single-digit number.
  then
    echo -n "$pre$index#$count "
  else    # Prefix a zero.
    echo -n "$pre$pre2$index#$count "
  fi
done
}
# main () {
RANDOM=$$   # Seed random number generator.
initialize_Numbers   # Zero out the number tracking array.
clear
echo "Bingo Number Caller"; echo
while [[ "$key" != "q" ]]   # Main loop.
do
  read -s -n1 -p "Hit a key for the next number [q to exit] " key
  # Usually 'q' exits, but not always.
  # Can always hit Ctl-C if q fails.
  echo
  generate_number; new_number=$?
  let "column = $(expr $new_number / $COLS)"
  echo -n "${Prefix[column]} "   # B-I-N-G-O
  echo $new_number
done
echo; echo
# Game over ...
print_numbers_called
echo; echo "[#0 = not called . . . #1 = called]"
echo
exit 0
# }
###########################################################################################################
#!/bin/bash
#  assoicarry.bash
#  Benchmark test script to compare execution times of
#  numeric-indexed array vs. associative array.
#     Thank you, Erik Brandsberg.
count=10000       # May take a while for some of the tests below.
declare simple     # Can change to 20000, if desired.
declare -a array1
declare -A array2
declare -a array3
declare -A array4
echo "===Assignment tests==="
echo
echo "Assigning a simple variable:"
# References $i twice to equalize lookup times.
time for (( i=0; i< $count; i++)); do
        simple=$i$i
done
echo "---"
echo "Assigning a numeric index array entry:"
time for (( i=0; i< $count; i++)); do
        array1[$i]=$i
done
echo "---"
echo "Overwriting a numeric index array entry:"
time for (( i=0; i< $count; i++)); do
        array1[$i]=$i
done
echo "---"
echo "Linear reading of numeric index array:"
time for (( i=0; i< $count; i++)); do
        simple=array1[$i]
done
echo "---"
echo "Assigning an associative array entry:"
time for (( i=0; i< $count; i++)); do
        array2[$i]=$i
done
echo "---"
echo "Overwriting an associative array entry:"
time for (( i=0; i< $count; i++)); do
        array2[$i]=$i
done
echo "---"
echo "Linear reading an associative array entry:"
time for (( i=0; i< $count; i++)); do
        simple=array2[$i]
done
echo "---"
echo "Assigning a random number to a simple variable:"
time for (( i=0; i< $count; i++)); do
        simple=$RANDOM
done
echo "---"
echo "Assign a sparse numeric index array entry randomly into 64k cells:"
time for (( i=0; i< $count; i++)); do
        array3[$RANDOM]=$i
done
echo "---"
echo "Reading sparse numeric index array entry:"
time for value in "${array3[@]}"i; do
        simple=$value
done
echo "---"
echo "Assigning a sparse associative array entry randomly into 64k cells:"
time for (( i=0; i< $count; i++)); do
        array4[$RANDOM]=$i
done
echo "---"
echo "Reading sparse associative index array entry:"
time for value in "${array4[@]}"; do
        simple=$value
done
exit $?
#############################################################################################################
#!/bin/bash
# stockqt.bash: Download a stock quote.
read -p "Provide a ticker symbol: " tick
E_NOPARAMS=86
stock_symbol=$1
file_suffix=.html
# Fetches an HTML file.
URL="http://finance.yahoo.com/q?s=$tick"
# Yahoo finance board, with stock query suffix.
# -----------------------------------------------------------
wget -i ${stock_symbol}${file_suffix} "${URL}${stock_symbol}"
# -----------------------------------------------------------
exit $?
#############################################################################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi  

PS1="\$PWD (\w) \$ >"
alias open='kde-open'

