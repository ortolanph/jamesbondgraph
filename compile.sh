#!/bin/bash

PNG_FORMAT="png"
SVG_FORMAT="svg"

function syntax() {
    echo "compile.sh <FORMAT>"
    echo ""
    echo "Where format is 'png' or 'svg'."
    exit
}

function message() {
    echo "[compile][$1]"
}

function checkParameters() {
    message "Checking parameters"
    if [ $# -eq 0 ] ; then
        syntax
    fi
}

function compile() {
    message "Compiling"
    declare -a GRAPHS=($(ls | grep '.dot' ))

    for GRAPH in "${GRAPHS[@]}"
    do
        BASE_NAME=$(basename "$GRAPH")

        FINAL_NAME="${BASE_NAME%.*}.$1"
        
        if [ -e $FINAL_NAME ]; then
            rm $FINAL_NAME
        fi

        message "Compiling $GRAPH to $FINAL_NAME"
        dot $GRAPH -T$1 -o $FINAL_NAME
        :
    done
}

checkParameters $1

compile $1  