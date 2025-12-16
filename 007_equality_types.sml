(* ========================================== *)
(*     WHY REAL DOESN'T SUPPORT EQUALITY      *)
(*        The 'a vs ''a Distinction           *)
(* ========================================== *)

val _ = print "=== WHY REAL DOESN'T SUPPORT EQUALITY IN SML ===\n\n"

(* ========================================== *)
(* => THE BROKEN LAW OF LOGIC           *)
(* ========================================== *)
val _ = print "========================================\n"
val _ = print "=> Why x = x Isn't Always True\n"
val _ = print "========================================\n\n"

val _ = print "THE EXPECTATION:\n"
val _ = print "  In logic, Reflexivity states: x = x (always true)\n"
val _ = print "  A value should always equal itself.\n\n"

val _ = print "THE REALITY OF FLOATS:\n"
val _ = print "  IEEE 754 defines NaN (Not a Number) for invalid operations.\n"
val _ = print "  Examples: 0.0/0.0, sqrt(-1), infinity - infinity\n\n"

val _ = print "THE RULE BREAKER:\n"
val _ = print "  NaN is NEVER equal to anything, not even itself!\n"
val _ = print "  NaN == NaN evaluates to FALSE.\n\n"

(* Demonstrate the paradox *)
val x : real = 0.0 / 0.0   (* x becomes NaN *)
val isNaN = Real.isNan x

val _ = print "CODE EXAMPLE:\n"
val _ = print "  val x : real = 0.0 / 0.0   (* x becomes NaN *)\n"
val _ = print ("  Real.isNan x = " ^ Bool.toString isNaN ^ "\n\n")

(* We can't directly use = on reals, but we can show the concept *)
val _ = print "THE PARADOX:\n"
val _ = print "  If we COULD write: x = x\n"
val _ = print "  For x = NaN, it would return FALSE!\n"
val _ = print "  This breaks the fundamental law of logic.\n\n"

val _ = print "  Using Real.== (unsafe comparison):\n"
val selfEqual = Real.== (x, x)
val _ = print ("  Real.==(x, x) = " ^ Bool.toString selfEqual ^ "\n")
val _ = print "  \"Logic is broken\" - NaN does not equal itself!\n\n"

(* ========================================== *)
(* => THE PRECISION TRAP                *)
(* ========================================== *)
val _ = print "========================================\n"
val _ = print "=> The Danger of Approximation\n"
val _ = print "========================================\n\n"

val _ = print "THE PROBLEM:\n"
val _ = print "  Floating-point numbers are BINARY approximations.\n"
val _ = print "  Many decimal values cannot be represented exactly.\n\n"

val _ = print "THE CLASSIC EXAMPLE:\n"
val sum = 0.1 + 0.2
val target = 0.3

val _ = print "  val sum = 0.1 + 0.2\n"
val _ = print ("  sum = " ^ Real.toString sum ^ "\n")
val _ = print "        (Expected 0.3, got 0.30000000000004!)\n\n"

val _ = print "  val target = 0.3\n"
val _ = print ("  target = " ^ Real.toString target ^ "\n\n")

val areEqual = Real.== (sum, target)
val _ = print "  Real.==(sum, target) = "
val _ = print (Bool.toString areEqual ^ "\n")
val _ = print "  They are NOT equal! This is a classic bug source.\n\n"

val _ = print "THE SAFE SOLUTION:\n"
val _ = print "  Don't ask: \"Are these identical?\"\n"
val _ = print "  Ask: \"Are these close enough?\"\n\n"

val epsilon = 0.0001
val difference = Real.abs(sum - target)
val closeEnough = difference < epsilon

val _ = print "  val epsilon = 0.0001\n"
val _ = print ("  Real.abs(sum - target) = " ^ Real.toString difference ^ "\n")
val _ = print ("  Real.abs(sum - target) < epsilon = " ^ Bool.toString closeEnough ^ "\n")
val _ = print "  This is the CORRECT way to compare floats!\n\n"

(* Helper function for approximate equality *)
fun approxEqual (x, y, eps) = Real.abs(x - y) < eps

val _ = print "  fun approxEqual (x, y, eps) = Real.abs(x - y) < eps\n"
val _ = print ("  approxEqual(0.1 + 0.2, 0.3, 0.0001) = " ^
               Bool.toString (approxEqual(0.1 + 0.2, 0.3, 0.0001)) ^ "\n\n")

(* ========================================== *)
(* SLIDE 3: THE SML SOLUTION                  *)
(* ========================================== *)
val _ = print "========================================\n"
val _ = print "SLIDE 3: The SML Solution (Equality Types)\n"
val _ = print "========================================\n\n"

val _ = print "TWO WORLDS OF TYPES:\n"
val _ = print "  SML splits generic types into two categories:\n\n"

val _ = print "  'a  (Polymorphic Type)\n"
val _ = print "      - Can be ANY type\n"
val _ = print "      - Cannot use = operator\n"
val _ = print "      - Includes: real, functions, etc.\n\n"

val _ = print "  ''a (Equality Type)\n"
val _ = print "      - Only types that support logical equality\n"
val _ = print "      - CAN use = operator\n"
val _ = print "      - Includes: int, string, bool, char, lists of ''a\n\n"

val _ = print "THE COMPILER'S JOB:\n"
val _ = print "  When you write a function using =, SML infers ''a\n\n"

val _ = print "  fun isSame(x, y) = (x = y)\n"
val _ = print "  (* SML infers: val isSame = fn : ''a * ''a -> bool *)\n\n"

fun isSame(x, y) = (x = y)

val _ = print "WHAT WORKS:\n"
val _ = print ("  isSame(5, 5)         = " ^ Bool.toString (isSame(5, 5)) ^ "  (* int is ''a *)\n")
val _ = print ("  isSame(\"a\", \"a\")     = " ^ Bool.toString (isSame("a", "a")) ^ "  (* string is ''a *)\n")
val _ = print ("  isSame(true, false)  = " ^ Bool.toString (isSame(true, false)) ^ " (* bool is ''a *)\n")
val _ = print ("  isSame(#\"x\", #\"x\")   = " ^ Bool.toString (isSame(#"x", #"x")) ^ "  (* char is ''a *)\n")
val _ = print ("  isSame([1,2], [1,2]) = " ^ Bool.toString (isSame([1,2], [1,2])) ^ "  (* int list is ''a *)\n\n")

val _ = print "WHAT DOESN'T WORK:\n"
val _ = print "  isSame(5.0, 5.0)\n"
(* val _ = print ("  isSame(5.0, 5.0)         = " ^ Bool.toString (isSame(5.0, 5.0)) ^ "  real is NOT ''a\n") *)
val _ = print "  (* ERROR: real is NOT an equality type! *)\n"
val _ = print "  (* Compiler says: type real is not an equality type *)\n\n"

(* ========================================== *)
(* SUMMARY TABLE                              *)
(* ========================================== *)
val _ = print "========================================\n"
val _ = print "SUMMARY: Equality Types\n"
val _ = print "========================================\n\n"

val _ = print "+-------------+------------+-------------------------+\n"
val _ = print "| Type        | Equality?  | Why?                    |\n"
val _ = print "+-------------+------------+-------------------------+\n"
val _ = print "| int         | YES (''a)  | Exact representation    |\n"
val _ = print "| string      | YES (''a)  | Exact representation    |\n"
val _ = print "| bool        | YES (''a)  | Only true/false         |\n"
val _ = print "| char        | YES (''a)  | Exact representation    |\n"
val _ = print "| int list    | YES (''a)  | Elements are ''a        |\n"
val _ = print "+-------------+------------+-------------------------+\n"
val _ = print "| real        | NO  ('a)   | NaN paradox + precision |\n"
val _ = print "| functions   | NO  ('a)   | Can't compare code      |\n"
val _ = print "| real list   | NO  ('a)   | Contains non-''a type   |\n"
val _ = print "+-------------+------------+-------------------------+\n\n"

val _ = print "KEY TAKEAWAYS:\n"
val _ = print "  1. NaN breaks x = x (Reflexivity violation)\n"
val _ = print "  2. 0.1 + 0.2 != 0.3 (Precision trap)\n"
val _ = print "  3. SML bans = on real to PROTECT you\n"
val _ = print "  4. Use Real.abs(x - y) < epsilon instead\n"
val _ = print "  5. ''a types guarantee logical equality\n"
