# Task 1

Write a function **(argmin f a b)** that returns such a number from the integer interval **[a;b]** for which the one-argument function **f** returns the lowest value. Note that we are not interested in the values returned by **f**. With more than one minimum, it doesn't matter which one is returned.

> (define (mod7 x) (modulo x 7))
> (argmin mod7 45 50) -> 49