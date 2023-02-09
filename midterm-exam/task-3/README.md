# Task 3

Implement a function **selectiveMerge** that, given two lists of integers **a = (a~1~ a~2~ ... a~n~)** and **b = (b~1~ b~2~ ... b~n~)** of equal length and a numeric function **f**, returns a list the same length **c = (c~1~ c~2~ ... c~n~)**. **c** is obtained by selectively merging the lists **a** and **b**. **c1 = a1** and every follow element is calculated according to  following rules:

- **c~i~ = a~i~**         , if **f(a~i~, b~i~) < min(a~i~, b~i~)**
- **c~i~ = f(a~i~, b~i~)**, if **f(a~i~, b~i~) > max(a~i~, b~i~)**
- **c~i~ = c~i-1~**       , otherwise

> Example: (selectiveMerge * '(1 2 3 4 1 3 1 2) '(10 1 2 0 5 -2 -1 4)) -> (1 2 6 0 5 3 1 8)