; Auto-generated. Do not edit!


(cl:in-package boris_manipulator-srv)


;//! \htmlinclude control-request.msg.html

(cl:defclass <control-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass control-request (<control-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<control-request> is deprecated: use boris_manipulator-srv:control-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control-request>) ostream)
  "Serializes a message object of type '<control-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control-request>) istream)
  "Deserializes a message object of type '<control-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control-request>)))
  "Returns string type for a service object of type '<control-request>"
  "boris_manipulator/controlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control-request)))
  "Returns string type for a service object of type 'control-request"
  "boris_manipulator/controlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control-request>)))
  "Returns md5sum for a message object of type '<control-request>"
  "a2ac08319b695007e4197c737a10017b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control-request)))
  "Returns md5sum for a message object of type 'control-request"
  "a2ac08319b695007e4197c737a10017b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control-request>)))
  "Returns full string definition for message of type '<control-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control-request)))
  "Returns full string definition for message of type 'control-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control-request>))
  "Converts a ROS message object to a list"
  (cl:list 'control-request
))
;//! \htmlinclude control-response.msg.html

(cl:defclass <control-response> (roslisp-msg-protocol:ros-message)
  ((connection_control
    :reader connection_control
    :initarg :connection_control
    :type cl:boolean
    :initform cl:nil)
   (distance_x
    :reader distance_x
    :initarg :distance_x
    :type cl:float
    :initform 0.0)
   (distance_y
    :reader distance_y
    :initarg :distance_y
    :type cl:float
    :initform 0.0)
   (distance_z
    :reader distance_z
    :initarg :distance_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass control-response (<control-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<control-response> is deprecated: use boris_manipulator-srv:control-response instead.")))

(cl:ensure-generic-function 'connection_control-val :lambda-list '(m))
(cl:defmethod connection_control-val ((m <control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:connection_control-val is deprecated.  Use boris_manipulator-srv:connection_control instead.")
  (connection_control m))

(cl:ensure-generic-function 'distance_x-val :lambda-list '(m))
(cl:defmethod distance_x-val ((m <control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:distance_x-val is deprecated.  Use boris_manipulator-srv:distance_x instead.")
  (distance_x m))

(cl:ensure-generic-function 'distance_y-val :lambda-list '(m))
(cl:defmethod distance_y-val ((m <control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:distance_y-val is deprecated.  Use boris_manipulator-srv:distance_y instead.")
  (distance_y m))

(cl:ensure-generic-function 'distance_z-val :lambda-list '(m))
(cl:defmethod distance_z-val ((m <control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:distance_z-val is deprecated.  Use boris_manipulator-srv:distance_z instead.")
  (distance_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control-response>) ostream)
  "Serializes a message object of type '<control-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connection_control) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control-response>) istream)
  "Deserializes a message object of type '<control-response>"
    (cl:setf (cl:slot-value msg 'connection_control) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control-response>)))
  "Returns string type for a service object of type '<control-response>"
  "boris_manipulator/controlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control-response)))
  "Returns string type for a service object of type 'control-response"
  "boris_manipulator/controlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control-response>)))
  "Returns md5sum for a message object of type '<control-response>"
  "a2ac08319b695007e4197c737a10017b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control-response)))
  "Returns md5sum for a message object of type 'control-response"
  "a2ac08319b695007e4197c737a10017b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control-response>)))
  "Returns full string definition for message of type '<control-response>"
  (cl:format cl:nil "bool connection_control~%float64 distance_x~%float64 distance_y~%float64 distance_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control-response)))
  "Returns full string definition for message of type 'control-response"
  (cl:format cl:nil "bool connection_control~%float64 distance_x~%float64 distance_y~%float64 distance_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control-response>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control-response>))
  "Converts a ROS message object to a list"
  (cl:list 'control-response
    (cl:cons ':connection_control (connection_control msg))
    (cl:cons ':distance_x (distance_x msg))
    (cl:cons ':distance_y (distance_y msg))
    (cl:cons ':distance_z (distance_z msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'control)))
  'control-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'control)))
  'control-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control)))
  "Returns string type for a service object of type '<control>"
  "boris_manipulator/control")