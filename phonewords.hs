{-
    This program will build on dictionary.hs and wordsToPhone from a previous
    assignment. You can copy your wordsToPhone source code here or you can simply
    include the line:
    
    import PTfuncsyntax
    
    and run this program in the same directory with your PFfuncsyntax.hs file.
    
    This program will ask the user to enter a 4-digit number. It will then list 
    off all of the english words that can be formed from that number on a standard 
    telephone keypad.
    
    Example of use:
    
    *Main> main
    Type a four-digit number:
    2376
    "Afro"
    "Bern"
    "berm"
    *Main> 

-}

charToPhoneDigit :: Char -> Int
charToPhoneDigit char
  | char `elem` "abcABC" = 2
  | char `elem` "defDEF" = 3
  | char `elem` "ghiGHI" = 4
  | char `elem` "jklJKL" = 5
  | char `elem` "mnoMNO" = 6
  | char `elem` "pqrsPQRS" = 7
  | char `elem` "tuvTUV" = 8
  | char `elem` "wxyzWXYZ" = 9
  | otherwise = 0

numListToNum :: [Int] -> Int
numListToNum nums = read (inString nums)
inString [] = []
inString nums = (show $ head nums) ++ (inString $ tail nums)

wordsToPhone :: String -> Int
wordsToPhone w = numListToNum (wordsToPhoneList w)
wordsToPhoneList w = [charToPhoneDigit x | x<-w]

main = do 
    putStrLn ("Type a four-digit number: ")
    num <- readLn
    dictionary <- readFile "/usr/share/dict/american-english"
    let dict = words dictionary
    mapM_ (putStrLn) [show x | x<-dict, wordsToPhone x == num]
