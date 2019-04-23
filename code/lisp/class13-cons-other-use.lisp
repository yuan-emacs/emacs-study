;; copy-list and copy-tree

(defparameter *demo-list* '((1 2) (3 4) (5 6)))

(print *demo-list*)

(defparameter *demo-list2* (copy-list *demo-list*)) ;copy-list 只实现了浅copy

(print *demo-list2*)

(print (car (car *demo-list*)))
;; 做一个修改list 数据的例子,执行完成以后，会发现 *demo-list* 和 *demo-list2* 数据都是 ((5 2) (3 4) (5 6)) 
(setf (car (car *demo-list*)) 9)

(defparameter *tree-copy-list* (copy-tree *demo-list*)) ; 实现的是深copy

(print *tree-copy-list*) 		;((5 2) (3 4) (5 6))


(defparameter *test-list*
  '(1 2 3 4 5 6 7 8 9))

(print *test-list*)

;;  substitute nsubstitute
;; (defparameter *test-substitute* '("abc" "a" "b" "a" 1 2 3 1 1 1 5))
(defparameter *test-substitute* '("abc" "a" "b" "a" ("a" "b" "a") 2 3 1 1 1 5))
(substitute "a" '1 *test-substitute*)	;("abc" "a" "b" "a" "a" 2 3 "a" "a" "a" 5) 把列表中的 1 全部换成 "a"

(substitute 1 "a" *test-substitute* :test #'equal) ;("abc" 1 "b" 1 1 2 3 1 1 1 5)这里可以用 :test 关键字

(print *test-substitute*)

;; 如何表中的嵌套比较深的话，substitute 就不适用了。这时候就得用 subst 来解决这个问题
(subst "message" "a" *test-substitute* :test #'equal) ;("abc" "message" "b" "message" ("message" "b" "message") 2 3 1 1 1 5) 它就可以实现 递归替换

;; 集合

(defparameter *collection-test* ())

(pushnew "zhangsan" *collection-test*)
(pushnew "lisi" *collection-test*)
(pushnew "wangwu" *collection-test*)

(print *collection-test*)

(defparameter *sub-collection-test* ())
(pushnew "lisi" *sub-collection-test*)
(pushnew "wangwu" *sub-collection-test*)

(print *sub-collection-test*)


;; subsetp 用来判断一个集合是不是另一个集合的子集
(subsetp *sub-collection-test* *collection-test* :test #'equal) ;第一个集合是不是第二个集合的真子集

(intersection *sub-collection-test* *collection-test* :test #'equal) ; 算交集

(union *sub-collection-test* *collection-test* :test #'equal) ;算补集

(set-difference *collection-test* *sub-collection-test* :test #'equal) ; (zhangsan) 算差集，出现在第1个集合里，但是不出现在第2个集合里

;; 查询表 alist 和 plist

(defparameter *alist-test* '((cons a 1) (cons b 1) (cons c 1)))

(print *alist-test*)

(assoc 'a *alist-test*)









