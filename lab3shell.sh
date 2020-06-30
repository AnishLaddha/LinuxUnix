#!/bin/bash
# Ask the user for their name
echo Name?
read name

echo descr?
read descr

echo course
read course

now=`date`


echo "**************************************************************"
echo "*Name: $name                                                 *"
echo "*Description: $descr                                         *"
echo "*Course: $course                                             *"
echo "*Due Date: $now                                              *"
echo "**************************************************************"

