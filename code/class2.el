(message "max numbers is %s" most-positive-fixnum)
(message "min numbers is %s" most-negative-fixnum)


(numberp "hello")

(= 1 1)
(= 1 1.0)

(eql 1 1.0)

(setq msg "abc")
(defvar aa msg)
(eql msg aa)
(equal msg aa)

(setq num 1.25)
(round num)
(floor num)
(ceiling num)

(abs -1)

(abs -123)

(% 5 2)
(% 5.0 2) ;; 不能这么干
(mod 5.0 2)
(mod 1.1 0.2)

(sqrt 8 3)
(exp 2)
(expt 2 3)
(log 8 2)
(log 100 10)
(asin 0.5)
(sqrt 9)
(sqrt 100)
;; 20 开 14次方根


(random t)

(truncate 1.9999)

;; emacs 中没有判断非空的函数，可以这么干
(setq str "")
(not (string< "" str))

(string ?s ?f)
(substring "123456" 0 3)

(setq a "123")
(setq b "abc")

(concat a b)
(message "concat %s" (concat a b))

(make-string 10 ?a)

(string-equal "123" a)
(string-lessp "123" a)

(string-equal "Abc" b)
;;(case-fold-serach "Abc" b)
;;(toggle-case-fold-search "Abc" b)

(string-to-number a)

(upcase b)
(downcase b)
(capitalize "THE CAT IN THE HAT")
(upcase-initials "THE CAT IN THE HAT")

(format "%#o" 8) ;; 8进制
(format "%#x" 16)

(string-match "34" "1234567890000123456789" 10)

(string-match "2*" "132*2=696")

(regexp-quote "2*")

(string-match (regexp-quote "2*") "132*2=696")



