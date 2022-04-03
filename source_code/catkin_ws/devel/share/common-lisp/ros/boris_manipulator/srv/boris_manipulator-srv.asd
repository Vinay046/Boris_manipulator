
(cl:in-package :asdf)

(defsystem "boris_manipulator-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "control" :depends-on ("_package_control"))
    (:file "_package_control" :depends-on ("_package"))
    (:file "localization" :depends-on ("_package_localization"))
    (:file "_package_localization" :depends-on ("_package"))
    (:file "multiply" :depends-on ("_package_multiply"))
    (:file "_package_multiply" :depends-on ("_package"))
  ))