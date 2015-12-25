(cl:in-package #:clim-demo-adventure)

;;; The class that holds an instance of the full model to drive the
;;; game.
(defclass world ()
  ((%places :initarg :places :reader places)))

(defclass place ()
  ((%directions :initarg :directions :reader directions)
   (%objects :initarg :objects :reader objects)))
