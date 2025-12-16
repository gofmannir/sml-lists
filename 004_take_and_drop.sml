(* ========================================== *)
(*            TAKE AND DROP                   *)
(* ========================================== *)

val _ = print "=== TAKE AND DROP ===\n\n"

(*
   For a list xs = [x1, x2, x3, ..., xk, xk+1, ..., xn]

   take(k, xs) = [x1, x2, ..., xk]       (first k elements)
   drop(k, xs) = [xk+1, xk+2, ..., xn]   (all but first k elements)
*)

val _ = print "For xs = [x1, x2, ..., xk, xk+1, ..., xn]\n"
val _ = print "  take(k, xs) = [x1, x2, ..., xk]      (first k elements)\n"
val _ = print "  drop(k, xs) = [xk+1, ..., xn]        (rest after k)\n\n"

(* ------------------------------------------ *)
(* TAKE: first k elements                     *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "TAKE: first k elements\n"
val _ = print "========================================\n\n"

val _ = print "Type: int * 'a list -> 'a list\n\n"

val _ = print "Implementation:\n"
val _ = print "  fun take (0, _) = []\n"
val _ = print "    | take (i, x::xs) = x :: take (i-1, xs)\n\n"

fun take (0, _) = []
  | take (i, x::xs) = x :: take (i-1, xs)

val _ = print "Examples:\n"
val _ = print ("  take(3, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (take(3, [1,2,3,4,5]))) ^ "]\n")
val _ = print ("  take(2, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (take(2, [1,2,3,4,5]))) ^ "]\n")
val _ = print ("  take(0, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (take(0, [1,2,3,4,5]))) ^ "]\n\n")

(* Example with explode *)
val _ = print "With strings (using explode):\n"
val chars = take(5, explode "Throw Pascal to the dogs!")
val _ = print ("  take(5, explode \"Throw Pascal to the dogs!\")\n")
val _ = print ("  = [" ^ String.concatWith ", " (map (fn c => "#\"" ^ Char.toString c ^ "\"") chars) ^ "]\n")
val _ = print ("  = \"" ^ implode chars ^ "\"\n\n")

(* ------------------------------------------ *)
(* DROP: all but first k elements             *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "DROP: all but first k elements\n"
val _ = print "========================================\n\n"

val _ = print "Type: int * 'a list -> 'a list\n\n"

val _ = print "Implementation:\n"
val _ = print "  fun drop (0, xs) = xs\n"
val _ = print "    | drop (i, _::xs) = drop (i-1, xs)\n\n"

fun drop (0, xs) = xs
  | drop (i, _::xs) = drop (i-1, xs)

val _ = print "Examples:\n"
val _ = print ("  drop(3, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (drop(3, [1,2,3,4,5]))) ^ "]\n")
val _ = print ("  drop(2, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (drop(2, [1,2,3,4,5]))) ^ "]\n")
val _ = print ("  drop(0, [1,2,3,4,5]) = [" ^ String.concatWith "," (map Int.toString (drop(0, [1,2,3,4,5]))) ^ "]\n\n")

(* Example with explode *)
val _ = print "With strings (using explode):\n"
val chars2 = drop(6, explode "Throw Pascal to the dogs!")
val _ = print ("  drop(6, explode \"Throw Pascal to the dogs!\")\n")
val _ = print ("  = \"" ^ implode chars2 ^ "\"\n\n")

(* ------------------------------------------ *)
(* KEY PROPERTY                               *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "KEY PROPERTY\n"
val _ = print "========================================\n\n"

val _ = print "take(k, xs) @ drop(k, xs) = xs\n\n"

val xs = [1,2,3,4,5]
val k = 3
val result = take(k, xs) @ drop(k, xs)

val _ = print ("  take(3, [1,2,3,4,5]) @ drop(3, [1,2,3,4,5])\n")
val _ = print ("  = [" ^ String.concatWith "," (map Int.toString (take(k,xs))) ^ "] @ [" ^ String.concatWith "," (map Int.toString (drop(k,xs))) ^ "]\n")
val _ = print ("  = [" ^ String.concatWith "," (map Int.toString result) ^ "]\n\n")

(* ------------------------------------------ *)
(* SUMMARY                                    *)
(* ------------------------------------------ *)
val _ = print "=== SUMMARY ===\n"
val _ = print "  take(k, xs) - first k elements\n"
val _ = print "  drop(k, xs) - everything after first k elements\n"
val _ = print "  take(k, xs) @ drop(k, xs) = xs\n"
