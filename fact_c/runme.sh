swig -cffi -module libfact fact.i
gcc -shared fact.c -o libfact.dylib
cp libfact.dylib /usr/local/lib/
ros run -l fact.lisp