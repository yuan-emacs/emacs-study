(+ 1 1)

(loop
   for item in '(1 2 34 45)
     for jitem from 1 to 20
   do (print item) (print jitem))

(loop
   for i in '(1 2 4 5 6)
     collect i)
