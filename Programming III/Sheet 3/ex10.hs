--Recursive function that merges two sorted lists to give a single sorted list:
merge :: Ord a => [a] -> [a] -> [a]
merge xs ys | length xs == 0 && length ys == 0 = []
            | length xs == 0 = head ys : merge xs (tail ys)
            | length ys == 0 = head xs : merge (tail xs) ys
			| head xs < head ys = head xs : merge (tail xs) ys
			| otherwise = head ys : merge xs (tail ys)

--Function that sorts a list using the merge sort algorithm:
mergeSort :: Ord a => [a] -> [a]
mergeSort xs | (length xs) <= 1 = xs
             | otherwise = merge (mergeSort (fst (halve xs))) (mergeSort (snd (halve xs)))

--Function that splits a list in to two halves, whose lengths differ by at most one:
halve :: [a] -> ([a],[a])
halve xs = ((take (round (fromIntegral (length xs)/2)) xs),(drop (round (fromIntegral (length xs)/2)) xs))