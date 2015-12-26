(cl:in-package #:clim-demo-adventure)

(defun make-world ()
  (let ((bucket (make-instance 'bucket))
	(pen (make-instance 'pen))
	(erasor (make-instance 'erasor))
	(notebook (make-instance 'notebook)))
    (let ((nw (make-instance 'place :objects (list bucket pen)))
	  (ne (make-instance 'place :objects (list erasor)))
	  (sw (make-instance 'place :objects (list notebook)))
	  (se (make-instance 'place :objects (list))))
      (reinitialize-instance
       nw :directions `((,"east" . ,ne) (,"south" . ,sw)))
      (reinitialize-instance
       ne :directions `((,"west" . ,nw) (,"south" . ,se)))
      (reinitialize-instance
       sw :directions `((,"east" . ,se) (,"north" . ,nw)))
      (reinitialize-instance
       se :directions `((,"west" . ,sw) (,"north" . ,ne)))
      nw)))
