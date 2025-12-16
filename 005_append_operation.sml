(* ========================================== *)
(*      THE BUILT-IN APPEND OPERATION (@)     *)
(* ========================================== *)

val _ = print "=== THE BUILT-IN APPEND OPERATION (@) ===\n\n"

(*
   Puts the elements of one list after those of another list
   [x1,...,xm] @ [y1,...,yn] = [x1,...,xm,y1,...,yn]

   Type: 'a list * 'a list -> 'a list
*)

val _ = print "Puts elements of one list after another:\n"
val _ = print "  [x1,...,xm] @ [y1,...,yn] = [x1,...,xm,y1,...,yn]\n\n"

(* ------------------------------------------ *)
(* IMPLEMENTATION                             *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "IMPLEMENTATION\n"
val _ = print "========================================\n\n"

val _ = print "  infix @\n"
val _ = print "  fun []      @ ys = ys\n"
val _ = print "    | (x::xs) @ ys = x :: (xs @ ys)\n\n"

(* Our own append to demonstrate *)
fun append ([], ys) = ys
  | append (x::xs, ys) = x :: append(xs, ys)

(* ------------------------------------------ *)
(* EXAMPLES                                   *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "EXAMPLES\n"
val _ = print "========================================\n\n"

val _ = print "String lists:\n"
val strResult = ["Append", "is"] @ ["never", "boring"]
val _ = print "  [\"Append\",\"is\"] @ [\"never\",\"boring\"]\n"
val _ = print ("  = [" ^ String.concatWith "," (map (fn s => "\"" ^ s ^ "\"") strResult) ^ "]\n\n")

val _ = print "Integer lists:\n"
val _ = print ("  [1,2,3] @ [4,5] = [" ^ String.concatWith "," (map Int.toString ([1,2,3] @ [4,5])) ^ "]\n")
val _ = print ("  [] @ [1,2,3]    = [" ^ String.concatWith "," (map Int.toString ([] @ [1,2,3])) ^ "]\n")
val _ = print ("  [1,2,3] @ []    = [" ^ String.concatWith "," (map Int.toString ([1,2,3] @ [])) ^ "]\n\n")

val _ = print "List of lists:\n"
val _ = print "  [[2,4,6,8], [3,9]] @ [[5], [7]]\n"
val _ = print "  = [[2,4,6,8], [3,9], [5], [7]] : int list list\n\n"

(* ------------------------------------------ *)
(* TIME COMPLEXITY ANALYSIS                   *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "TIME COMPLEXITY ANALYSIS\n"
val _ = print "========================================\n\n"

val _ = print "SINGLE APPEND: O(n) where n = length of FIRST list\n"
val _ = print "------------------------------------------------\n"
val _ = print "  xs @ ys traverses only xs, not ys\n"
val _ = print "  [1,2,3] @ [4,5,6,7,8,9,10]  -- only 3 steps!\n\n"

val _ = print "Trace of [1,2,3] @ [4,5]:\n"
val _ = print "  [1,2,3] @ [4,5]\n"
val _ = print "  = 1 :: ([2,3] @ [4,5])\n"
val _ = print "  = 1 :: (2 :: ([3] @ [4,5]))\n"
val _ = print "  = 1 :: (2 :: (3 :: ([] @ [4,5])))\n"
val _ = print "  = 1 :: (2 :: (3 :: [4,5]))\n"
val _ = print "  = [1,2,3,4,5]\n\n"

val _ = print "REPEATED APPEND: O(n^2) - DANGER!\n"
val _ = print "---------------------------------\n"
val _ = print "  Building a list by appending single elements:\n\n"

(* fun badReverse [] = []
              | (x::xs) = ??? *)







val _ = print "  (* BAD: O(n^2) *)\n"
val _ = print "  fun badReverse [] = []\n"
val _ = print "    | badReverse (x::xs) = badReverse xs @ [x]\n\n"

fun badReverse [] = []
  | badReverse (x::xs) = badReverse xs @ [x]

val _ = print "  Trace of badReverse [1,2,3]:\n"
val _ = print "    badReverse [1,2,3]\n"
val _ = print "    = badReverse [2,3] @ [1]        -- will traverse result\n"
val _ = print "    = (badReverse [3] @ [2]) @ [1]  -- traverse again\n"
val _ = print "    = (([] @ [3]) @ [2]) @ [1]      -- and again\n"
val _ = print "    = [3,2,1]\n\n"

val _ = print "  Cost: 0 + 1 + 2 + ... + (n-1) = n(n-1)/2 = O(n^2)\n\n"

(* ------------------------------------------ *)
(* IS IT TAIL RECURSIVE?                      *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "IS APPEND TAIL RECURSIVE? NO!\n"
val _ = print "========================================\n\n"

val _ = print "  fun [] @ ys = ys\n"
val _ = print "    | (x::xs) @ ys = x :: (xs @ ys)\n"
val _ = print "                     ^^^^\n"
val _ = print "                     Work AFTER recursive call!\n\n"

val _ = print "  The cons (::) happens AFTER the recursive call returns.\n"
val _ = print "  This means the stack grows with each call.\n\n"

val _ = print "TAIL-RECURSIVE REVERSE (using accumulator):\n"
val _ = print "  fun revTR xs =\n"
val _ = print "      let fun helper [] acc = acc\n"
val _ = print "            | helper (x::xs) acc = helper xs (x::acc)\n"
val _ = print "      in helper xs []\n"
val _ = print "      end\n\n"

fun revTR xs =
    let fun helper [] acc = acc
          | helper (x::xs) acc = helper xs (x::acc)
    in helper xs [] (* new memory for the acc *)
    end

val _ = print "  Trace of revTR [1,2,3]:\n"
val _ = print "    helper [1,2,3] []\n"
val _ = print "    helper [2,3]   [1]        -- 1 prepended to acc\n"
val _ = print "    helper [3]     [2,1]      -- 2 prepended to acc\n"
val _ = print "    helper []      [3,2,1]    -- 3 prepended to acc\n"
val _ = print "    = [3,2,1]                 -- return acc\n\n"

val _ = print ("  revTR [1,2,3,4,5] = [" ^ String.concatWith "," (map Int.toString (revTR [1,2,3,4,5])) ^ "]\n\n")

val _ = print "  Why is this O(n)?\n"
val _ = print "    - Each element visited exactly once\n"
val _ = print "    - :: (cons) is O(1)\n"
val _ = print "    - No @ operator, so no repeated traversals\n\n"

(* ------------------------------------------ *)
(* WHY CAN'T @ BE USED IN PATTERNS?           *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "WHY CAN'T @ BE USED IN PATTERNS?\n"
val _ = print "========================================\n\n"

val _ = print "  (* This is INVALID: *)\n"
val _ = print "  fun f (xs @ ys) = ...   (* ERROR! *)\n\n"

val _ = print "  Reason: @ is AMBIGUOUS in pattern matching!\n\n"

val _ = print "  For [1,2,3], how would you split it?\n"
val _ = print "    [] @ [1,2,3]      ?\n"
val _ = print "    [1] @ [2,3]       ?\n"
val _ = print "    [1,2] @ [3]       ?\n"
val _ = print "    [1,2,3] @ []      ?\n\n"

val _ = print "  There are n+1 ways to split a list of length n!\n"
val _ = print "  Pattern matching requires UNIQUE decomposition.\n\n"

val _ = print "  Only :: (cons) can be used in patterns because:\n"
val _ = print "    x::xs has exactly ONE meaning:\n"
val _ = print "    x = first element, xs = rest of list\n\n"

(* ------------------------------------------ *)
(* GOOD VS BAD PATTERNS                       *)
(* ------------------------------------------ *)
val _ = print "========================================\n"
val _ = print "GOOD VS BAD: AVOIDING O(n^2)\n"
val _ = print "========================================\n\n"

val _ = print "BAD - O(n^2): Building with @\n"
val _ = print "  fun badReverse [] = []\n"
val _ = print "    | badReverse (x::xs) = badReverse xs @ [x]\n\n"

val _ = print "GOOD - O(n): Building with :: and accumulator\n"
val _ = print "  fun goodReverse xs =\n"
val _ = print "      let fun helper [] acc = acc\n"
val _ = print "            | helper (x::xs) acc = helper xs (x::acc)\n"
val _ = print "      in helper xs []\n"
val _ = print "      end\n\n"

fun goodReverse xs =
    let fun helper [] acc = acc
          | helper (x::xs) acc = helper xs (x::acc)
    in helper xs []
    end

val _ = print "Verification:\n"
val _ = print ("  badReverse [1,2,3,4,5]  = [" ^ String.concatWith "," (map Int.toString (badReverse [1,2,3,4,5])) ^ "]\n")
val _ = print ("  goodReverse [1,2,3,4,5] = [" ^ String.concatWith "," (map Int.toString (goodReverse [1,2,3,4,5])) ^ "]\n\n")

(* ------------------------------------------ *)
(* SUMMARY                                    *)
(* ------------------------------------------ *)
val _ = print "=== SUMMARY ===\n"
val _ = print "  xs @ ys         - append lists, O(length of xs)\n"
val _ = print "  Repeated @      - can lead to O(n^2)\n"
val _ = print "  Not tail-rec    - cons after recursive call\n"
val _ = print "  Can't pattern   - ambiguous decomposition\n"
val _ = print "  Use :: + acc    - for O(n) list building\n"
