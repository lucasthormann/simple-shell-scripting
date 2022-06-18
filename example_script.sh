#!/bin/bash
echo "
Unix Systems Programming

CS 4350-251

Assignment Number: 3

Due Date: 2/28/2022


The function of this script is to:

   1. List detailed list of all files in your directory. Redirect the output to 
      zlsCommandFiles.txt
   2. Create directory by checking its existence
   3. Test if File Exist.
   4. Create a File
   5. Append \"Learning Scripts and Shell Programming\" to an existing File.
   6. Rename an existing File.
   7. Delete an exisitng File.
   8. Delete an exisitng Directory.
   9. Pare Current Date
   10.Display a calender for a specific month / year
   11. Generate two number and store them in two variables such as A and B.
      The Values of generated numbers are either 0 or 1. Display Boolean
      expression for A and B, A or B, and A xor B

"
in_directory()
{
echo "1. List of all files in this directory:"
ls -alt
ls -alt > zlsCommandFile.txt
}
makedir_exist()
{
echo
read -p "2. Enter directory name to be created (ztest) ----> " dir
if [ -d "$dir" ]
then
	echo
	echo "Directory $dir does exist"
else
	mkdir $dir
fi
}
check_file()
{
echo
read -p "3. Enter file name you want to inspect (zlsCommandFile.txt) ----> " file
if [ -f $file ]
then
	size=$( stat -c %s $file)
	echo
	echo "File size of $file is $size bytes"
	count=0
	while read -n1 character
	do
		count=$((count+1))
	done < $file
	echo
	echo "Number of characters in file is $count"
	echo
	echo "Contents of the file: "
	while read line
	do
		echo $line
	done < $file
else
	echo
	echo "File $file doesn't exist"
fi
}
create_file(){
echo
read -p "4. Enter a the name of file to be created (zNew.txt) ----> " file
touch $file
echo
echo "This is a new file" >> $file
echo "$file does exist"
}
append_text(){
echo
read -p "5. Enter file you would like to append text to (zNew.txt) ----> " file
if [ -f $file ]
then
	echo "
	Contents of file before we append the text: 
	"
	cat $file
	echo "Learning Scripts and Shell Programming" >> $file
	echo "
	Contents of file after we appended the text: 
	"
	cat $file
else
	echo "
	File $file does not exist"
fi
}
rename_file()
{
read -p "
6. Enter file you would like to rename (zNew.txt) ----> " file
if [ -f $file ]
then
	mv $file zNew2.txt
else
	echo "
	File $file does not exist"
fi
}
delete_files(){
read -p "
7. Enter the two files you would like to delete ----> " file1 file2
if [ -f $file1 ]
then
	if [ -f $file2 ]
	then
		rm -rf $file1
		rm -rf $file2
	else
		echo "
		The file $file2 does not exist"
	fi
else
	echo "
	The file $file1 does not exist"
fi
}
delete_dir(){
read -p "
8. Enter the directory you would like to delete ----> " dir
if [ -d "$dir" ]
then
	rm -rf $dir
else
	echo "
	The directory $dir does not exist"
fi
}
parse_date(){
echo "
9. The current date is: "
echo
date +"%m-%d-%Y %T"
}
display_cal(){
read -p "
10. Enter the month (01 - 12) and year you would like to see a calander of ----> " month year
echo
cal $month $year
}
arith(){
A=$(( RANDOM % 2 ))
B=$(( RANDOM % 2 ))
bitwiseAND=$(( A&B ))
bitwiseOR=$(( A|B ))
bitwiseXOR=$(( A^B ))
echo "11. Boolean expression of bitwise arithmetic: "
echo "
$A AND $B = $bitwiseAND"
echo "
$A OR $B = $bitwiseOR"
echo "
$A XOR $B = $bitwiseXOR"
}

in_directory
makedir_exist
check_file
create_file
append_text
rename_file
delete_files
delete_dir
parse_date
display_cal
arith

echo "


Lucas Thormann - 2 - 28 - 2022
"
