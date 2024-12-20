;; Auto-generated. Do not edit!


(when (boundp 'my_first_pkg::custom)
  (if (not (find-package "MY_FIRST_PKG"))
    (make-package "MY_FIRST_PKG"))
  (shadow 'custom (find-package "MY_FIRST_PKG")))
(unless (find-package "MY_FIRST_PKG::CUSTOM")
  (make-package "MY_FIRST_PKG::CUSTOM"))

(in-package "ROS")
;;//! \htmlinclude custom.msg.html


(defclass my_first_pkg::custom
  :super ros::object
  :slots (_x _y _str ))

(defmethod my_first_pkg::custom
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0.0)
    ((:str __str) "")
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (float __y))
   (setq _str (string __str))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:str
   (&optional __str)
   (if __str (setq _str __str)) _str)
  (:serialization-length
   ()
   (+
    ;; int64 _x
    8
    ;; float64 _y
    8
    ;; string _str
    4 (length _str)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _str
       (write-long (length _str) s) (princ _str s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _str
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _str (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get my_first_pkg::custom :md5sum-) "cdd8807acedfe4bc483e70beedd18e21")
(setf (get my_first_pkg::custom :datatype-) "my_first_pkg/custom")
(setf (get my_first_pkg::custom :definition-)
      "int64 x
float64 y
string str
")



(provide :my_first_pkg/custom "cdd8807acedfe4bc483e70beedd18e21")


