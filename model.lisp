(cl:in-package #:clim-demo-adventure)

(defgeneric show (thing stream))

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

(defun bucket ()
  (make-instance 'bucket))

(defmethod show ((object bucket) stream)
  (format stream "a bucket"))

;;; A PEN is another type of object.
(defclass pen (object)
  ())

(defun pen ()
  (make-instance 'pen))

(defmethod show ((object pen) stream)
  (format stream "a pen"))

;;; An ERASOR is another type of object.
(defclass erasor (object)
  ())

(defun erasor ()
  (make-instance 'erasor))

(defmethod show ((object erasor) stream)
  (format stream "an erasor"))

;;; A NOTBOOK is another type of object.
(defclass notebook (object)
  ())

(defun notebook ()
  (make-instance 'notebook))

(defmethod show ((object notebook) stream)
  (format stream "a notebook"))

(defclass player ()
  ((%objects :initarg :objects :reader objects)))
