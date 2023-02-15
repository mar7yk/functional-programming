# Task 2

Write a function **(best-pair a b)** that returns such a pair of numbers **(x . y)** from the integer interval **[a;b]**, for which x+y has the maximum number of divisors, where **x<y** and **a<b**.

> (best-pair 10 20) -> (16 . 20) ; or (17 . 19), but not (18 . 18)