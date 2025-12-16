(* Simple SML Script *)

(* Basic hello world *)
val _ = print "Hello, SML!\n"

(* Simple function: factorial *)
fun factorial 0 = 1
  | factorial n = n * factorial (n - 1)

val _ = print ("Factorial of 5: " ^ Int.toString (factorial 5) ^ "\n")

(* List operations *)
val myList = [1, 2, 3, 4, 5]
val doubled = map (fn x => x * 2) myList

val _ = print "Doubled list: "
val _ = app (fn x => print (Int.toString x ^ " ")) doubled
val _ = print "\n"

(* Sum of a list *)
fun sum [] = 0
  | sum (x::xs) = x + sum xs

val _ = print ("Sum of list: " ^ Int.toString (sum myList) ^ "\n")

(* Fibonacci *)
fun fib 0 = 0
  | fib 1 = 1
  | fib n = fib (n - 1) + fib (n - 2)

val _ = print ("Fibonacci of 10: " ^ Int.toString (fib 10) ^ "\n")
