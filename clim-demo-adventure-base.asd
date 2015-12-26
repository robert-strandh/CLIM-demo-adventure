(cl:in-package #:asdf-user)

(defsystem :clim-demo-adventure-base
  :serial t
  :components
  ((:file "packages")
   (:file "model")
   (:file "example-model-instance")))
