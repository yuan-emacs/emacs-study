(message "hello word")
;; 第二章
(defun hello-word (arg-name)
  "this is a say hello word prog"
  (message "hello,%s" arg-name))

(hello-word "nihao")

(setq foo "zyy")
(message foo)

(setq foo "abc")
(message foo)

(defvar foo "what" "this is document string") 

(message foo)


;; 计算圆面积
(defun circle-area (r)
  (let ((pi 3.14) area))
  (setq area (* pi r r))
  (message "直径为：%s,面积是：%.2f" r area))

(circle-area 4.0)

(defun circl-area2 (r)
  (let* ((pi 3.14)
	 (area (* pi r r))))
  (message "面积是：%.2f,半径是：%.2f" area r)
  )

(circl-area2 5)


(funcall
 (lambda (args)
   "this is lambda test message"
   (message "hello nihao %s" args)) "zhangsan")

(setq test-lambda (lambda (name-arg)
		    "this is a test lamdba da shi"
		    (message "this is test lambda %s" name-arg)))

(funcall test-lambda "hello word")


(progn (message "hello") (message "123"))

;; if user
(defun my-max (a b)
  (if (> a b) a b)
  )

(my-max 3 4)

;; cond use

(defun jicheng (n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(t (+ (jicheng (- n 1))  (jicheng (- n 2))))
	))

(jicheng 40)

(defun fib (n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(t (+ (fib (- n 1))
	      (fib (- n 2))))))

(message "value is %s" (fib 3))
(fib 4)

(defun demo-let ()
  (let ((res 1) (res2 2) (res3 3))
    (message "res is %s" res)
    (message "you can let args %s" res2)
    (message "you can visite res3 %s" res3))
  )

(demo-let)


(defun sum (n)
  (let ((s 1))
    (while (> n 0) (
		    progn
		    (setq s (+ s n))
		    (setq n (- n 1))
		    )
	   )
    s))

(sum 10)

(and t nil)
(or t nil)
(not nil)

(defun hello-myword ())

