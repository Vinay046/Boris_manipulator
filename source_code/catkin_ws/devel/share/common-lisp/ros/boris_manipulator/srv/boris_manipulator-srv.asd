
(cl:in-package :asdf)

(defsystem "boris_manipulator-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "multiply" :depends-on ("_package_multiply"))
    (:file "_package_multiply" :depends-on ("_package"))
  ))