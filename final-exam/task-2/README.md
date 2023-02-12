# Task 2

Let a list f of two-argument numerical functions f~0~, f~1~, ..., f~m-1~ and a list I of numbers x~0~, x~1~, ..., x~n-1~ be given.

Cyclic application of f over f at position I we call the number 
f~i~(x~0~, f~i+1~(x~1~, ..., f~m-1~(x~m-i~, f~0~(x~m-i+1~, ..., f~j~(x~n-2~, xn-1)...))...)) , where j is the corresponding last index.

Implement a function findMin which, given a list of functions f and a list of numbers I, returns the minimum of the m possible cyclic applications of f over n

> findMin [(+), (-), (*)] [1, 2, 0, 3, -1] -> -7 (= 1 - (2 (8 + (3 - (-1)))))