
(dotimes (x 10)
  (format t "~d" x))



(let ((x 10) (y 20) z) (+ x y z))

;; 用 let 定义局部变量
(defun test-let (z)
  (let ((x 10) (y 20))
    (setf x 1 y 2)
    (+ x y z)))

(test-let 1)

;;let 的作用域
;; let 的作用域只在当前域中有效，出了这个域一就看它上级
(defun test-let-scope (x)
  (print x)
  
  (let ((x 2))
    (print x)
    (let ((x 3))
      (print x))
    (print x))
  (print x))

(test-let-scope 4)			;4,2,3,2,4

;; let* 可以对变量做操作
(defun test-let* (x)
  (print x)
  (let* ((y (+ x 1)))
    (+ x y)))

(test-let* 3)


(defparameter *fn*
  (let* ((count 0))
    #'(lambda ()
	(setf count (+ 1 count))
	(print count))))

(funcall *fn*)

(print "hello word")
(defvar *test-word* "123")
(defvar *test-word* "hello word")
(setf *test-word* "abc")		;可以用 setf修改变量值
(print *test-word*)

(defparameter *my-word* "12321")
(defparameter *my-word* "hello word")
(print *my-word*)


;; (incf)

(defconstant mm PI)
;; (setf mm 1231)
(print mm)

;; setf 是不是只能操作全局变量呢？ 也可以修改局部变量
;; seft 可以给 list 改值吗？
;; rotatef 
;; shiftf
;;

(defvar a 10)
(defvar b 20)
(print a)
(print b)
(rotatef a b)
(print a)
(print b)

(defvar *yuan-test* "yuan.zhang")
(defun test-yuan ()
  (setf *yuan-test* "abc")
  (print *yuan-test*))

(test-yuan)

(print *yuan-test*)  			; 这个值是 abc 前端函数已修改了

;; 看一个练习
(defvar *x* 10)
(defun foo ()
  (format t "X:~d~%" *x*))

(defun bar ()
  (foo)
  (let ((*x* 20))
    (foo))
  (foo))

(foo)



