(cl:in-package #:clim-demo-adventure)

(defparameter *north* (make-instance 'north))
(defparameter *south* (make-instance 'south))
(defparameter *east* (make-instance 'east))
(defparameter *west* (make-instance 'west))

(defparameter *bucket* (bucket))
(defparameter *pen* (pen))
(defparameter *erasor* (erasor))
(defparameter *notebook* (notebook))

(defparameter *nw* (make-instance 'place :objects (list *bucket* *pen*)))
(defparameter *ne* (make-instance 'place :objects (list *erasor*)))
(defparameter *sw* (make-instance 'place :objects (list *notebook*)))
(defparameter *se* (make-instance 'place :objects (list)))

(defparameter *w* (make-instance 'world :places (list *nw* *ne* *sw* *se*)))
