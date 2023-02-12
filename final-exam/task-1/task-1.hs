import Data.List ( length )

type Stage = Int

data Transition = Transition {
    fromStage :: Stage,
    transitionValue :: Char,
    toStage :: Stage
}

data Automat = Automat {
    stages      :: [Stage],
    startStage  :: Stage,
    transitions :: [Transition],
    finalStages :: [Stage]
}

isFinalStage :: Automat -> Stage -> Bool
isFinalStage automat st = 
    case filter (== st) (finalStages automat) of
        [] -> False
        _  -> True

evalChar :: Automat -> Stage -> String -> (String, [Stage])
evalChar automat st (f:t) = (t, nextStages) where
    nextStages =
        map toStage $ filter (\tr ->
            (st == fromStage tr) && (f == transitionValue tr)) 
            (transitions automat)

isWordRecognized :: Automat -> Stage -> String -> Bool
isWordRecognized automat st word 
    | word == "" = isFinalStage automat st
    | otherwise =
        foldr (\stg l -> l || isWordRecognized automat stg nextStr) False nextStgs

    where
        (nextStr, nextStgs) = evalChar automat st word

concatStringsWithChars :: [String] -> [Char] -> [String]
concatStringsWithChars words1
  = foldr (\ t -> (++) (map ([t] ++) words1)) []

rejectedWord :: [Char] -> Automat -> Maybe String
rejectedWord letters automat = rejectedWordHelper [""] 0 where

    -- automaton whit n states recognizes all possible words 
    -- exactly when it recognizes all possible words of length up to n
    maxLengthOfWords = length $ stages automat

    rejectedWordHelper words lengthOfWords
        | lengthOfWords > maxLengthOfWords = Nothing
        | otherwise =
            case findFirstRejectedWord words of
                Nothing -> rejectedWordHelper nextWords (lengthOfWords + 1)
                Just word  -> Just word
        where
            nextWords = concatStringsWithChars words letters


    findFirstRejectedWord [] = Nothing
    findFirstRejectedWord (h:t) = 
        if not $ isWordRecognized automat (startStage automat) h then 
            Just h
        else 
            findFirstRejectedWord t