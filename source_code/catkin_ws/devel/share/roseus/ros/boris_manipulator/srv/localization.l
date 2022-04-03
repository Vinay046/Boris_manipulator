;; Auto-generated. Do not edit!


(when (boundp 'boris_manipulator::localization)
  (if (not (find-package "BORIS_MANIPULATOR"))
    (make-package "BORIS_MANIPULATOR"))
  (shadow 'localization (find-package "BORIS_MANIPULATOR")))
(unless (find-package "BORIS_MANIPULATOR::LOCALIZATION")
  (make-package "BORIS_MANIPULATOR::LOCALIZATION"))
(unless (find-package "BORIS_MANIPULATOR::LOCALIZATIONREQUEST")
  (make-package "BORIS_MANIPULATOR::LOCALIZATIONREQUEST"))
(unless (find-package "BORIS_MANIPULATOR::LOCALIZATIONRESPONSE")
  (make-package "BORIS_MANIPULATOR::LOCALIZATIONRESPONSE"))

(in-package "ROS")





(defclass boris_manipulator::localizationRequest
  :super ros::object
  :slots ())

(defmethod boris_manipulator::localizationRequest
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

(defclass boris_manipulator::localizationResponse
  :super ros::object
  :slots (_connection_localization _position_x _position_y _position_z ))

(defmethod boris_manipulator::localizationResponse
  (:init
   (&key
    ((:connection_localization __connection_localization) nil)
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:position_z __position_z) 0.0)
    )
   (send-super :init)
   (setq _connection_localization __connection_localization)
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _position_z (float __position_z))
   self)
  (:connection_localization
   (&optional (__connection_localization :null))
   (if (not (eq __connection_localization :null)) (setq _connection_localization __connection_localization)) _connection_localization)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:position_z
   (&optional __position_z)
   (if __position_z (setq _position_z __position_z)) _position_z)
  (:serialization-length
   ()
   (+
    ;; bool _connection_localization
    1
    ;; float64 _position_x
    8
    ;; float64 _position_y
    8
    ;; float64 _position_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _connection_localization
       (if _connection_localization (write-byte -1 s) (write-byte 0 s))
     ;; float64 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_z
       (sys::poke _position_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _connection_localization
     (setq _connection_localization (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _position_x
     (setq _position_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_y
     (setq _position_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_z
     (setq _position_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass boris_manipulator::localization
  :super ros::object
  :slots ())

(setf (get boris_manipulator::localization :md5sum-) "75886f154361ea2dcee0a0ccaddcf0d9")
(setf (get boris_manipulator::localization :datatype-) "boris_manipulator/localization")
(setf (get boris_manipulator::localization :request) boris_manipulator::localizationRequest)
(setf (get boris_manipulator::localization :response) boris_manipulator::localizationResponse)

(defmethod boris_manipulator::localizationRequest
  (:response () (instance boris_manipulator::localizationResponse :init)))

(setf (get boris_manipulator::localizationRequest :md5sum-) "75886f154361ea2dcee0a0ccaddcf0d9")
(setf (get boris_manipulator::localizationRequest :datatype-) "boris_manipulator/localizationRequest")
(setf (get boris_manipulator::localizationRequest :definition-)
      "
---
bool connection_localization
float64 position_x
float64 position_y
float64 position_z
")

(setf (get boris_manipulator::localizationResponse :md5sum-) "75886f154361ea2dcee0a0ccaddcf0d9")
(setf (get boris_manipulator::localizationResponse :datatype-) "boris_manipulator/localizationResponse")
(setf (get boris_manipulator::localizationResponse :definition-)
      "
---
bool connection_localization
float64 position_x
float64 position_y
float64 position_z
")



(provide :boris_manipulator/localization "75886f154361ea2dcee0a0ccaddcf0d9")


