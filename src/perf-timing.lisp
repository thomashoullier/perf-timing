(defpackage :perf-timing
  (:use :cl)
  (:export #:time-real
           #:time-run))
(in-package :perf-timing)

(defun time-real (fun &key (mult 1) (ret-type 'real))
  "Return real execution time per fun call in seconds.
   mult: Repeat the call mult times for functions too fast to be
         accurately timed.
   ret-type: The result is coerced to this type."
  (let ((start) (stop))
    (setf start (get-internal-real-time))
    (dotimes (it mult) (funcall fun))
    (setf stop (get-internal-real-time))
    (coerce (/ (- stop start) internal-time-units-per-second mult)
            ret-type)))

(defun time-run (fun &key (mult 1) (ret-type 'real))
  "Return execution runtime per fun call in seconds.
   mult: Repeat the call mult times for functions too fast to be
         accurately timed.
   ret-type: The result is coerced to this type."
  (let ((start) (stop))
    (setf start (get-internal-run-time))
    (dotimes (it mult) (funcall fun))
    (setf stop (get-internal-run-time))
    (coerce (/ (- stop start) internal-time-units-per-second mult)
            ret-type)))
