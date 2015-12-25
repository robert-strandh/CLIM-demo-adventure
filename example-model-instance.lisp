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

(reinitialize-instance
 *nw*
 :directions `((,*east* . ,*ne*) (,*south* . ,*sw*)))

(reinitialize-instance
 *ne*
 :directions `((,*west* . ,*nw*) (,*south* . ,*se*)))

(reinitialize-instance
 *sw*
 :directions `((,*east* . ,*se*) (,*north* . ,*nw*)))

(reinitialize-instance
 *se*
 :directions `((,*west* . ,*sw*) (,*north* . ,*ne*)))
