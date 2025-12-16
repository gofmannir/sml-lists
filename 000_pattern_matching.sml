(* ========================================== *)
(*        PATTERN MATCHING IN SML            *)
(* ========================================== *)

val _ = print "=== PATTERN MATCHING IN SML ===\n\n"

(* ------------------------------------------ *)
(* 1. MATCHING ON VALUES                      *)
(* ------------------------------------------ *)
val _ = print "1. MATCHING ON VALUES\n"

fun describe 0 = "zero"
  | describe 1 = "one"
  | describe 2 = "two"
  | describe n = "other: " ^ Int.toString n

val _ = print ("  describe 0 = " ^ describe 0 ^ "\n")
val _ = print ("  describe 1 = " ^ describe 1 ^ "\n")
val _ = print ("  describe 5 = " ^ describe 5 ^ "\n\n")

(* ------------------------------------------ *)
(* 2. MATCHING ON LISTS                       *)
(* ------------------------------------------ *)
val _ = print "2. MATCHING ON LISTS\n"
val _ = print "  []      -> empty list\n"
val _ = print "  [x]     -> single element\n"
val _ = print "  x::xs   -> head :: tail\n\n"

fun listInfo [] = "empty list"
  | listInfo [x] = "single element: " ^ Int.toString x
  | listInfo [x, y] = "two elements: " ^ Int.toString x ^ ", " ^ Int.toString y
  | listInfo (x::xs) = "head=" ^ Int.toString x ^ ", tail has " ^ Int.toString (length xs) ^ " elements"

val _ = print ("  listInfo []        = " ^ listInfo [] ^ "\n")
val _ = print ("  listInfo [5]       = " ^ listInfo [5] ^ "\n")
val _ = print ("  listInfo [1,2]     = " ^ listInfo [1,2] ^ "\n")
val _ = print ("  listInfo [1,2,3,4] = " ^ listInfo [1,2,3,4] ^ "\n\n")

(* ------------------------------------------ *)
(* 3. MATCHING ON TUPLES                      *)
(* ------------------------------------------ *)
val _ = print "3. MATCHING ON TUPLES\n"

fun addPair (x, y) = x + y
fun swap (a, b) = (b, a)
fun first (x, _, _) = x   (* underscore ignores values *)

val _ = print ("  addPair (3, 4) = " ^ Int.toString (addPair (3, 4)) ^ "\n")
val _ = print "  swap (1, 2)    = (2, 1)\n"
val _ = print ("  first (1,2,3)  = " ^ Int.toString (first (1, 2, 3)) ^ "\n\n")

(* ------------------------------------------ *)
(* 4. WILDCARD PATTERN (_)                    *)
(* ------------------------------------------ *)
val _ = print "4. WILDCARD PATTERN (_)\n"
val _ = print "  Use _ to ignore values you don't need\n\n"

fun isZero 0 = true
  | isZero _ = false      (* matches anything else *)

fun head (x::_) = x       (* ignore tail *)

val _ = print ("  isZero 0 = " ^ Bool.toString (isZero 0) ^ "\n")
val _ = print ("  isZero 5 = " ^ Bool.toString (isZero 5) ^ "\n")
val _ = print ("  head [1,2,3] = " ^ Int.toString (head [1,2,3]) ^ "\n\n")

(* ------------------------------------------ *)
(* 5. CASE EXPRESSIONS                        *)
(* ------------------------------------------ *)
val _ = print "5. CASE EXPRESSIONS\n"

fun grade score =
  case score of
      100 => "Perfect!"
    | _ => if score >= 90 then "A"
           else if score >= 80 then "B"
           else if score >= 70 then "C"
           else "F"

val _ = print ("  grade 100 = " ^ grade 100 ^ "\n")
val _ = print ("  grade 85  = " ^ grade 85 ^ "\n")
val _ = print ("  grade 65  = " ^ grade 65 ^ "\n\n")

(* ------------------------------------------ *)
(* 6. PATTERN MATCHING WITH DATATYPES         *)
(* ------------------------------------------ *)
val _ = print "6. PATTERN MATCHING WITH DATATYPES\n"

datatype shape = Circle of real
               | Rectangle of real * real
               | Triangle of real * real

fun area (Circle r) = 3.14159 * r * r
  | area (Rectangle (w, h)) = w * h
  | area (Triangle (b, h)) = 0.5 * b * h

val _ = print ("  area (Circle 2.0)        = " ^ Real.toString (area (Circle 2.0)) ^ "\n")
val _ = print ("  area (Rectangle (3,4))   = " ^ Real.toString (area (Rectangle (3.0, 4.0))) ^ "\n")
val _ = print ("  area (Triangle (3,4))    = " ^ Real.toString (area (Triangle (3.0, 4.0))) ^ "\n\n")

(* ------------------------------------------ *)
(* 7. NESTED PATTERNS                         *)
(* ------------------------------------------ *)
val _ = print "7. NESTED PATTERNS\n"

fun sumFirstTwo (a::b::_) = a + b
  | sumFirstTwo [x] = x
  | sumFirstTwo [] = 0

fun nestedExample ((a, b), c) = a + b + c

val _ = print ("  sumFirstTwo [1,2,3,4] = " ^ Int.toString (sumFirstTwo [1,2,3,4]) ^ "\n")
val _ = print ("  sumFirstTwo [5]       = " ^ Int.toString (sumFirstTwo [5]) ^ "\n")
val _ = print ("  nestedExample ((1,2),3) = " ^ Int.toString (nestedExample ((1,2),3)) ^ "\n\n")

(* ------------------------------------------ *)
(* SUMMARY                                    *)
(* ------------------------------------------ *)
val _ = print "=== SUMMARY ===\n"
val _ = print "  - Patterns are matched top-to-bottom\n"
val _ = print "  - First matching pattern wins\n"
val _ = print "  - Use _ for values you don't need\n"
val _ = print "  - Patterns can be nested\n"
val _ = print "  - Compiler warns about non-exhaustive patterns\n"
