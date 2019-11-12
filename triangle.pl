triangle(point2d(X1,Y1), point2d(X2,Y2), point2d(X3,Y3)) :-
  A is sqrt(((X3-X1)^2)+((Y3-Y1)^2)),write('A = '),print(A),nl,
  B is sqrt(((X3-X2)^2)+((Y3-Y2)^2)),write('B = '),print(B),nl,
  C is sqrt(((X2-X1)^2)+((Y2-Y1)^2)),write('C = '),print(C),nl,
  perimeter is A+B+C,write('P = '),print(perimeter),nl,
  semi is perimeter/2,write('S = '),print(semi),nl,
  area = sqrt(semi(semi - A)*(semi - B)*(semi - C)),
  area \= 0.
