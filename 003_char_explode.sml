(* ========================================== *)
(*      CHAR TYPE AND EXPLODE FUNCTION        *)
(* ========================================== *)

val _ = print "=== CHAR TYPE AND EXPLODE IN SML ===\n\n"

(* ------------------------------------------ *)
(* 1. THE CHAR TYPE                           *)
(* ------------------------------------------ *)
val _ = print "1. THE CHAR TYPE\n"
val _ = print "   Characters are written with #\"...\" syntax\n\n"

val letter = #"A"
val digit = #"5"
val space = #" "
val newline = #"\n"

val _ = print ("   val letter  = #\"A\"\n")
val _ = print ("   val digit   = #\"5\"\n")
val _ = print ("   val space   = #\" \"\n")
val _ = print ("   val newline = #\"\\n\"\n\n")

(* ------------------------------------------ *)
(* 2. EXPLODE: string -> char list            *)
(* ------------------------------------------ *)
val _ = print "2. EXPLODE: string -> char list\n"
val _ = print "   Converts a string into a list of characters\n\n"

val hello = explode "hello"
val abc = explode "ABC"
val empty = explode ""

val _ = print "   explode \"hello\" = [#\"h\", #\"e\", #\"l\", #\"l\", #\"o\"]\n"
val _ = print "   explode \"ABC\"   = [#\"A\", #\"B\", #\"C\"]\n"
val _ = print "   explode \"\"      = []\n\n"

(* ------------------------------------------ *)
(* 3. IMPLODE: char list -> string            *)
(* ------------------------------------------ *)
val _ = print "3. IMPLODE: char list -> string\n"
val _ = print "   Converts a list of characters back to a string\n\n"

