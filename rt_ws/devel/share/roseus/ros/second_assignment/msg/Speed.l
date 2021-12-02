;; Auto-generated. Do not edit!


(when (boundp 'second_assignment::Speed)
  (if (not (find-package "SECOND_ASSIGNMENT"))
    (make-package "SECOND_ASSIGNMENT"))
  (shadow 'Speed (find-package "SECOND_ASSIGNMENT")))
(unless (find-package "SECOND_ASSIGNMENT::SPEED")
  (make-package "SECOND_ASSIGNMENT::SPEED"))

(in-package "ROS")
;;//! \htmlinclude Speed.msg.html


(defclass second_assignment::Speed
  :super ros::object
  :slots (_acSpeed ))

(defmethod second_assignment::Speed
  (:init
   (&key
    ((:acSpeed __acSpeed) 0.0)
    )
   (send-super :init)
   (setq _acSpeed (float __acSpeed))
   self)
  (:acSpeed
   (&optional __acSpeed)
   (if __acSpeed (setq _acSpeed __acSpeed)) _acSpeed)
  (:serialization-length
   ()
   (+
    ;; float32 _acSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _acSpeed
       (sys::poke _acSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _acSpeed
     (setq _acSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get second_assignment::Speed :md5sum-) "c34cf750d0cd671be992c30fdfbe639e")
(setf (get second_assignment::Speed :datatype-) "second_assignment/Speed")
(setf (get second_assignment::Speed :definition-)
      "float32 acSpeed

")



(provide :second_assignment/Speed "c34cf750d0cd671be992c30fdfbe639e")


