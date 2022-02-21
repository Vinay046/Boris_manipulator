;; Auto-generated. Do not edit!


(when (boundp 'boris_manipulator::multiply)
  (if (not (find-package "BORIS_MANIPULATOR"))
    (make-package "BORIS_MANIPULATOR"))
  (shadow 'multiply (find-package "BORIS_MANIPULATOR")))
(unless (find-package "BORIS_MANIPULATOR::MULTIPLY")
  (make-package "BORIS_MANIPULATOR::MULTIPLY"))
(unless (find-package "BORIS_MANIPULATOR::MULTIPLYREQUEST")
  (make-package "BORIS_MANIPULATOR::MULTIPLYREQUEST"))
(unless (find-package "BORIS_MANIPULATOR::MULTIPLYRESPONSE")
  (make-package "BORIS_MANIPULATOR::MULTIPLYRESPONSE"))

(in-package "ROS")





(defclass boris_manipulator::multiplyRequest
  :super ros::object
  :slots (_a _b ))

(defmethod boris_manipulator::multiplyRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; int32 _a
    4
    ;; int32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _a
       (write-long _a s)
     ;; int32 _b
       (write-long _b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _a
     (setq _a (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _b
     (setq _b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass boris_manipulator::multiplyResponse
  :super ros::object
  :slots (_result ))

(defmethod boris_manipulator::multiplyResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass boris_manipulator::multiply
  :super ros::object
  :slots ())

(setf (get boris_manipulator::multiply :md5sum-) "a7d7d7065d45755acef7d4dcf908162a")
(setf (get boris_manipulator::multiply :datatype-) "boris_manipulator/multiply")
(setf (get boris_manipulator::multiply :request) boris_manipulator::multiplyRequest)
(setf (get boris_manipulator::multiply :response) boris_manipulator::multiplyResponse)

(defmethod boris_manipulator::multiplyRequest
  (:response () (instance boris_manipulator::multiplyResponse :init)))

(setf (get boris_manipulator::multiplyRequest :md5sum-) "a7d7d7065d45755acef7d4dcf908162a")
(setf (get boris_manipulator::multiplyRequest :datatype-) "boris_manipulator/multiplyRequest")
(setf (get boris_manipulator::multiplyRequest :definition-)
      "int32 a
int32 b
---
int32 result
")

(setf (get boris_manipulator::multiplyResponse :md5sum-) "a7d7d7065d45755acef7d4dcf908162a")
(setf (get boris_manipulator::multiplyResponse :datatype-) "boris_manipulator/multiplyResponse")
(setf (get boris_manipulator::multiplyResponse :definition-)
      "int32 a
int32 b
---
int32 result
")



(provide :boris_manipulator/multiply "a7d7d7065d45755acef7d4dcf908162a")


