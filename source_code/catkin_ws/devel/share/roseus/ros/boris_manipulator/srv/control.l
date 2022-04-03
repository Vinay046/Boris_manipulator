;; Auto-generated. Do not edit!


(when (boundp 'boris_manipulator::control)
  (if (not (find-package "BORIS_MANIPULATOR"))
    (make-package "BORIS_MANIPULATOR"))
  (shadow 'control (find-package "BORIS_MANIPULATOR")))
(unless (find-package "BORIS_MANIPULATOR::CONTROL")
  (make-package "BORIS_MANIPULATOR::CONTROL"))
(unless (find-package "BORIS_MANIPULATOR::CONTROLREQUEST")
  (make-package "BORIS_MANIPULATOR::CONTROLREQUEST"))
(unless (find-package "BORIS_MANIPULATOR::CONTROLRESPONSE")
  (make-package "BORIS_MANIPULATOR::CONTROLRESPONSE"))

(in-package "ROS")





(defclass boris_manipulator::controlRequest
  :super ros::object
  :slots ())

(defmethod boris_manipulator::controlRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass boris_manipulator::controlResponse
  :super ros::object
  :slots (_connection_control _distance_x _distance_y _distance_z ))

(defmethod boris_manipulator::controlResponse
  (:init
   (&key
    ((:connection_control __connection_control) nil)
    ((:distance_x __distance_x) 0.0)
    ((:distance_y __distance_y) 0.0)
    ((:distance_z __distance_z) 0.0)
    )
   (send-super :init)
   (setq _connection_control __connection_control)
   (setq _distance_x (float __distance_x))
   (setq _distance_y (float __distance_y))
   (setq _distance_z (float __distance_z))
   self)
  (:connection_control
   (&optional (__connection_control :null))
   (if (not (eq __connection_control :null)) (setq _connection_control __connection_control)) _connection_control)
  (:distance_x
   (&optional __distance_x)
   (if __distance_x (setq _distance_x __distance_x)) _distance_x)
  (:distance_y
   (&optional __distance_y)
   (if __distance_y (setq _distance_y __distance_y)) _distance_y)
  (:distance_z
   (&optional __distance_z)
   (if __distance_z (setq _distance_z __distance_z)) _distance_z)
  (:serialization-length
   ()
   (+
    ;; bool _connection_control
    1
    ;; float64 _distance_x
    8
    ;; float64 _distance_y
    8
    ;; float64 _distance_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _connection_control
       (if _connection_control (write-byte -1 s) (write-byte 0 s))
     ;; float64 _distance_x
       (sys::poke _distance_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_y
       (sys::poke _distance_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_z
       (sys::poke _distance_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _connection_control
     (setq _connection_control (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _distance_x
     (setq _distance_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_y
     (setq _distance_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_z
     (setq _distance_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass boris_manipulator::control
  :super ros::object
  :slots ())

(setf (get boris_manipulator::control :md5sum-) "a2ac08319b695007e4197c737a10017b")
(setf (get boris_manipulator::control :datatype-) "boris_manipulator/control")
(setf (get boris_manipulator::control :request) boris_manipulator::controlRequest)
(setf (get boris_manipulator::control :response) boris_manipulator::controlResponse)

(defmethod boris_manipulator::controlRequest
  (:response () (instance boris_manipulator::controlResponse :init)))

(setf (get boris_manipulator::controlRequest :md5sum-) "a2ac08319b695007e4197c737a10017b")
(setf (get boris_manipulator::controlRequest :datatype-) "boris_manipulator/controlRequest")
(setf (get boris_manipulator::controlRequest :definition-)
      "
---
bool connection_control
float64 distance_x
float64 distance_y
float64 distance_z
")

(setf (get boris_manipulator::controlResponse :md5sum-) "a2ac08319b695007e4197c737a10017b")
(setf (get boris_manipulator::controlResponse :datatype-) "boris_manipulator/controlResponse")
(setf (get boris_manipulator::controlResponse :definition-)
      "
---
bool connection_control
float64 distance_x
float64 distance_y
float64 distance_z
")



(provide :boris_manipulator/control "a2ac08319b695007e4197c737a10017b")


