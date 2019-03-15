(car '(1 2 3 4))
(cdr '(1 3 5 6 9))
(read "(1 . 2)")

(quote (1 . (2 . (3 . nil)))) ;; (1 2 3)

(car '(1 . 2))
(cdr '(2 . 3))

(consp '(1 2))
(consp '(1 . 2))

(listp '(1 . 2))

(listp '(1 2 3 4 5))

;; cons 用来构造一个 cons cell

(cons 1 2)

(cons 3 2)

(setq foo '(1 3))

(cons 5 foo)  ;; (5 1 3)

(push 9 foo);; (9 1 3) 运行一次把 9 放进去一次

(list 1 2 3 4 5 9) ;; 用来生成一个列表

(list 1 2 3 4 5)

(append '(1 2 3) '(3) '(5) 6) ;;

(setq myfoo (append '(1 2 3) 4))
(car myfoo)
(car (append '(1 2 3) 4))



;; 问题 什么是向量

;; nth 用来取列表中第 n 个元素
(nth 2 '(1 2 9))

(length '(1 2 3))

(defun mysub (arr begin last)
  (let ((len (length arr))) ))
















