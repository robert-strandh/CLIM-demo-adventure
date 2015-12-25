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

(defmethod show ((place place) stream)
  (format stream "You are in a place.~%")
  (case (length (objects place))
    (0
     (format stream
	     "It currently contains no objects.~%"))
    (1
     (format stream "It contains a single object: ")
     (show (first (objects place)) stream)
     (format stream ".~%"))
    (t
     (format stream "It contains ~d objects: " (length (objects place)))
     (loop for object in (butlast (objects place))
	   do (show object stream)
	      (format stream ", and "))
     (show (first (last (objects place))) stream)
     (format stream ".~%")))
  (format stream "You can go the following directions: ")
  (loop for direction in (butlast (directions place))
	do (show direction stream)
	   (format stream ", or "))
  (show (first (last (directions place))) stream)
  (format stream ".~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Classes for objects that can be contained in places or kept by
;;; players.

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class PLAYER.

(defclass player ()
  ((%objects :initarg :objects :reader objects)))
