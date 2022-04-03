; Auto-generated. Do not edit!


(cl:in-package boris_manipulator-srv)


;//! \htmlinclude localization-request.msg.html

(cl:defclass <localization-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass localization-request (<localization-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <localization-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'localization-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<localization-request> is deprecated: use boris_manipulator-srv:localization-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <localization-request>) ostream)
  "Serializes a message object of type '<localization-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <localization-request>) istream)
  "Deserializes a message object of type '<localization-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<localization-request>)))
  "Returns string type for a service object of type '<localization-request>"
  "boris_manipulator/localizationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'localization-request)))
  "Returns string type for a service object of type 'localization-request"
  "boris_manipulator/localizationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<localization-request>)))
  "Returns md5sum for a message object of type '<localization-request>"
  "75886f154361ea2dcee0a0ccaddcf0d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'localization-request)))
  "Returns md5sum for a message object of type 'localization-request"
  "75886f154361ea2dcee0a0ccaddcf0d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<localization-request>)))
  "Returns full string definition for message of type '<localization-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'localization-request)))
  "Returns full string definition for message of type 'localization-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <localization-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <localization-request>))
  "Converts a ROS message object to a list"
  (cl:list 'localization-request
))
;//! \htmlinclude localization-response.msg.html

(cl:defclass <localization-response> (roslisp-msg-protocol:ros-message)
  ((connection_localization
    :reader connection_localization
    :initarg :connection_localization
    :type cl:boolean
    :initform cl:nil)
   (position_x
    :reader position_x
    :initarg :position_x
    :type cl:float
    :initform 0.0)
   (position_y
    :reader position_y
    :initarg :position_y
    :type cl:float
    :initform 0.0)
   (position_z
    :reader position_z
    :initarg :position_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass localization-response (<localization-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <localization-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'localization-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<localization-response> is deprecated: use boris_manipulator-srv:localization-response instead.")))

(cl:ensure-generic-function 'connection_localization-val :lambda-list '(m))
(cl:defmethod connection_localization-val ((m <localization-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:connection_localization-val is deprecated.  Use boris_manipulator-srv:connection_localization instead.")
  (connection_localization m))

(cl:ensure-generic-function 'position_x-val :lambda-list '(m))
(cl:defmethod position_x-val ((m <localization-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:position_x-val is deprecated.  Use boris_manipulator-srv:position_x instead.")
  (position_x m))

(cl:ensure-generic-function 'position_y-val :lambda-list '(m))
(cl:defmethod position_y-val ((m <localization-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:position_y-val is deprecated.  Use boris_manipulator-srv:position_y instead.")
  (position_y m))

(cl:ensure-generic-function 'position_z-val :lambda-list '(m))
(cl:defmethod position_z-val ((m <localization-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:position_z-val is deprecated.  Use boris_manipulator-srv:position_z instead.")
  (position_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <localization-response>) ostream)
  "Serializes a message object of type '<localization-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'connection_localization) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <localization-response>) istream)
  "Deserializes a message object of type '<localization-response>"
    (cl:setf (cl:slot-value msg 'connection_localization) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<localization-response>)))
  "Returns string type for a service object of type '<localization-response>"
  "boris_manipulator/localizationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'localization-response)))
  "Returns string type for a service object of type 'localization-response"
  "boris_manipulator/localizationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<localization-response>)))
  "Returns md5sum for a message object of type '<localization-response>"
  "75886f154361ea2dcee0a0ccaddcf0d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'localization-response)))
  "Returns md5sum for a message object of type 'localization-response"
  "75886f154361ea2dcee0a0ccaddcf0d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<localization-response>)))
  "Returns full string definition for message of type '<localization-response>"
  (cl:format cl:nil "bool connection_localization~%float64 position_x~%float64 position_y~%float64 position_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'localization-response)))
  "Returns full string definition for message of type 'localization-response"
  (cl:format cl:nil "bool connection_localization~%float64 position_x~%float64 position_y~%float64 position_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <localization-response>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <localization-response>))
  "Converts a ROS message object to a list"
  (cl:list 'localization-response
    (cl:cons ':connection_localization (connection_localization msg))
    (cl:cons ':position_x (position_x msg))
    (cl:cons ':position_y (position_y msg))
    (cl:cons ':position_z (position_z msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'localization)))
  'localization-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'localization)))
  'localization-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'localization)))
  "Returns string type for a service object of type '<localization>"
  "boris_manipulator/localization")