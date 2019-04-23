(cons 1 2)

(car (cons 1 2))
(cdr (cons 3 4))

(defparameter
    *test-cons* (cons 1 2))

(format t "~% this word is ~s" *test-cons*)
;; 如何修改值呢

(setf (car *test-cons*) 20)
(setf (cdr *test-cons*) 40)

;; list 函数用来构造 list表
(list 1 2 3 4) 				;创建一个列表

(defparameter
    *test-list* (list 1 2 3 4))
(defparameter *test-list2* '(1 2 3))

(print *test-list*)

(first *test-list*)
(second *test-list*)

(nth 3 *test-list*)

(length *test-list*)

(do ((i 0 (1+ i)))
    ((= i (length *test-list*)))
  (print (nth i *test-list*)))

(append '(1 2 3 4 5) '(1 2))
(append (list 1 2 3) (list 1 4 5))

(append *test-list* *test-list2*)	;(1 2 3 4 1 2 3)

(reverse *test-list*)


(push "mytest" *test-list*)
(delete 2 *test-list*)

(setf *test-list* (delete "3" *test-list*))

(last *test-list*)
(butlast *test-list*)
(nbutlast *test-list*)

;; (ldiff *test-list*)

(list* (list 1 23) (list 3 4) (list 5 6))
(make-list 8 :initial-element 0)
(revappend '(1 2 3) '(5 6))
(consp *test-list*)
(atom *test-list*)





















