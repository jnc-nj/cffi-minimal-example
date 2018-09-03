/* fact.i */
%module fact
%{
  extern double My_variable;
  extern int fact(int n);
  %}
 
extern double My_variable;
extern int fact(int n);
