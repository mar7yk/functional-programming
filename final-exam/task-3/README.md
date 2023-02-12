# Task 3

A group of friends plays a board game in which they get an integer number of points. Before they start the game, each of the friends tries to predict how many points they will get in the end. After the end of the game, the absolute value of the difference between the predicted and the actual number of points obtained is calculated for each player, which we call **mistake**. Players are sorted by accuracy of predictions: (i.e., in ascending order of **mistake**). The final score is determined by the player with k-th best prediction receiving bonus points equal to the **mistake** of the player with k-th worst prediction.

Implement a function finalScores that, given a list of ordered triplets of player name (string), predicted (integer points), and actual score (integer points), returns a list of pairs of player name and its final score.

> Example: 
> finalScores [("Angel", 14, 15), ("Andrey", 8, 10), ("Atanas", 10, 3), ("Georgy", 6, 4)] ->
> [("Angel",22), ("Andrey",12), ("Georgy",6), ("Atanas",4)]