; Auto-generated. Do not edit!


(cl:in-package boris_manipulator-srv)


;//! \htmlinclude multiply-request.msg.html

(cl:defclass <multiply-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:integer
    :initform 0))
)

(cl:defclass multiply-request (<multiply-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multiply-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multiply-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<multiply-request> is deprecated: use boris_manipulator-srv:multiply-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <multiply-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:a-val is deprecated.  Use boris_manipulator-srv:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <multiply-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:b-val is deprecated.  Use boris_manipulator-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multiply-request>) ostream)
  "Serializes a message object of type '<multiply-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multiply-request>) istream)
  "Deserializes a message object of type '<multiply-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multiply-request>)))
  "Returns string type for a service object of type '<multiply-request>"
  "boris_manipulator/multiplyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiply-request)))
  "Returns string type for a service object of type 'multiply-request"
  "boris_manipulator/multiplyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multiply-request>)))
  "Returns md5sum for a message object of type '<multiply-request>"
  "a7d7d7065d45755acef7d4dcf908162a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multiply-request)))
  "Returns md5sum for a message object of type 'multiply-request"
  "a7d7d7065d45755acef7d4dcf908162a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multiply-request>)))
  "Returns full string definition for message of type '<multiply-request>"
  (cl:format cl:nil "int32 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multiply-request)))
  "Returns full string definition for message of type 'multiply-request"
  (cl:format cl:nil "int32 a~%int32 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multiply-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multiply-request>))
  "Converts a ROS message object to a list"
  (cl:list 'multiply-request
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude multiply-response.msg.html

(cl:defclass <multiply-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass multiply-response (<multiply-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multiply-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multiply-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name boris_manipulator-srv:<multiply-response> is deprecated: use boris_manipulator-srv:multiply-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <multiply-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader boris_manipulator-srv:result-val is deprecated.  Use boris_manipulator-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multiply-response>) ostream)
  "Serializes a message object of type '<multiply-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multiply-response>) istream)
  "Deserializes a message object of type '<multiply-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multiply-response>)))
  "Returns string type for a service object of type '<multiply-response>"
  "boris_manipulator/multiplyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiply-response)))
  "Returns string type for a service object of type 'multiply-response"
  "boris_manipulator/multiplyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multiply-response>)))
  "Returns md5sum for a message object of type '<multiply-response>"
  "a7d7d7065d45755acef7d4dcf908162a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multiply-response)))
  "Returns md5sum for a message object of type 'multiply-response"
  "a7d7d7065d45755acef7d4dcf908162a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multiply-response>)))
  "Returns full string definition for message of type '<multiply-response>"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multiply-response)))
  "Returns full string definition for message of type 'multiply-response"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multiply-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multiply-response>))
  "Converts a ROS message object to a list"
  (cl:list 'multiply-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'multiply)))
  'multiply-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'multiply)))
  'multiply-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiply)))
  "Returns string type for a service object of type '<multiply>"
  "boris_manipulator/multiply")