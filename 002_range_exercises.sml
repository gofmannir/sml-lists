(* ========================================== *)
(*   BUILDING THE LIST OF INTEGERS [m,...,n-1] *)
(*            EXERCISES                        *)
(* ========================================== *)

val _ = print "=== RANGE FUNCTION EXERCISES ===\n\n"

(* ------------------------------------------ *)
(* THE RANGE FUNCTION                         *)
(* ------------------------------------------ *)
(*
   range(m, n) produces the list [m, m+1, ..., n-1]

   Type: int * int -> int list

   Examples:
     range(2, 5) = [2, 3, 4]
     range(0, 3) = [0, 1, 2]
     range(5, 5) = []
*)










(* Implementation *)
fun range (m, n) = if m = n then []
                   else m :: (range (m + 1, n))

val _ = print "range function: range(m, n) = [m, m+1, ..., n-1]\n\n"
val _ = print "Examples:\n"
val _ = print ("  range(2, 5) = [" ^ String.concatWith "," (map Int.toString (range(2,5))) ^ "]\n")
val _ = print ("  range(0, 3) = [" ^ String.concatWith "," (map Int.toString (range(0,3))) ^ "]\n")
val _ = print ("  range(5, 5) = [" ^ String.concatWith "," (map Int.toString (range(5,5))) ^ "]\n\n")

(* ------------------------------------------ *)
(* INFIX OPERATOR VERSION                     *)
(* ------------------------------------------ *)
infix --
val op-- = range

val _ = print "As infix operator (--):\n"
val _ = print ("  2 -- 5 = [" ^ String.concatWith "," (map Int.toString (2 -- 5)) ^ "]\n")
val _ = print ("  1 -- 6 = [" ^ String.concatWith "," (map Int.toString (1 -- 6)) ^ "]\n\n")

(* ========================================== *)
(*              EXERCISES                      *)
(* ========================================== *)

val _ = print "========================================\n"
val _ = print "             EXERCISES                  \n"
val _ = print "========================================\n\n"

(* ------------------------------------------ *)
(* EXERCISE 1: Sum of range                   *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 1: Sum of Range\n"
val _ = print "  Write sumRange(m, n) that returns the sum of [m, m+1, ..., n-1]\n"
val _ = print "  Example: sumRange(1, 5) = 1+2+3+4 = 10\n\n"

(* TODO: Implement sumRange *)
fun sumRange (m, n) = 0  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("  sumRange(1, 5) = " ^ Int.toString (sumRange(1, 5)) ^ "\n")
val _ = print ("  sumRange(0, 4) = " ^ Int.toString (sumRange(0, 4)) ^ "\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 2: Inclusive range                *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 2: Inclusive Range\n"
val _ = print "  Write rangeIncl(m, n) that returns [m, m+1, ..., n] (includes n)\n"
val _ = print "  Example: rangeIncl(2, 5) = [2, 3, 4, 5]\n\n"

(* TODO: Implement rangeIncl *)
fun rangeIncl (m, n) = []  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("  rangeIncl(2, 5) = [" ^ String.concatWith "," (map Int.toString (rangeIncl(2,5))) ^ "]\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 3: Descending range               *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 3: Descending Range\n"
val _ = print "  Write rangeDesc(m, n) that returns [m, m-1, ..., n+1] (descending)\n"
val _ = print "  Example: rangeDesc(5, 2) = [5, 4, 3]\n\n"

(* TODO: Implement rangeDesc *)
fun rangeDesc (m, n) = []  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("  rangeDesc(5, 2) = [" ^ String.concatWith "," (map Int.toString (rangeDesc(5,2))) ^ "]\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 4: Range with step                *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 4: Range with Step\n"
val _ = print "  Write rangeStep(m, n, step) that returns [m, m+step, m+2*step, ...]\n"
val _ = print "  Example: rangeStep(0, 10, 2) = [0, 2, 4, 6, 8]\n\n"

(* TODO: Implement rangeStep *)
fun rangeStep (m, n, step) = []  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("  rangeStep(0, 10, 2) = [" ^ String.concatWith "," (map Int.toString (rangeStep(0,10,2))) ^ "]\n\n")
*)

(* ------------------------------------------ *)
(* EXERCISE 5: Product of range               *)
(* ------------------------------------------ *)
val _ = print "EXERCISE 5: Product of Range (Factorial!)\n"
val _ = print "  Write prodRange(m, n) that returns m * (m+1) * ... * (n-1)\n"
val _ = print "  Example: prodRange(1, 5) = 1*2*3*4 = 24\n"
val _ = print "  Hint: prodRange(1, n+1) = n!\n\n"

(* TODO: Implement prodRange *)
fun prodRange (m, n) = 1  (* Replace with your implementation *)

(* Uncomment to test:
val _ = print ("  prodRange(1, 5) = " ^ Int.toString (prodRange(1, 5)) ^ "\n")
val _ = print ("  prodRange(1, 6) = " ^ Int.toString (prodRange(1, 6)) ^ " (5!)\n\n")
*)

(* ========================================== *)
(*              SOLUTIONS                      *)
(* ========================================== *)
(*
   Scroll down for solutions...










   SOLUTIONS:

   (* Exercise 1 *)
   fun sumRange (m, n) = if m = n then 0
                         else m + sumRange(m + 1, n)

   (* Exercise 2 *)
   fun rangeIncl (m, n) = if m > n then []
                          else m :: rangeIncl(m + 1, n)

   (* Exercise 3 *)
   fun rangeDesc (m, n) = if m = n then []
                          else m :: rangeDesc(m - 1, n)

   (* Exercise 4 *)
   fun rangeStep (m, n, step) = if m >= n then []
                                else m :: rangeStep(m + step, n, step)

   (* Exercise 5 *)
   fun prodRange (m, n) = if m = n then 1
                          else m * prodRange(m + 1, n)
*)
