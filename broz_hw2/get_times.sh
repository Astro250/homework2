#!/bin/bash

for file in *.out
 do
   echo  " "
   echo $file 
   cat $file | grep real
 done
