/*LINE*/
calculate_line(LHS1,LHS2,RHS) :-
  LHS1 + LHS2 =:= RHS.
/*BC -> RHS*/
line(point2d(X1,Y1),point2d(X2,Y2),point2d(X3,Y3)) :-
  AB is sqrt(((X2-X1)^2)+((Y2-Y1)^2)),write('AB = '),print(AB),nl,
  BC is sqrt(((X3-X1)^2)+((Y3-Y1)^2)),write('BC = '),print(BC),nl,
  AC is sqrt(((X3-X2)^2)+((Y3-Y2)^2)),write('AC = '),print(AC),nl,
  BC > AB, BC > AC,
  calculate_line(AB,AC,BC).
