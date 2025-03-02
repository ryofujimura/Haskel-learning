-- VSCode, Replit, Canvas, In-Notes, Hoogle
module QuickSort where

qsort :: Ord a => [a] -> [a]
qsort []     = []                    -- Base case: empty list
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [y | y <- xs, y < x]   -- Elements less than pivot
    larger  = [y | y <- xs, y >= x]  -- Elements greater than or equal to pivot