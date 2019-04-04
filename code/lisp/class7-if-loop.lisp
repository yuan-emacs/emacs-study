
(if (not nil)
    "right"
    "wrong")

(defvar x 0)
(defvar y 1)
(if (> 2 1)
    (print x)
    (print y))

(if (> 2 1)
    (progn
      (setf x (+ 1 x))
      (setf y (+ 2 y)))
    (progn
      (setf x (+ 3 x))
      (setf y (+ 3 y)))
    (print x)
    (print y))

(when (> 2 1) "abc" "111")

(defun test-when (x)
  (when x
    (print "abc")
    (print "test message")
    (list 1 2 3 4)))

(test-when (> 2 1))


(cond
  ((> 2 1) (list 1 2 3))
  ((> 3 1) "mesage"))

;; 写个函数， 输入一年份用来判断是不是闰年和平年  
(defun leap-yearn (year)
  (or (= (rem year 400) 0)
      (and (not (= (rem year 400) 0))
	   (= (rem year 4) 0))))

(leap-yearn 2010)

;; dolist , dotimes
;; (dolist (i '(1 2 3 4))
;;   (print i))

;; (dotimes (x 20)
;;   (dotimes (y 20)
;;     (print (* (+ 1 x) (+ 1 y))))
;;   (print "\t"))

;;  这里可以做一个 99 乘法表

(defun to-string (i j)
  (concatenate 'string (write-to-string i) " * " (write-to-string j) " = " (write-to-string (* i j)) "  "))

;; (defun test-plug (x)
;;   "做一个 乘法表出来"
;;   (dotimes (i x)
;;     (dotimes (j i)
;;       (princ (to-string (+ i 1) (+ j 1)))))
;;   (print "ok"))

  ;; (to-string 1 2)
  
;; (test-plug 9)
 
;;  do terpri 表示输入一个换行符
(defun test-plug (n)
  (do ((i 1 (+ 1 i)))
      ((> i (+ n 1)))
    (do ((j 1 (+ 1 j)))
	((> j i))
      (princ (to-string j i)))
    (terpri)))

(test-plug 4)

;; loop






;; test

;; (evenp 1)

;; (nreverse ["a" "b" "c"])


