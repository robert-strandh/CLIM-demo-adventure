(cl:in-package #:clim-demo-adventure)

(defgeneric show (thing stream))

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
	do (format stream "~a" (car direction))
	   (format stream ", or "))
  (format stream "~a" (car (first (last (directions place)))))
  (format stream ".~%"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Classes for objects that can be contained in places or kept by
;;; players.

;;; This is the base class for all objects that can be members of the
;;; set of objects in a place.
(defclass object ()
  ((%name :initform "an unnamed object" :initarg :name :reader name)))

;;; A BUCKET is a type of object.
(defclass bucket (object)
  ())

(defmethod show ((object bucket) stream)
  (format stream "a bucket"))

;;; A PEN is another type of object.
(defclass pen (object)
  ())

(defmethod show ((object pen) stream)
  (format stream "a pen"))

;;; An ERASOR is another type of object.
(defclass erasor (object)
  ())

(defmethod show ((object erasor) stream)
  (format stream "an erasor"))

;;; A NOTBOOK is another type of object.
(defclass notebook (object)
  ())

(defmethod show ((object notebook) stream)
  (format stream "a notebook"))
