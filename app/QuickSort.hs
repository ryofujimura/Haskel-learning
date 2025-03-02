
-- VSCode, Replit, Canvas, In-Notes, Hoogle
module QuickSort where

qsort :: Ord a => [a] -> [a]
qsort []     = []                    -- Base case: empty list
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = filter (< x) xs        -- More efficient than list comprehension
    larger  = filter (>= x) xs
