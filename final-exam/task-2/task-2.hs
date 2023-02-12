findHelper :: Ord a => [a -> a -> a] -> [a -> a -> a] -> [a] -> a

findHelper org funcs [a] = a

findHelper (h:t) [] (a:tx) = h a (findHelper (h:t) t tx)

findHelper org (h:t) (a:tx) = h a ( findHelper org t tx)



findMinHelper :: Ord a => [a -> a -> a] -> [a -> a -> a] -> [a] -> a

findMinHelper org [f] nums = findHelper org [f] nums

findMinHelper org (h:t) nums = min (findHelper org (h:t) nums) (findHelper org t nums)



findMin :: Ord a => [a -> a -> a] -> [a] -> a
findMin funcs = findMinHelper funcs funcs