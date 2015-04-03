module Audsley where

--Sort Descending
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smaller = quicksort [ a | a <- xs, a <= x ]
        bigger = quicksort [ a | a <- xs, a > x ]
    in bigger ++ [x] ++ smaller

--Because I could
processorUtil :: (Fractional a) => [(a,a)] -> a
processorUtil x = foldr (+) 0.0 $ map (\b -> snd b / fst b) x

--w is WCET of the task we're finding the response time of the task
--a is the list of tasks that have higher priority than this one
responseHelper :: Int -> [(Int, Int)] -> Int
responseHelper w a = foldr (+) 0 $ map (\x -> (snd x) * (fromIntegral $ ceiling ( (toRational w) / ( toRational (fst x) )))) a

--first param is list of tasks, with the task in question at head
--second param is w value
response :: [(Int, Int)] -> Int -> Int
response (x:xs) w = 
    let first  = snd x + responseHelper w xs
        second = snd x + responseHelper first xs
    in if first > fst x then error "Not schedulable" else if first == second then first else response ([x]++xs) first

audsleyHelper :: [(Int, Int)] -> [Int]
audsleyHelper [] = []
audsleyHelper (x:xs) = 
    let rt = response ([x]++xs) (snd x)
    in [rt] ++ audsleyHelper xs

audsley :: [(Int, Int)] -> [Int]
audsley x = audsleyHelper $ quicksort x
