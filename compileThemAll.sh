#!/bin/bash

declare -a GRAPHS=($(ls | grep '.dot' ))

for GRAPH in "${GRAPHS[@]}"
do
   BASE_NAME=$(basename "$GRAPH")

   FINAL_NAME="${BASE_NAME%.*}.png"
   
   if [ -e $FINAL_NAME ]; then
   	rm $FINAL_NAME
   fi

   echo "Compiling $GRAPH to $FINAL_NAME"
   dot $GRAPH -Tpng -o $FINAL_NAME
   :
done
