-- Main.hs
--
-- CECS 342 Assignment 1
-- Sorting Algorithms in C & Haskell
--
-- Haskell Test Program


module Main where

import QuickSort(qsort)  
import MergeSort(msort)  
import Text.Printf(printf)


name      = "Ryo Fujimura" 
studentID = 016317260     


main :: IO ()
main = do
  putStr "CECS 342 Assignment 1\n"
  printf "Name: %s\n" name
  printf "Student ID: %d\n" studentID
  putStrLn "Language: Haskell"
  
  let qs = "Quick sort"
  logTest qs 1 qsort     0
  logTest qs 2 qsort     1
  logTest qs 3 qsort     2
  logTest qs 4 qsort  1013
  logTest qs 5 qsort (10^5)

  let ms = "Merge sort"
  logTest ms 1 msort     0
  logTest ms 2 msort     1
  logTest ms 3 msort     2
  logTest ms 4 msort  1013
  logTest ms 5 msort (10^5)

  
-- Log a test.
logTest :: String -> Int -> ([Int] -> [Int]) -> Int -> IO()
logTest tname i sort n = printf "%s test %d %s, certificate: %08d.\n" tname i result cert
  where
    result   = if ok then "passed" else "failed"
    (ok, cert) = test sort n studentID


-- Test a sort function.
test sort n seed = (ok, cert)
  where
    ok       = isSorted sorted
      && length sorted == length unsorted
    cert     = checkSum (10^8) sorted
    sorted   = sort unsorted
    unsorted = take n $ pseudoRandoms 8 seed


pseudoRandoms k seed = tail $ iterate next seed
  where
    next 0 = seed
    next r = (r*r `div` 10^(k`div`2)) `mod` 10^k


checkSum m = snd . foldl (\(i, s) x -> (i+1, (s + i*x) `mod` m)) (1, 0)


isSorted xs = and $ zipWith (<=) xs (tail xs)
