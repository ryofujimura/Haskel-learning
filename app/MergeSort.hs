
-- VSCode, Replit, Canvas, In-Notes, Hoogle
module MergeSort where

msort :: Ord a => [a] -> [a]
msort []  = []                       -- Base case: empty list
msort [x] = [x]                      -- Base case: single element
msort xs  = merge (msort left) (msort right)
  where
    (left, right) = split xs

split :: [a] -> ([a], [a])
split []     = ([], [])              -- Empty list
split [x]    = ([x], [])             -- Single element
split (x:y:zs) = let (xs, ys) = split zs
                 in (x:xs, y:ys)     -- Alternate elements into two lists

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs                     -- One list empty
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y    = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
