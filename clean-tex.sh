#!/bin/bash  
function foreachdir(){
		cd "$1"
		echo "$1"
        mv *.aux *.xwm *.out *.thm *.nav *.toc *.snm *.log *.blg *.bbl *.fls *.fdb_latexmk *.synctex.gz $DEST_PATH   
        for file in  "$1"/*; 
        do  
                if [ -d "$file" ]; 
                then
                	#echo "$file"   
                    foreachdir "$file"   
                fi  
        done  
}  
INIT_PATH="/Users/yuchen/Documents/"
DEST_PATH="/Users/yuchen/Desktop/Crabs"
mkdir $DEST_PATH  
foreachdir $INIT_PATH 