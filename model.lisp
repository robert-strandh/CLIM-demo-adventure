(cl:in-package #:clim-demo-adventure)

;;; The class that holds an instance of the full model to drive the
;;; game.
(defclass world ()
  ((%places :initarg :places :reader places)))

;;; This is the base class for all places that can be members of the
;;; set of places of the world.
(defclass place ()
  ((%directions :initarg :directions :reader directions)
   (%objects :initarg :objects :reader objects)))

;;; This is the base class for all objects that can be members of the
;;; set of objects in a place.
(defclass object ()
  ())

;;; A BUCKET is a type of object.
(defclass bucket (object)
  ())

(defmethod print-object ((object bucket) stream)
  (format stream "a bucket"))

;;; A PEN is another type of object.
(defclass pen (object)
  ())

(defmethod print-object ((object pen) stream)
  (format stream "a pen"))

;;; An ERASOR is another type of object.
(defclass erasor (object)
  ())

(defmethod print-object ((object erasor) stream)
  (format stream "an erasor"))

;;; A NOTBOOK is another type of object.
(defclass notebook (object)
  ())

(defmethod print-object ((object notebook) stream)
  (format stream "a notebook"))
