; Auto-generated. Do not edit!


(cl:in-package second_assignment-msg)


;//! \htmlinclude Speed.msg.html

(cl:defclass <Speed> (roslisp-msg-protocol:ros-message)
  ((acSpeed
    :reader acSpeed
    :initarg :acSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass Speed (<Speed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Speed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Speed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name second_assignment-msg:<Speed> is deprecated: use second_assignment-msg:Speed instead.")))

(cl:ensure-generic-function 'acSpeed-val :lambda-list '(m))
(cl:defmethod acSpeed-val ((m <Speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader second_assignment-msg:acSpeed-val is deprecated.  Use second_assignment-msg:acSpeed instead.")
  (acSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Speed>) ostream)
  "Serializes a message object of type '<Speed>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Speed>) istream)
  "Deserializes a message object of type '<Speed>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Speed>)))
  "Returns string type for a message object of type '<Speed>"
  "second_assignment/Speed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Speed)))
  "Returns string type for a message object of type 'Speed"
  "second_assignment/Speed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Speed>)))
  "Returns md5sum for a message object of type '<Speed>"
  "c34cf750d0cd671be992c30fdfbe639e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Speed)))
  "Returns md5sum for a message object of type 'Speed"
  "c34cf750d0cd671be992c30fdfbe639e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Speed>)))
  "Returns full string definition for message of type '<Speed>"
  (cl:format cl:nil "float32 acSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Speed)))
  "Returns full string definition for message of type 'Speed"
  (cl:format cl:nil "float32 acSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Speed>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Speed>))
  "Converts a ROS message object to a list"
  (cl:list 'Speed
    (cl:cons ':acSpeed (acSpeed msg))
))
