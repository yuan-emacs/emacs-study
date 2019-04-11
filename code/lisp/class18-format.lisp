(format t "hello ~a" "word")

(format t "~5,4$" PI)

(format t "~,5f" pi)

(format t "~%~:@d" 10000)

(format t "~%~3$" 5254555.23512565)

(format t "~& this is my ~% test word ~s ~& yes" '(1 2 3 4 5122)) ; ~& 在行首不换行 。 ～% 在行着时换行


(format t "my test is ~s" "\\t abc")

(format t "~%~@:d" 125255)
;; 弄成四位数字
(format t "~%~13,'0d" 125355444)

(format t "~%~,,',,4:d" 122565884)

;; 英语指令

;; twelve thousand five hundred sixty-six
;; twelve thousand five hundred sixty-sixth

(format t "~%~:r" 12566)

;; 条件模式化

(format t "~%~[one~;tow~;three~]" 1)	;two
(format t "~%~[one~;two~;three~:;fourth~]" 5) ;加个 : 值为 fourth




