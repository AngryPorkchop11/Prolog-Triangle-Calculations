/* swipl -s threepoints.pl*/
vertical(point2d(X,_Y),point2d(X,_Z)).
horizontal(point2d(_X,Y),point2d(_Z,Y)).
/***FORMULAS***/
pythagorean(LHS1, LHS2, RHS):-
  (LHS1)^2 + (LHS2)^2 =:= (RHS)^2.

pythagorean_converse_Less(LHS1, LHS2, RHS):-
  (LHS1)^2+(LHS2)^2>(RHS)^2 .

pythagorean_converse_Great(LHS1, LHS2, RHS):-
  (LHS1)^2+(LHS2)^2<(RHS)^2 .

/***LINE***/
calculate_line(LHS1, LHS2, RHS) :-
  LHS1 + LHS2 =:= RHS.
/*AB -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AB > BC, AB > AC,
  calculate_line(BC, AC, AB).
/*BC -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  BC > AB, BC > AC,
  calculate_line(AB, AC, BC).
/*AC -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AC > AB, AC > BC,
  calculate_line(AB, BC, AC).

/***TRIANGLE***/
triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  /*BC*/ XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  /*AC*/ XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  /*AB*/ XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  P is A+B+C,
  Semi is P/2,
  X is Semi*(Semi - A)*(Semi - B)*(Semi - C), X >= 0, Area is sqrt(X),
  Area =\= 0.

/***ISOSCELES***/
/*AB is different*/
isosceles(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AB \= BC, AB \= AC, BC =:= AC.

/*BC -> is different*/
isosceles(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  BC \= AB, BC \= AC, AB =:= AC.

/*AC -> is different*/
isosceles(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AC \= AB, AC \= BC, AB =:= BC.

/*All sides are same*/
isosceles(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  equilateral(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)).

/***EQUILATERAL***/
equilateral(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AB =:= BC, AB =:= AC, BC =:= AC.

/***RIGHT***/
/*A -> RHS*/
right(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  (A > B, A > C),
  pythagorean(C,B,A).

/*B -> RHS*/
right(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  (B > A, B > C),
  pythagorean(C,A,B).

/*C -> RHS*/
right(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  (C > A, C > B),
  pythagorean(B,A,C).

/***SCALENE***/
scalene(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XAB is ((X2-X1)^2)+((Y2-Y1)^2), XAB >= 0, AB is sqrt(XAB),
  XBC is ((X3-X1)^2)+((Y3-Y1)^2), XBC >= 0, BC is sqrt(XBC),
  XAC is ((X3-X2)^2)+((Y3-Y2)^2), XAC >= 0, AC is sqrt(XAC),
  AB \= BC, AB \= AC, BC \= AC.

/***ACUTE***/
/*A -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  A > B, A > C,
  pythagorean_converse_Less(B,C,A).

/*==A -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  A =:= B, C < A, C < B,
  pythagorean_converse_Less(B,C,A).

/*B -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  B > A, B > C,
  pythagorean_converse_Less(A,C,B).

/*==B -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  C =:= B, A < B, A < C,
  pythagorean_converse_Less(A,C,B).

/*C -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  C > A, C > B,
  pythagorean_converse_Less(C,A,B).

/*==C -> RHS*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  A =:= C, A < B, A < C,
  pythagorean_converse_Less(C,A,B).

/*All sides ==*/
acute(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  A =:= C, A =:= B, B =:= C,
  pythagorean_converse_Less(C,A,B).

/***OBTUSE***/
/*A -> RHS*/
obtuse(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  A > B, A > C,
  pythagorean_converse_Great(B,C,A).

/*B -> RHS*/
obtuse(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  B > A, B > C,
  pythagorean_converse_Great(A,C,B).

/*C -> RHS*/
obtuse(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)):-
  XA is ((X3-X1)^2)+((Y3-Y1)^2), XA >= 0, A is sqrt(XA),
  XB is ((X3-X2)^2)+((Y3-Y2)^2), XB >= 0, B is sqrt(XB),
  XC is ((X2-X1)^2)+((Y2-Y1)^2), XC >= 0, C is sqrt(XC),
  C > A, C > B,
  pythagorean_converse_Great(C,A,B).
