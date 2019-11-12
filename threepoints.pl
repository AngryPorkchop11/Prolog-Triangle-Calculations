/* swipl -s threepoints.pl*/
vertical(point2d(X,_Y),point2d(X,_Z)).
horizontal(point2d(_X,Y),point2d(_Z,Y)).
/***LINE***/
calculate_line(LHS1, LHS2, RHS) :-
  LHS1 + LHS2 =:= RHS.
/*AB -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  AB is sqrt(((X2-X1)^2)+((Y2-Y1)^2)),
  BC is sqrt(((X3-X1)^2)+((Y3-Y1)^2)),
  AC is sqrt(((X3-X2)^2)+((Y3-Y2)^2)),
  AB > BC, AB > AC,
  calculate_line(BC, AC, AB).
/*BC -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  AB is sqrt(((X2-X1)^2)+((Y2-Y1)^2)),
  BC is sqrt(((X3-X1)^2)+((Y3-Y1)^2)),
  AC is sqrt(((X3-X2)^2)+((Y3-Y2)^2)),
  BC > AB, BC > AC,
  calculate_line(AB, AC, BC).
/*AC -> RHS*/
line(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  AB is sqrt(((X2-X1)^2)+((Y2-Y1)^2)),
  BC is sqrt(((X3-X1)^2)+((Y3-Y1)^2)),
  AC is sqrt(((X3-X2)^2)+((Y3-Y2)^2)),
  AC > AB, AC > BC,
  calculate_line(AB, BC, AC).

/***TRIANGLE***/
triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)).

/*
triangle(point2d(x,y), point2d(x,y), point2d(x,y))
isosceles(point2d(x,y), point2d(x,y), point2d(x,y))
equilateral(point2d(x,y), point2d(x,y), point2d(x,y))
right(point2d(x,y), point2d(x,y), point2d(x,y))
scalene(point2d(x,y), point2d(x,y), point2d(x,y))
acute(point2d(x,y), point2d(x,y), point2d(x,y))
obtuse(point2d(x,y), point2d(x,y), point2d(x,y))
*/