val chars = [#"S", #"M", #"L"]
val result = implode chars

val _ = print "   implode [#\"S\", #\"M\", #\"L\"] = \"SML\"\n"
val _ = print ("   Verified: " ^ implode chars ^ "\n\n")

(* ------------------------------------------ *)
(* 4. ORD AND CHR: ASCII conversions          *)
(* ------------------------------------------ *)
val _ = print "4. ORD AND CHR: ASCII Conversions\n"
val _ = print "   ord: char -> int (get ASCII code)\n"
val _ = print "   chr: int -> char (get char from ASCII)\n\n"

val _ = print ("   ord #\"A\" = " ^ Int.toString (ord #"A") ^ "\n")
val _ = print ("   ord #\"a\" = " ^ Int.toString (ord #"a") ^ "\n")
val _ = print ("   ord #\"0\" = " ^ Int.toString (ord #"0") ^ "\n")
val _ = print ("   chr 65   = #\"" ^ Char.toString (chr 65) ^ "\"\n")
val _ = print ("   chr 97   = #\"" ^ Char.toString (chr 97) ^ "\"\n\n")

(* ------------------------------------------ *)
(* 5. CHAR COMPARISON                         *)
(* ------------------------------------------ *)
val _ = print "5. CHAR COMPARISON\n"
val _ = print "   Characters can be compared with <, >, =, etc.\n\n"

val _ = print ("   #\"a\" < #\"b\" = " ^ Bool.toString (#"a" < #"b") ^ "\n")
val _ = print ("   #\"A\" < #\"a\" = " ^ Bool.toString (#"A" < #"a") ^ " (uppercase before lowercase)\n")
val _ = print ("   #\"5\" < #\"9\" = " ^ Bool.toString (#"5" < #"9") ^ "\n\n")

(* ------------------------------------------ *)
(* 6. CHAR PREDICATES                         *)
(* ------------------------------------------ *)
val _ = print "6. CHAR PREDICATES (Char module)\n\n"

val _ = print ("   Char.isAlpha #\"A\" = " ^ Bool.toString (Char.isAlpha #"A") ^ "\n")
val _ = print ("   Char.isAlpha #\"5\" = " ^ Bool.toString (Char.isAlpha #"5") ^ "\n")
val _ = print ("   Char.isDigit #\"7\" = " ^ Bool.toString (Char.isDigit #"7") ^ "\n")
val _ = print ("   Char.isUpper #\"A\" = " ^ Bool.toString (Char.isUpper #"A") ^ "\n")
val _ = print ("   Char.isLower #\"a\" = " ^ Bool.toString (Char.isLower #"a") ^ "\n")
val _ = print ("   Char.isSpace #\" \" = " ^ Bool.toString (Char.isSpace #" ") ^ "\n")
val _ = print ("   Char.toUpper #\"a\" = #\"" ^ Char.toString (Char.toUpper #"a") ^ "\"\n")
val _ = print ("   Char.toLower #\"A\" = #\"" ^ Char.toString (Char.toLower #"A") ^ "\"\n\n")

(* ========================================== *)
(*              EXERCISES                      *)
(* ========================================== *)

val _ = print "========================================\n"
val _ = print "             EXERCISES                  \n"
val _ = print "========================================\n\n"

(* ------------------------------------------ *)
(* EXERCISE 1: Count characters               *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 1: Count Characters\n"
val _ = print "   Write countChars(s) that returns the number of characters in a string\n"
val _ = print "   Hint: Use explode and length\n"
val _ = print "   Example: countChars \"hello\" = 5\n\n"

(* TODO: Implement countChars & LEN *)
fun countChars s = 0;

(* Uncomment to test:
val _ = print ("   countChars \"hello\" = " ^ Int.toString (countChars "hello") ^ "\n")
val _ = print ("   countChars \"SML\" = " ^ Int.toString (countChars "SML") ^ "\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 2: Reverse a string               *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 2: Reverse a String\n"
val _ = print "   Write reverseStr(s) that reverses a string\n"
val _ = print "   Hint: Use explode, rev, and implode\n"
val _ = print "   Example: reverseStr \"hello\" = \"olleh\"\n\n"

(* rev([1,2,3]) => [3,2,1] *)

(* TODO: Implement reverseStr *)
fun reverseStr s = ""  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("   reverseStr \"hello\" = \"" ^ reverseStr "hello" ^ "\"\n")
val _ = print ("   reverseStr \"SML\" = \"" ^ reverseStr "SML" ^ "\"\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 3: Convert to uppercase           *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 3: Convert to Uppercase\n"
val _ = print "   Write toUpperStr(s) that converts a string to uppercase\n"
val _ = print "   Hint: Use explode, map, Char.toUpper, and implode\n"
val _ = print "   Example: toUpperStr \"hello\" = \"HELLO\"\n\n"

(* map(fu: 'a => 'b, [1,2,3]) => ['b, 'b, 'b] *)

(* TODO: Implement toUpperStr *)
fun toUpperStr s = ""  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("   toUpperStr \"hello\" = \"" ^ toUpperStr "hello" ^ "\"\n")
val _ = print ("   toUpperStr \"SmL\" = \"" ^ toUpperStr "SmL" ^ "\"\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 4: Check palindrome               *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 4: Check Palindrome\n"
val _ = print "   Write isPalindrome(s) that checks if a string is a palindrome\n"
val _ = print "   Hint: Compare exploded chars with reversed chars\n"
val _ = print "   Example: isPalindrome \"radar\" = true\n"
val _ = print "   Example: isPalindrome \"hello\" = false\n\n"

(* TODO: Implement isPalindrome *)
fun isPalindrome s = false  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("   isPalindrome \"radar\" = " ^ Bool.toString (isPalindrome "radar") ^ "\n")
val _ = print ("   isPalindrome \"hello\" = " ^ Bool.toString (isPalindrome "hello") ^ "\n")
val _ = print ("   isPalindrome \"abba\" = " ^ Bool.toString (isPalindrome "abba") ^ "\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 5: Count vowels                   *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 5: Count Vowels\n"
val _ = print "   Write countVowels(s) that counts the vowels (a,e,i,o,u) in a string\n"
val _ = print "   Hint: Use explode, List.filter, and a helper function isVowel\n"
val _ = print "   Example: countVowels \"hello\" = 2\n\n"

(* TODO: Implement countVowels *)
fun countVowels s = 0  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("   countVowels \"hello\" = " ^ Int.toString (countVowels "hello") ^ "\n")
val _ = print ("   countVowels \"aeiou\" = " ^ Int.toString (countVowels "aeiou") ^ "\n")
val _ = print ("   countVowels \"xyz\" = " ^ Int.toString (countVowels "xyz") ^ "\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 6: Remove spaces                  *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 6: Remove Spaces\n"
val _ = print "   Write removeSpaces(s) that removes all spaces from a string\n"
val _ = print "   Hint: Use explode, List.filter, and implode\n"
val _ = print "   Example: removeSpaces \"h e l l o\" = \"hello\"\n\n"

(* TODO: Implement removeSpaces *)
fun removeSpaces s = ""  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("   removeSpaces \"h e l l o\" = \"" ^ removeSpaces "h e l l o" ^ "\"\n")
val _ = print ("   removeSpaces \"a b c\" = \"" ^ removeSpaces "a b c" ^ "\"\n\n")
*)

(* ========================================== *)
(*              SOLUTIONS                      *)
(* ========================================== *)
(*
   Scroll down for solutions...










   SOLUTIONS:

   (* Exercise 1 *)
   fun countChars s = length (explode s)

   (* Exercise 2 *)
   fun reverseStr s = implode (rev (explode s))

   (* Exercise 3 *)
   fun toUpperStr s = implode (map Char.toUpper (explode s))

   (* Exercise 4 *)
   fun isPalindrome s =
       let val chars = explode s
       in chars = rev chars
       end

   (* Exercise 5 *)
   fun isVowel c = Char.contains "aeiouAEIOU" c
   fun countVowels s = length (List.filter isVowel (explode s))

   (* Exercise 6 *)
   fun removeSpaces s = implode (List.filter (fn c => c <> #" ") (explode s))
*)

(* ------------------------------------------ *)
(* SUMMARY                                    *)
(* ------------------------------------------ *)
val _ = print "=== SUMMARY ===\n"
val _ = print "   #\"x\"         - character literal\n"
val _ = print "   explode s    - string -> char list\n"
val _ = print "   implode cs   - char list -> string\n"
val _ = print "   ord c        - char -> ASCII int\n"
val _ = print "   chr n        - ASCII int -> char\n"
val _ = print "   Char.isXXX   - character predicates\n"
val _ = print "   Char.toUpper/toLower - case conversion\n"
