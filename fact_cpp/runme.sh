swig -cffi -c++ -module libfact fact.i
gcc -fpic -c fact.cpp fact_wrap.cxx
gcc -fpic -c fact_wrap.cxx
g++ -std=c++11 -fpic -shared fact.o fact_wrap.o -o libfact.dylib
cp libfact.dylib /usr/local/lib/
ros run -l fact.lisp
