#!/bin/bash 
cd "/Users/chenyu/Downloads/南京大学小百合" 
for i in *.php; 
do mv "$i" "${i%php}jpg";
done