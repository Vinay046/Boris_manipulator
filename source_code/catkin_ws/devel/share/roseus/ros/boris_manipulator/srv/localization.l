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
  :slots (_connection _distance_x _distance_y _distance_z _position_x _position_y _position_z ))

(defmethod boris_manipulator::localizationResponse
  (:init
   (&key
    ((:connection __connection) nil)
    ((:distance_x __distance_x) 0.0)
    ((:distance_y __distance_y) 0.0)
    ((:distance_z __distance_z) 0.0)
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:position_z __position_z) 0.0)
    )
   (send-super :init)
   (setq _connection __connection)
   (setq _distance_x (float __distance_x))
   (setq _distance_y (float __distance_y))
   (setq _distance_z (float __distance_z))
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _position_z (float __position_z))
   self)
  (:connection
   (&optional (__connection :null))
   (if (not (eq __connection :null)) (setq _connection __connection)) _connection)
  (:distance_x
   (&optional __distance_x)
   (if __distance_x (setq _distance_x __distance_x)) _distance_x)
  (:distance_y
   (&optional __distance_y)
   (if __distance_y (setq _distance_y __distance_y)) _distance_y)
  (:distance_z
   (&optional __distance_z)
   (if __distance_z (setq _distance_z __distance_z)) _distance_z)
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
    ;; bool _connection
    1
    ;; float64 _distance_x
    8
    ;; float64 _distance_y
    8
    ;; float64 _distance_z
    8
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
     ;; bool _connection
       (if _connection (write-byte -1 s) (write-byte 0 s))
     ;; float64 _distance_x
       (sys::poke _distance_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_y
       (sys::poke _distance_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_z
       (sys::poke _distance_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; bool _connection
     (setq _connection (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _distance_x
     (setq _distance_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_y
     (setq _distance_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_z
     (setq _distance_z (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get boris_manipulator::localization :md5sum-) "9262ab8a424c72423785dba6bebfb167")
(setf (get boris_manipulator::localization :datatype-) "boris_manipulator/localization")
(setf (get boris_manipulator::localization :request) boris_manipulator::localizationRequest)
(setf (get boris_manipulator::localization :response) boris_manipulator::localizationResponse)

(defmethod boris_manipulator::localizationRequest
  (:response () (instance boris_manipulator::localizationResponse :init)))

(setf (get boris_manipulator::localizationRequest :md5sum-) "9262ab8a424c72423785dba6bebfb167")
(setf (get boris_manipulator::localizationRequest :datatype-) "boris_manipulator/localizationRequest")
(setf (get boris_manipulator::localizationRequest :definition-)
      "
---
bool connection
float64 distance_x
float64 distance_y
float64 distance_z
float64 position_x
float64 position_y
float64 position_z
")

(setf (get boris_manipulator::localizationResponse :md5sum-) "9262ab8a424c72423785dba6bebfb167")
(setf (get boris_manipulator::localizationResponse :datatype-) "boris_manipulator/localizationResponse")
(setf (get boris_manipulator::localizationResponse :definition-)
      "
---
bool connection
float64 distance_x
float64 distance_y
float64 distance_z
float64 position_x
float64 position_y
float64 position_z
")



(provide :boris_manipulator/localization "9262ab8a424c72423785dba6bebfb167")


