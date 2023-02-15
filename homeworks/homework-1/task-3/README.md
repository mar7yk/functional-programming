# Task 3

On a chessboard of size **n** by **n** are placed a certain number of pieces. We will assume that both rows and columns are indexed by integers starting from 0. Write a function **n-rooks** that, given n and a description of the set pieces, checks whether it is true that there is exactly one piece in each row and there is exactly one figure in each pillar.

To determine the placed pieces, is used a function that checks if there is a piece on a given field by its coordinates (and the size of the board):


> (define (board1 x y n)
>  (= (remainder (+ x 2) n) y))
> (define (board2 x y n)
>   (= (min (+ x 2) (- n 1)) y))
> (n-rooks board1 5) -> #t
> (n-rooks board2 5) -> #f