recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z []         = z
recr f z (x : xs)   = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if e==x then xs else x:rec) []

-- insertarOrdenado :: Ord a => a -> [a] -> [a]
-- insertarOrdenado e []       = [e]
-- insertarOrdenado e (x:xs)   =   if e <= x
--                                     then e:x:xs 
--                                 else x:insertarOrdenado e xs

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs rec -> if e <= x 
                                            then e:x:xs
                                        else x:rec) [e]