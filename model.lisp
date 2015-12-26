(cl:in-package #:clim-demo-adventure)

;;; This is the base class for all places that can be members of the
;;; set of places of the world.
(defclass place ()
  ((%directions :initarg :directions :reader directions)
   (%objects :initarg :objects :reader objects)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Classes for objects that can be contained in places or kept by
;;; players.

;;; This is the base class for all objects that can be members of the
;;; set of objects in a place.
(defclass object ()
  ((%name :initform "an unnamed object" :initarg :name :reader name)))

;;; A BUCKET is a type of object.
(defclass bucket (object) () (:default-initargs :name "a bucket"))

;;; A PEN is another type of object.
(defclass pen (object) () (:default-initargs :name "a pen"))

;;; An ERASOR is another type of object.
(defclass erasor (object) () (:default-initargs :name "an erasor"))

;;; A NOTBOOK is another type of object.
(defclass notebook (object) () (:default-initargs :name "a notebook"))
