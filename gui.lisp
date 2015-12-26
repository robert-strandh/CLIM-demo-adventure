(cl:in-package #:clim-demo-adventure-gui)

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

(defun display-application (frame pane)
  (loop for place in (reverse (visited-places frame))
	do (clim-demo-adventure::show place pane)
	   (format pane "-----~%"))
  (finish-output pane))
