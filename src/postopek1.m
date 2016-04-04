function [Q b Y2] = postopek1(X, Y)
  format free
  dim = size(X, 1); #dimenzija
  count = size(X, 2); #st tock
  
  %dobimo tezisca telesa X  in Y
  avgX = sum(X, 2)/count;
  avgY = sum(Y, 2)/count;
  
  
  %premaknemo telesi v srediscno lego  
  X1 = X-avgX;
  Y1 = Y-avgY;
  
  
  
  %korak 1
  %dobimo matriko C = Y * X'
  %opomba: vse je ravno obratnih dimenzij,
  %torej tudi vse matrike obratno transponiramo itd.)
  C = Y1*X1';
  
  %naredimo SVD razcep matrike C, da dobimo diagonalno matriko S
  %s singularnimi vrednostimi matrike C, njo nadomestimo z matriko D
  %ki ima po diagonali enice, zadnja(spodnje desna) enica pa ima pri 
  %zrcaljenju predznak - (drugace gre za rotacijo in je predznak +)
  [U S V] = svd(C);
  determinanta = det(C);
  D = eye(dim);
  if(determinanta < 0)
     D(dim, dim) = -1;
  endif
  
  %iskana matrika Q = UDV'
  Q = U*D*V';
  
  %izracun razdalje sredisc (vektor premika)
  b = avgY-avgX;
  
  %se izracunan rezultat Y2 = Q*X' + b
  Y2 = Q*X1;
  Y2 = Y2 + avgX + b;
  plot(X1(1, :), X1(2, :), Y1(1, :), Y1(2, :), Y2(1, :), Y2(2, :))
  axis equal
  
  
 return;
 
%!demo1
%! x = [0 0;1 0; 1 1;0 1]';
%! y = [2 2; 3 2; 3 3; 2 3]';
%! [Q b y2] = postopek1(x, y)
%! axis([-1, 4], "equal");
%! plot(x(1, :), x(2, :), y(1, :), y(2, :), y2(1, :), y2(2, :))

%!demo2
%! x = [0 1 1 0; 0 0 1 1];
%! y = [1 1 0 0; 3 4 4 3];
%! [Q b y2] = postopek1(x, y)
%! axis([-1, 4], "equal");
%! plot(x(1, :), x(2, :), y(1, :), y(2, :), y2(1, :), y2(2, :))

%!demo3
%! load("pod1.txt");
%! [Q b y2] = postopek1(X, Y1)
%! axis([-1, 4], "equal")
%! plot3(X(1, :), X(2, :), X(3, :), ".", Y1(1, :), Y1(2, :), Y1(3, :), ".", y2(1, :), y2(2, :), y2(3, :), ".")

%!demo4
%! load("pod2.txt");
%! [Q b y2] = postopek1(X, Y2)
%! axis([-1, 4], "equal")
%! plot3(X(1, :), X(2, :), X(3, :), ".", Y2(1, :), Y2(2, :), Y2(3, :), ".", y2(1, :), y2(2, :), y2(3, :), ".")