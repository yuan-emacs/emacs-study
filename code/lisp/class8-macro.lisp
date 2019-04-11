
(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

(next-prime 3)

(defun get-all-primep (number)
  (do ((p (next-prime 1) (next-prime (+ 1 p))))
      ((> p number))
    (format t "~d " p)))

(get-all-primep 200)


(do-primes (p 0 19)
  (format t "~d " p))

(do-primes (i 1 2000)
  (print i))

;; 实现一个宏
(defmacro do-primes ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
       ((> ,var ,end))
     ,@body))


;; 理解展开式中的下面几个符号  ` ,  @   

(defvar a '(1 2 3))
(defvar b "abc")

;;  ` 让表里面的数据原样输出
`(a 1 (+ 1 2) b)
`((2 3) (1 2 3) (+ 1 2) (list 2 3))

;; , 是在 ` 标志里面做运算, 放在哪个表前面，哪个算式做运算

`((1 2) ,(+ 1 3)) 			; ((1 2) 4) 4是运算结果
`(,(list 1 2 3) ,(- 9 1))		; ((1 2 3) 8)

;; @
`(,(list 1 2 3) ,@(list 4 5))


(macroexpand-1 '(do-primes (p 1 23)
			   (format t "~d " p)))



;; 还剩下，宏的漏洞和编写宏的宏。生面在学习。






