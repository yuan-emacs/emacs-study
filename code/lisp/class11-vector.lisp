;; 向量的基础

; 最基本的定义向量是这样的
(vector 1 2 3)

(vector 1 2 3 "abc")

;; 也可以这样定义向量

(defparameter *arr-demo* (make-array 5))  ;得到的结果是这样的 #(0 0 0 0 0)

;; (make-array 5)

(format t "~% arr-demo is ~s" *arr-demo*) ;  arr-demo is #(0 0 0 0 0)

;; 可以用 initial-element 填充默认值
(make-array 5 :initial-element 'a)	;#(A A A A A)

(make-array 6 :fill-pointer 0)		;#() 这里创建了一个长度为 0 的空数组

(length (make-array 6 :fill-pointer 0))	; length 为 0

(defparameter *arr-demo2* (make-array 5 :fill-pointer 0 :adjustable t))
(vector-push 'a *arr-demo2*)		;返回添加位置的索引
(vector-push 'b *arr-demo2*)

(vector-pop *arr-demo2*)		;返回被删除的那个元素，如果数组为 null时就报错。nothing left to pop

(vector-push-extend "extend push word" *arr-demo2*) ;当在数组中添加了 adjustable 参数后 就可以用这个函数动态地向数组中添加数据了

(length *arr-demo2*)

;; 做个函数把数据中全部元素打印出来

(defun print-arr (x)
  (do ((i 0 (+ i 1)))
      ((= i (length x)))
    (format t "~%数组的第 ~s 项目是 ~s" i (elt x i))))

;; 实现一个清空向量的方法
(defun clear-arr (x)
  (do ()
      ((= 0 (length x)))
    (vector-pop x)))

(defparameter *test-arr* (make-array 5 :fill-pointer 0 :adjustable t :element-type 'string)) ; 定认一个向量只能存放字符串,相当于java中的范型

(vector-push-extend 1 *test-arr*)
(vector-push-extend "1" *test-arr*)
(vector-push-extend "2" *test-arr*)
(vector-push-extend "3" *test-arr*)
(vector-push-extend "4" *test-arr*)
(vector-push-extend "4" *test-arr*)
(vector-push-extend "4" *test-arr*)

(print-arr *test-arr*)
(clear-arr *test-arr*)
(remove nil *test-arr*)

(setf (elt *test-arr* 3) "yuan.zhang")	;修改数组中某个元素


;; 常用操作数组中的方法
;; count

(print *test-arr*)
(print (count "1" *test-arr*))		;这个值为 0 ，为啥呢，原因是 count 内部使用的是 eql 函数用来比较的，这时候可以使用 :test 来修改它的默认行为
(count "1" *test-arr* :test #'string=)	;这时候的返回值就是 2 了，这样修改了 count 函数内部使用的 ：test 默认用的是 eql 默认比较值
(count '1 *test-arr*)
(count "1" *test-arr*)

(find "9" *test-arr* :test #'string=)	;数组中若有则返回这个项目，要是没有返回 NIL
(remove "4" *test-arr* :test #'equal)	;返回被移除后项，原来的数据并没有发生变化

(substitute "900" "1" *test-arr* :test #'string=) ;把旧的数据用数据替换掉
;; 查看一下 4 出现在第几位上
(position "4" *test-arr* :test #'string=) ;获取当前这一项的索引值

;; 重要序列函数关键字参数
;; ：test 两个参数函数用来比较元素(:key函数解出来的值)和项 默认比较值 eql 上面的做字符串比较的时候已使用，修改默认 eql 可以改成 equal or string=
;; ：key 
;;

(defparameter *test-arr-key* (make-array 10 :adjustable t :fill-pointer 0))
;; 构造数据
(print-arr *test-arr-key*)
(vector-push-extend '(a 0) *test-arr-key*)
(vector-push-extend '(b 1) *test-arr-key*)
(vector-push-extend '(c 2) *test-arr-key*)
(vector-push-extend '(d 3) *test-arr-key*)

(find 'c *test-arr-key* :key #'first)	;这样通过key就可以找到了
(position 'c *test-arr-key* :key #'first)
(remove 'a *test-arr-key* :key #'first :count 1 :from-end t)	; 这时只删除 1 个 key值为 a 的项,从后往前删
(count 'c *test-arr-key* :key #'first )
(substitute '(m 123) 'c *test-arr-key* :key #'first :count) ;#((A 1) (A 0) (B 1) (M 123) (D 3))  把原来的值替换掉

;; 理解 ：start 和 :end
(remove #\a "mesage and you are smart" :count 1 :start 5 :end 10) ; 从索引 5 到 10 之间删除一个字符a

;; 对表操作的第几个元素值
(first '(1 2 3))
(second '(123 1231 3524 4535))
(third '(a b c d ef g))
(first '(1 2 3 4))


(count-if #'evenp #(1 2 3 4 5 6 7 8))	; 4


;; hash test

(defparameter *hash-test* (make-hash-table :test #'equalp))

(setf (gethash "a" *hash-test*) "a-test")
(setf (gethash "A" *hash-test*) "b-test")

(gethash "a" *hash-test*)
(gethash "A" *hash-test*)





