; Auto-generated. Do not edit!


(cl:in-package second_assignment-srv)


;//! \htmlinclude Service-request.msg.html

(cl:defclass <Service-request> (roslisp-msg-protocol:ros-message)
  ((setVal
    :reader setVal
    :initarg :setVal
    :type cl:integer
    :initform 0)
   (acSpeed
    :reader acSpeed
    :initarg :acSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass Service-request (<Service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name second_assignment-srv:<Service-request> is deprecated: use second_assignment-srv:Service-request instead.")))

(cl:ensure-generic-function 'setVal-val :lambda-list '(m))
(cl:defmethod setVal-val ((m <Service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader second_assignment-srv:setVal-val is deprecated.  Use second_assignment-srv:setVal instead.")
  (setVal m))

(cl:ensure-generic-function 'acSpeed-val :lambda-list '(m))
(cl:defmethod acSpeed-val ((m <Service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader second_assignment-srv:acSpeed-val is deprecated.  Use second_assignment-srv:acSpeed instead.")
  (acSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Service-request>) ostream)
  "Serializes a message object of type '<Service-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setVal)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Service-request>) istream)
  "Deserializes a message object of type '<Service-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setVal)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Service-request>)))
  "Returns string type for a service object of type '<Service-request>"
  "second_assignment/ServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service-request)))
  "Returns string type for a service object of type 'Service-request"
  "second_assignment/ServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Service-request>)))
  "Returns md5sum for a message object of type '<Service-request>"
  "8779e7bdb2387b37c12a283a613e834c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Service-request)))
  "Returns md5sum for a message object of type 'Service-request"
  "8779e7bdb2387b37c12a283a613e834c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Service-request>)))
  "Returns full string definition for message of type '<Service-request>"
  (cl:format cl:nil "char setVal~%float32 acSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Service-request)))
  "Returns full string definition for message of type 'Service-request"
  (cl:format cl:nil "char setVal~%float32 acSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Service-request>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Service-request
    (cl:cons ':setVal (setVal msg))
    (cl:cons ':acSpeed (acSpeed msg))
))
;//! \htmlinclude Service-response.msg.html

(cl:defclass <Service-response> (roslisp-msg-protocol:ros-message)
  ((getVal
    :reader getVal
    :initarg :getVal
    :type cl:float
    :initform 0.0))
)

(cl:defclass Service-response (<Service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name second_assignment-srv:<Service-response> is deprecated: use second_assignment-srv:Service-response instead.")))

(cl:ensure-generic-function 'getVal-val :lambda-list '(m))
(cl:defmethod getVal-val ((m <Service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader second_assignment-srv:getVal-val is deprecated.  Use second_assignment-srv:getVal instead.")
  (getVal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Service-response>) ostream)
  "Serializes a message object of type '<Service-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'getVal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Service-response>) istream)
  "Deserializes a message object of type '<Service-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'getVal) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Service-response>)))
  "Returns string type for a service object of type '<Service-response>"
  "second_assignment/ServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service-response)))
  "Returns string type for a service object of type 'Service-response"
  "second_assignment/ServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Service-response>)))
  "Returns md5sum for a message object of type '<Service-response>"
  "8779e7bdb2387b37c12a283a613e834c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Service-response)))
  "Returns md5sum for a message object of type 'Service-response"
  "8779e7bdb2387b37c12a283a613e834c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Service-response>)))
  "Returns full string definition for message of type '<Service-response>"
  (cl:format cl:nil "float32 getVal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Service-response)))
  "Returns full string definition for message of type 'Service-response"
  (cl:format cl:nil "float32 getVal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Service-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Service-response
    (cl:cons ':getVal (getVal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Service)))
  'Service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Service)))
  'Service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service)))
  "Returns string type for a service object of type '<Service>"
  "second_assignment/Service")