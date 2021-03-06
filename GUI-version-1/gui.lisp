(cl:in-package #:clim-demo-adventure-gui-version-1)

(define-application-frame adventure ()
  ((%visited-places :initarg :visited-places :accessor visited-places))
  (:panes
   (text :application
	 :width 800 :height 400
	 :display-function 'display-application
	 :scrollbars t)
   (inter :interactor :width 800 :height 100))
  (:layouts
   (:default (vertically () text inter))))

(defun show-objects (objects stream)
    (case (length objects)
      (0
       (format stream "no objects.~%"))
      (1
       (format stream "a single object: ")
       (format stream "~a" (clim-demo-adventure:name (first objects)))
       (format stream ".~%"))
      (2
       (format stream "two objects: ~a and ~a.~%"
	       (clim-demo-adventure:name (first objects))
	       (clim-demo-adventure:name (second objects))))
      (t
       (format stream "~d objects: " (length objects))
       (loop for object in (rest objects)
	     do (format stream "~a" (clim-demo-adventure:name object))
		(format stream ", and "))
       (format stream "~a" (clim-demo-adventure:name (first objects)))
       (format stream ".~%"))))

(defun show-place (place stream)
  (format stream "You are in a place.~%It contains ")
  (show-objects (clim-demo-adventure:objects place) stream)
  (format stream "You can go the following directions: ")
  (let ((directions (clim-demo-adventure:directions place)))
    (loop for direction in (rest directions)
	  do (format stream "~a" (car direction))
	     (format stream ", or "))
    (format stream "~a" (car (first directions)))
    (format stream ".~%")))

(defun display-application (frame pane)
  (loop for place in (reverse (visited-places frame))
	do (show-place place pane)
	   (format pane "-----~%"))
  (finish-output pane))

(defun adventure ()
  (run-frame-top-level
   (make-application-frame
    'adventure
    :visited-places (list (clim-demo-adventure:make-world)))))

(define-adventure-command (com-quit :name t) ()
  (frame-exit *application-frame*))

(define-presentation-type direction ()
  :inherit-from 'string)

(defun new-place (name directions)
  (cdr (assoc name directions :test #'equal)))

(define-adventure-command (com-go :name t)
    ((direction 'direction))
  (let* ((current-place (first (visited-places *application-frame*)))
	 (possible-directions (clim-demo-adventure:directions current-place))
	 (new-place (new-place direction possible-directions)))
    (if (null new-place)
	(progn (format *standard-input* "You can not go that way!~%")
	       (finish-output))
	(push new-place (visited-places *application-frame*)))))
