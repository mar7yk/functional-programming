import Data.List ( sort, reverse )

type Player = (String, Int, Int)


getPlayerWithMist :: Player -> (Int, Player)
getPlayerWithMist (name, predScore, realScore) = (abs (predScore - realScore), (name, predScore, realScore))

getPlayersWithFinalScore :: [(Int, Player)] -> [(String, Int)]
getPlayersWithFinalScore players = getPlayersWithFinalScoreHelper players (reverse players) 
    where
    getPlayersWithFinalScoreHelper :: [(Int, Player)] -> [(Int, Player)] -> [(String, Int)]
    getPlayersWithFinalScoreHelper [] [] = []
    getPlayersWithFinalScoreHelper ((s, (name, predScore, realScore)):t) ((sr, pr):tr) = (name, realScore + sr) : getPlayersWithFinalScoreHelper t tr


finalScores :: [Player] -> [(String, Int)]
finalScores players = getPlayersWithFinalScore playersWithMist where
    playersWithMist = sort $ map getPlayerWithMist players