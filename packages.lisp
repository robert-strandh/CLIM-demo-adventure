(cl:in-package #:common-lisp-user)

(defpackage #:clim-demo-adventure
  (:use :common-lisp)
  (:export #:place
	   #:directions
	   #:objects
	   #:name
	   #:make-world
	   #:adventure))

(defpackage #:clim-demo-adventure-gui
  (:use :clim-lisp :clim))
