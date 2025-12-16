(* ========================================== *)
(*         USING MAP AND FILTER               *)
(* ========================================== *)

val _ = print "=== USING MAP AND FILTER ===\n\n"

(* ------------------------------------------ *)
(* POLYNOMIAL REPRESENTATION                  *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "POLYNOMIAL REPRESENTATION\n"
val _ = print "========================================\n\n"

val _ = print "Polynomials as list of (coeff, degree) pairs:\n\n"

val _ = print "  5x^3 + 2x + 7\n"
val _ = print "  = 5x^3 + 2x^1 + 7x^0\n"
val _ = print "  = [(5,3), (2,1), (7,0)]\n\n"

val a = [(5,3), (2,1), (7,0)]

val _ = print "  val a = [(5,3), (2,1), (7,0)]\n\n"

(* ------------------------------------------ *)
(* MAP: transform each element                *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "MAP: Transform Each Element\n"
val _ = print "========================================\n\n"

val _ = print "  map f [x1, x2, ..., xn] = [f(x1), f(x2), ..., f(xn)]\n\n"

val _ = print "Implementation:\n"
val _ = print "  fun mymap f [] = []\n"
val _ = print "    | mymap f (x::xs) = f x :: mymap f xs\n\n"

fun mymap f [] = []
  | mymap f (x::xs) = f x :: mymap f xs

val _ = print "  Type: ('a -> 'b) -> 'a list -> 'b list\n\n"

val _ = print "Examples:\n"
val _ = print ("  mymap (fn x => x * 2) [1,2,3] = [" ^
               String.concatWith "," (map Int.toString (mymap (fn x => x * 2) [1,2,3])) ^ "]\n")
val _ = print ("  mymap (fn x => x > 0) [~1,0,1] = [" ^
               String.concatWith "," (map Bool.toString (mymap (fn x => x > 0) [~1,0,1])) ^ "]\n\n")

(* ------------------------------------------ *)
(* FILTER: keep elements that satisfy pred    *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "FILTER: Keep Elements Satisfying Predicate\n"
val _ = print "========================================\n\n"

val _ = print "  filter pred [x1, x2, ..., xn]\n"
val _ = print "  = elements where pred(xi) = true\n\n"

val _ = print "Implementation:\n"
val _ = print "  fun myfilter pred [] = []\n"
val _ = print "    | myfilter pred (x::xs) =\n"
val _ = print "        if pred x then x :: myfilter pred xs\n"
val _ = print "        else myfilter pred xs\n\n"

fun myfilter pred [] = []
  | myfilter pred (x::xs) =
      if pred x then x :: myfilter pred xs
      else myfilter pred xs

val _ = print "  Type: ('a -> bool) -> 'a list -> 'a list\n\n"

val _ = print "Examples:\n"
val _ = print ("  myfilter (fn x => x > 0) [~1,0,1,2] = [" ^
               String.concatWith "," (map Int.toString (myfilter (fn x => x > 0) [~1,0,1,2])) ^ "]\n")
val _ = print ("  myfilter (fn x => x mod 2 = 0) [1,2,3,4,5] = [" ^
               String.concatWith "," (map Int.toString (myfilter (fn x => x mod 2 = 0) [1,2,3,4,5])) ^ "]\n\n")

(* ------------------------------------------ *)
(* TAKING THE DERIVATIVE                      *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "TAKING THE DERIVATIVE\n"
val _ = print "========================================\n\n"

val _ = print "Derivative rule: d/dx (a * x^n) = a*n * x^(n-1)\n\n"

val _ = print "Algorithm:\n"
val _ = print "  1. Take each pair (a, n)\n"
val _ = print "  2. Convert to (a*n, n-1)\n"
val _ = print "  3. Filter out n < 0 or coeff = 0\n\n"

val _ = print "Implementation (using our custom map and filter):\n"
val _ = print "  fun derive p =\n"
val _ = print "      myfilter (fn (a,n) => n >= 0)\n"
val _ = print "        (mymap (fn (a,n) => (a*n, n-1)) p)\n\n"

fun derive p =
    myfilter (fn (a,n) => n >= 0)
      (mymap (fn (a,n) => (a*n, n-1)) p)

(* Helper to print polynomial *)
fun pairToStr (a, n) = "(" ^ Int.toString a ^ "," ^ Int.toString n ^ ")"
fun polyToStr p = "[" ^ String.concatWith "," (map pairToStr p) ^ "]"

val _ = print "Step by step for a = [(5,3), (2,1), (7,0)]:\n\n"

val _ = print "  Step 1: mymap (fn (a,n) => (a*n, n-1)) a\n"
val step1 = mymap (fn (a,n) => (a*n, n-1)) a
val _ = print ("          = " ^ polyToStr step1 ^ "\n")
val _ = print "          = [(15,2), (2,0), (0,-1)]\n\n"

val _ = print "  Step 2: myfilter (fn (a,n) => n >= 0) ...\n"
val step2 = myfilter (fn (a,n) => n >= 0) step1
val _ = print ("          = " ^ polyToStr step2 ^ "\n")
val _ = print "          (removed (0,-1) because n < 0)\n\n"

val _ = print "Result:\n"
val _ = print ("  derive a = " ^ polyToStr (derive a) ^ "\n\n")

val _ = print "Verification:\n"
val _ = print "  Original:   5x^3 + 2x + 7\n"
val _ = print "  Derivative: 15x^2 + 2     (which is [(15,2), (2,0)])\n\n"

(* ------------------------------------------ *)
(* ADDITIONAL EXAMPLES                        *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "MORE EXAMPLES\n"
val _ = print "========================================\n\n"

(* 3x^2 + 4x + 5 *)
val b = [(3,2), (4,1), (5,0)]
val _ = print "  b = [(3,2), (4,1), (5,0)]  (3x^2 + 4x + 5)\n"
val _ = print ("  derive b = " ^ polyToStr (derive b) ^ "\n")
val _ = print "           = 6x + 4\n\n"

(* x^4 *)
val c = [(1,4)]
val _ = print "  c = [(1,4)]  (x^4)\n"
val _ = print ("  derive c = " ^ polyToStr (derive c) ^ "\n")
val _ = print "           = 4x^3\n\n"

(* Constant: 7 *)
val d = [(7,0)]
val _ = print "  d = [(7,0)]  (constant 7)\n"
val _ = print ("  derive d = " ^ polyToStr (derive d) ^ "\n")
val _ = print "           = 0 (empty polynomial)\n\n"

(* ------------------------------------------ *)
(* SUMMARY                                    *)
(* ------------------------------------------ *)
val _ = print "=== SUMMARY ===\n"
val _ = print "  mymap f [] = []\n"
val _ = print "  mymap f (x::xs) = f x :: mymap f xs\n\n"
val _ = print "  myfilter p [] = []\n"
val _ = print "  myfilter p (x::xs) = if p x then x :: myfilter p xs\n"
val _ = print "                       else myfilter p xs\n\n"
val _ = print "  Combine them for powerful list transformations!\n"
