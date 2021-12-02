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
  :slots (_setVal ))

(defmethod second_assignment::ServiceRequest
  (:init
   (&key
    ((:setVal __setVal) 0)
    )
   (send-super :init)
   (setq _setVal (round __setVal))
   self)
  (:setVal
   (&optional __setVal)
   (if __setVal (setq _setVal __setVal)) _setVal)
  (:serialization-length
   ()
   (+
    ;; char _setVal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _setVal
       (write-byte _setVal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _setVal
     (setq _setVal (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(setf (get second_assignment::Service :md5sum-) "4f1064e684dd3d6da99d55dc37eb289e")
(setf (get second_assignment::Service :datatype-) "second_assignment/Service")
(setf (get second_assignment::Service :request) second_assignment::ServiceRequest)
(setf (get second_assignment::Service :response) second_assignment::ServiceResponse)

(defmethod second_assignment::ServiceRequest
  (:response () (instance second_assignment::ServiceResponse :init)))

(setf (get second_assignment::ServiceRequest :md5sum-) "4f1064e684dd3d6da99d55dc37eb289e")
(setf (get second_assignment::ServiceRequest :datatype-) "second_assignment/ServiceRequest")
(setf (get second_assignment::ServiceRequest :definition-)
      "char setVal
---
float32 getVal

")

(setf (get second_assignment::ServiceResponse :md5sum-) "4f1064e684dd3d6da99d55dc37eb289e")
(setf (get second_assignment::ServiceResponse :datatype-) "second_assignment/ServiceResponse")
(setf (get second_assignment::ServiceResponse :definition-)
      "char setVal
---
float32 getVal

")



(provide :second_assignment/Service "4f1064e684dd3d6da99d55dc37eb289e")


