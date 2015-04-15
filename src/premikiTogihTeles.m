function [A b] = premikiTogihTeles(X, Y)
  vsotaTockX = sum(X')/size(X,2);
  vsotaTockY = sum(Y')/size(Y,2);
  X=[X(1,:).-vsotaTockX(1);X(2,:).-vsotaTockX(2);X(3,:).-vsotaTockX(3)];
  Y=[Y(1,:).-vsotaTockY(1);Y(2,:).-vsotaTockY(2);Y(3,:).-vsotaTockY(3)];
  C = Y*X';
  [U S V] = svd(C);
  determinanta = det(C);
  D = eye(3);
  b = vsotaTockY-vsotaTockX;
  %b = sqrt(b*b');
  if(determinanta < 0)
     D(3,3) = -1;
  endif
  A = U*D*V';
  %plot3(Y(1,:),Y(2,:),Y(3,:),'bo',X(1,:), X(2,:),X(3,:),'*')
end