;; (defunfoo (a b &optional c d)
;;(list a b c d))	       

;; (foo 1 2)
;; (foo 1 2 3)
;; (foo 1 2 3 4)

;;给参数设置默认值
;;用 &optional 设置后面的参数即为可靠形参
(defun make-rect (width &optional (height 10))
  (list width height))

(make-rect 3)

(defun make-rect2 (width &optional (height width))
  (list width height))

(make-rect2 5)

(defun make-rect3 (width &optional (height width c-supplied-p))
  (list width height c-supplied-p))

(make-rect3 2)

(make-rect3 4 5)

;; 剩余形参 &rest 设置后面的参数即为剩余形参
;; 什么是剩余形参呢：相当于js中的 ...arg 或者 arguments 功能。把要传的参数放到一个 list中，操作参数和操作list数据 用 &rest 设置后面参数会被当成list处理

(defun rest-demo (a b &rest args)
  (list a b args))

(rest-demo 1 2 3 4 5)

(rest-demo 1 2)

;; 关键字形参： &key 后面设置的参数即为关键字形参。
;; 一个简单的例子
(defun keyarg-demo (&key a b)
  (list a b))

(keyarg-demo :a 1 :b 2)
(keyarg-demo :b 3 :a 4)

;; 高级使用
;; 改变输入key值
;; 注意：下面的代码修改了传入值的key ，给出默认值，以及判断 c是否已经传入 

(defun keyarg-demo3
    (&key ((:apple a)) ((:meal b) "reace") ((:message c) "hello!" c-supplied-p))
  (list a b c c-supplied-p))


(keyarg-demo3 :apple "草果" :meal "abc" :message "你好啊")

(keyarg-demo3 :apple "my apple")


;; 混合不同的形参类型
;; 四种不同参数声明是按。必要形参-可选形参-剩余形参-关键字形参 。顺序声明

;; 要注意的是

(defun my-foo (x &optional y &key z)
  (list x y z))

(my-foo 1 2 :z 3)

(my-foo 1)


;; 这样调用就会报错,因为 :z 会被当做可选形参传入。

(my-foo 1 :z 3)

;; 注意：&rest 和 &key 在一起使用的时，会出现一些问题

(defun my-foo2 (&rest rest &key a b c)
  (list rest a b c))

(my-foo2 :a 1 :b 2 :c 3)		; ((:A 1 :B 2 :C 3) 1 2 3)

;; 把函数做为数据传递的函数——高阶函数（回调函数）
;; 通过 function和#' 可以得到函数数据
(function my-foo2)
(funcall #'my-foo2 :a 123)


;;  funcall 相当于js中的 call 用用法
(defun func-data (fn)
  (format t "begin user fn")
  (funcall fn)
  (format t "finsh function call"))

(func-data #'(lambda () (format t "lambda bian da shi")))

(defun arg-test () (format t "this is a test arg function"))

(func-data #'arg-test)

;; 这种是带参数传递
(defun func-data2 (fn &optional (argsment "test word"))
  (format t "begin")
  (funcall fn argsment)
  (format t "end"))

(func-data2 #'(lambda (mes)
		(format t mes))
	    "add some word")

;; apply 相当于js中的 apply,在传递的时候把 list当成参数传入


((lambda () (format t "hello word")))


((lambda (mes)
   (list (mes))))


(+ "1" 1)





