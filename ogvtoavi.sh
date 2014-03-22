#!/bin/bash
# This Script Was Created By Yahya Alfayad
# March, 2014

# print how to use massage function
function print_usage_msg {
echo "usage:"
echo "ogvtoavi input.ogv output.avi"
echo "or"
echo "ogvtoavi input.ogv"
}

# check if input is empty
if [ -z $1 ]
then
print_usage_msg
exit 1
fi

if [ -z $2 ]
then
input_file_name="$1"
mencoder $1 -ovc lavc -oac mp3lame -o "${input_file_name%.*}".avi
exit $?
else
if [ "$2" == "-o" ]
then
if [ -z $3 ]
then
print_usage_msg
exit 1
fi
mencoder $1 -ovc lavc -oac mp3lame -o $3
exit $?
fi
fi

