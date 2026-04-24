(*
 * expr.sml
 * cs334
 *)

(* Magic constant to make datatypes print out fully *)
Control.Print.printDepth:= 100;
Control.Print.printLength:= 100;

datatype Expr = 
    VarX
  | VarY
  | Sine     of Expr
  | Cosine   of Expr
  | Average  of Expr * Expr
  | Times of Expr * Expr
  (* Extensions *)
  | AvgThree of Expr * Expr * Expr
  | AbsoluteVal of Expr
  | Negation of Expr;



(* build functions:
     Use these helper functions to generate elements of the Expr
     datatype rather than using the constructors directly.  This
     provides a little more modularity in the design of your program
*)
fun buildX()             = VarX;
fun buildY()             = VarY;
fun buildSine(e)         = Sine(e);
fun buildCosine(e)       = Cosine(e);
fun buildAverage(e1,e2)  = Average(e1,e2);
fun buildTimes(e1,e2)    = Times(e1,e2);

(* Extensions *)
fun buildAvgThree(e1, e2, e3) = AvgThree(e1, e2, e3);
fun buildAbsoluteVal(e)   =     AbsoluteVal(e);
fun buildNegation(e)      =     Negation(e); 




(* exprToString : Expr -> string
   Complete this function to convert an Expr to a string 
*)


fun exprToString (VarX) = "x"
| exprToString (VarY) = "y"
| exprToString (Sine(e)) = "sin(pi * " ^ exprToString(e) ^ ") "
| exprToString (Cosine(e)) = "cos(pi * " ^ exprToString(e) ^ ") "
| exprToString (Times(e1, e2)) = " " ^ exprToString(e1) ^ " * "^ exprToString(e2) ^ " "
| exprToString (Average (e1,e2)) = " (" ^ exprToString(e1) ^"  +  "^ exprToString(e2) ^")  / 2 "
(* Extensions *)
| exprToString (AvgThree (e1, e2, e3)) = " (" ^ exprToString(e1) ^"  +  "^ exprToString(e2) ^" + "^ exprToString(e3) ^")  / 3"
| exprToString (Negation(e)) = " ~ "^ exprToString(e) ^" "
| exprToString (AbsoluteVal(e)) = " abs " ^ exprToString(e) ^ " ";


(* eval : Expr -> real*real -> real
   Evaluator for expressions in x and y
 *)



fun eval (VarX) (x,y) = x
  | eval (VarY) (x ,y) = y
  | eval (Sine(e)) (x,y) = Math.sin(Math.pi * (eval e (x,y)))
  | eval (Average (e1, e2)) (x,y) = (eval e1 (x,y) + eval e2 (x,y)) / 2.0
  | eval (Cosine(e)) (x,y) = Math.cos(Math.pi * (eval e (x,y)))
  | eval (Times(e1, e2)) (x,y) = (eval e1 (x,y)) * (eval e2 (x, y)) 
  (* Extensions *)
  | eval (AvgThree(e1, e2, e3)) (x,y) = (eval e1 (x,y) + eval e2 (x,y) + eval e3 (x,y)) / 3.0
  | eval (AbsoluteVal(e)) (x,y) = Real.abs(eval e (x,y))
  | eval (Negation(e)) (x,y) = ~(eval e (x,y));




(*
val sampleExpr =
      buildCosine(buildSine(buildTimes(buildCosine(buildAverage(buildCosine(
      buildX()),buildTimes(buildCosine (buildCosine (buildAverage
      (buildTimes (buildY(),buildY()),buildCosine (buildX())))),
      buildCosine (buildTimes (buildSine (buildCosine
      (buildY())),buildAverage (buildSine (buildX()), buildTimes
      (buildX(),buildX()))))))),buildY())));
*)

(************** Add Testing Code Here ***************)
(* eval (Sine(Average(VarX,VarY))) (0.5,0.0);
eval (Sine(VarX)) (0.5,0.3);
eval sampleExpr (0.1,0.1);;
*)

(* exprToString(Average(Sine(VarX),Cosine(Times(VarX,VarY)))) *)

(*
*)
exprToString(AbsoluteVal(AvgThree(VarX,Cosine(Times(VarX,VarY)), Sine(VarX))));