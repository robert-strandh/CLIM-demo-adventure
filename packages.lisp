(cl:in-package #:common-lisp-user)

(defpackage #:clim-demo-adventure
  (:use :common-lisp)
  (:export #:place
	   #:player
	   #:directions
	   #:objects
	   #:name
	   #:make-world))
