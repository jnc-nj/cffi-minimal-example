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
swig -cffi -c++ -module ${NAME} ${INPUTPATH}
gcc -fpic -c ${DEFPATH} "${BASE}_wrap.cxx"
gcc -c "${BASE}_wrap.cxx"
g++ -std=c++11 -shared "${BASE}.o" "${BASE}_wrap.o" -o "${NAME}.dylib"
cp "${NAME}.dylib" ${LIBPATH}
echo "Done."
