(ql:quickload :cffi)

(defpackage libfact
  (:use :cl :cffi))
(in-package :libfact)

(cffi:define-foreign-library libfact
    (t (:default "libfact")))
(cffi:use-foreign-library libfact)

(load "libfact.lisp")

(print My_variable)
(terpri)
(print (fact 5))
(terpri)
