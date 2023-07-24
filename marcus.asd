;;;; marcus.asd

(asdf:defsystem #:marcus
  :description "Describe marcus here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:cl-interpol :cl-ppcre)
  :components ((:file "package")
               (:file "marcus")))
