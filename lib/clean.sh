#!/bin/bash

PNG_FORMAT="png"
SVG_FORMAT="svg"

function syntax() {
    echo "delete.sh <FORMAT>"
    echo ""
    echo "Where format is 'png' or 'svg'."
    exit
}

function message() {
    echo "[clean][$1]"
}

function checkParameters() {
    message "Checking parameters"
    if [ $# -eq 0 ]; then
        syntax
    fi
}

function delete() {
    message "Cleaning $1 file format"
    if [ -n "$(ls src/ | grep .$1)" ] ; then 
        rm *.$1
    fi
}

checkParameters $1
delete $1