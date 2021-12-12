;; Auto-generated. Do not edit!


(when (boundp 'second_assignment::Service)
  (if (not (find-package "SECOND_ASSIGNMENT"))
    (make-package "SECOND_ASSIGNMENT"))
  (shadow 'Service (find-package "SECOND_ASSIGNMENT")))
(unless (find-package "SECOND_ASSIGNMENT::SERVICE")
  (make-package "SECOND_ASSIGNMENT::SERVICE"))
(unless (find-package "SECOND_ASSIGNMENT::SERVICEREQUEST")
  (make-package "SECOND_ASSIGNMENT::SERVICEREQUEST"))
(unless (find-package "SECOND_ASSIGNMENT::SERVICERESPONSE")
  (make-package "SECOND_ASSIGNMENT::SERVICERESPONSE"))

(in-package "ROS")





(defclass second_assignment::ServiceRequest
  :super ros::object
  :slots (_setVal _acSpeed ))

(defmethod second_assignment::ServiceRequest
  (:init
   (&key
    ((:setVal __setVal) 0)
    ((:acSpeed __acSpeed) 0.0)
    )
   (send-super :init)
   (setq _setVal (round __setVal))
   (setq _acSpeed (float __acSpeed))
   self)
  (:setVal
   (&optional __setVal)
   (if __setVal (setq _setVal __setVal)) _setVal)
  (:acSpeed
   (&optional __acSpeed)
   (if __acSpeed (setq _acSpeed __acSpeed)) _acSpeed)
  (:serialization-length
   ()
   (+
    ;; char _setVal
    1
    ;; float32 _acSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _setVal
       (write-byte _setVal s)
     ;; float32 _acSpeed
       (sys::poke _acSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _setVal
     (setq _setVal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _acSpeed
     (setq _acSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass second_assignment::ServiceResponse
  :super ros::object
  :slots (_getVal ))

(defmethod second_assignment::ServiceResponse
  (:init
   (&key
    ((:getVal __getVal) 0.0)
    )
   (send-super :init)
   (setq _getVal (float __getVal))
   self)
  (:getVal
   (&optional __getVal)
   (if __getVal (setq _getVal __getVal)) _getVal)
  (:serialization-length
   ()
   (+
    ;; float32 _getVal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _getVal
       (sys::poke _getVal (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _getVal
     (setq _getVal (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass second_assignment::Service
  :super ros::object
  :slots ())

(setf (get second_assignment::Service :md5sum-) "8779e7bdb2387b37c12a283a613e834c")
(setf (get second_assignment::Service :datatype-) "second_assignment/Service")
(setf (get second_assignment::Service :request) second_assignment::ServiceRequest)
(setf (get second_assignment::Service :response) second_assignment::ServiceResponse)

(defmethod second_assignment::ServiceRequest
  (:response () (instance second_assignment::ServiceResponse :init)))

(setf (get second_assignment::ServiceRequest :md5sum-) "8779e7bdb2387b37c12a283a613e834c")
(setf (get second_assignment::ServiceRequest :datatype-) "second_assignment/ServiceRequest")
(setf (get second_assignment::ServiceRequest :definition-)
      "char setVal
float32 acSpeed
---
float32 getVal

")

(setf (get second_assignment::ServiceResponse :md5sum-) "8779e7bdb2387b37c12a283a613e834c")
(setf (get second_assignment::ServiceResponse :datatype-) "second_assignment/ServiceResponse")
(setf (get second_assignment::ServiceResponse :definition-)
      "char setVal
float32 acSpeed
---
float32 getVal

")



(provide :second_assignment/Service "8779e7bdb2387b37c12a283a613e834c")


