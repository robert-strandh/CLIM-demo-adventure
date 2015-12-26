(cl:in-package #:asdf-user)

(defsystem :clim-demo-adventure-gui-version-1
  :depends-on (:ciim-demo-adventure)
  :serial t
  :components
  ((:file "packages")
   (:file "gui")))
