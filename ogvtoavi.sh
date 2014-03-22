#!/bin/bash
# This Script Was Created By Yahya Alfayad
# March, 2014 version 1.0
ver=1.0

function print_version {
echo "ogv to avi converter version $ver"
echo "created by Yahya Alfayad"
echo "Mrach, 2014"
}

# print how to use massage function
function print_usage_msg {
print_version
echo
echo "usage:"
echo "ogvtoavi <input.ogv> -o <output.avi>"
echo "or"
echo "ogvtoavi <input.ogv>"
}

function convert {
if [ -f $2 ]
then
read -p "$output_file_name already exists, overwrite it [y/N]? " ow
case $ow in
y|Y|yes|YES|Yes) mencoder "$1" -ovc lavc -oac mp3lame -o "$2"
esac
else
mencoder "$1" -ovc lavc -oac mp3lame -o "$2"
fi
exit $?
}
if [ "$1" == "-v" ]
then
print_version
exit 0
fi

# check if input is empty
if [ -z $1 ]
then
print_usage_msg
exit 1
fi

if [ -z $2 ]
then
input_file_name="$1"
output_file_name="${input_file_name%.*}".avi
convert $input_file_name $output_file_name
exit $?
else
if [ "$2" == "-o" ]
then
if [ -z $3 ]
then
print_usage_msg
exit 1
fi
convert $1 $3
exit $?
fi
fi
