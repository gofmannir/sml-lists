(* Building a List - SML Demo *)
(* Every list is either: Empty ([]) or An element followed by a list (head::tail) *)
val _ = print "=====================================\n"

(* Function to show head and tail of a list *)
fun showHeadTail [] = print "[] <=> [] (empty list cannot be disassembled)\n"
  | showHeadTail (x::xs) =
      let
        val headStr = Int.toString x
        val tailStr = "[" ^ String.concatWith "," (map Int.toString xs) ^ "]"
      in
        print ("[" ^ headStr ^
               (if null xs then "" else "," ^ String.concatWith "," (map Int.toString xs)) ^
               "] <=> Head = " ^ headStr ^ ", Tail = " ^ tailStr ^ "\n")
      end

val _ = showHeadTail [1, 2, 3, 4]
val _ = showHeadTail [1, 2]
val _ = showHeadTail [1]
val _ = showHeadTail []

val list1 = 1 :: [2, 3, 4]
val list2 = 1 :: []
val list3 = 1 :: 2 :: []

(* What will happen here? *)
(* val list4 = 1 :: 2 *)
