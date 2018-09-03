#!/bin/bash

LIBPATH=""
INPUTPATH=""
DEFPATH=""
NAME=""

for i in "$@"
do
    case $i in
        -l=*|--lib=*)
            LIBPATH="${i#*=}"
            shift
            ;;
        -i=*|--input=*)
            INPUTPATH="${i#*=}"
            shift         
            ;;
        -d=*|--definition=*)
            DEFPATH="${i#*=}"
            shift
            ;;
        -n=*|--name=*)
            NAME="${i#*=}"
            shift
            ;;
        *)
            ;;
    esac
done
BASE="${INPUTPATH%.*}"
echo "LIBPATH = ${LIBPATH}"
echo "INPUTPATH = ${INPUTPATH}"
echo "DEFPATH = ${DEFPATH}"
echo "NAME = ${NAME}"
echo "BASE = ${BASE}"
swig -cffi -module ${NAME} ${INPUTPATH}
gcc -shared ${DEFPATH} -o "${NAME}.dylib"
cp "${NAME}.dylib" ${LIBPATH}
echo "Done."
