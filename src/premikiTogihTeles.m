function [A b] = premikiTogihTeles(X, Y)
  %dobimo tezisca telesa X  in Y
  vsotaTockX = sum(X')/size(X,2);
  vsotaTockY = sum(Y')/size(Y,2);
  %narisemo 'staube'
  plot(X(1,:), X(2,:), Y(1,:),Y(2,:))
  %premaknemo telesi v srediscno lego
  X1=[X(1,:).-vsotaTockX(1);X(2,:).-vsotaTockX(2);X(3,:).-vsotaTockX(3)];
  Y1=[Y(1,:).-vsotaTockY(1);Y(2,:).-vsotaTockY(2);Y(3,:).-vsotaTockY(3)];
  
  %dobimo matriko C = Y * X'
  C = Y1*X1';
  
  %naredimo SVD razcep matrike C, da dobimo diagonalno matriko S
  %s singularnimi vrednostimi matrike C, njo nadomestimo z matriko D
  %ki ima po diagonali enice, zadnja(spodnje desna) enica pa ima pri 
  %zrcaljenju predznak - (drugace gre za rotacijo in je predznak +)
  [U S V] = svd(C);
  determinanta = det(C);
  D = eye(3);
  if(determinanta < 0)
     D(3,3) = -1;
  endif
  
  %isakan matrika A = UDV'
  A = U*D*V';
  
  %izracun razdalje težišc v metricnem sistemu
  b = vsotaTockY-vsotaTockX;
  %za izracun velikosti vektorja razdalje
  sizeOfb = sqrt(b*b');
  
  %preverimo ali se vnesene tocke ujemajo s tockami matrike Y = A * X +b
  %Y2 =A*X;
  %Y2=[Y2(1,:).+b(1);Y2(2,:).+b(2);Y2(3,:).+b(3)];  
  
  %neki se zjebavm(:
   
   Y2 =A*X;
   vsotaTockX1 = sum(Y2')/size(Y2,2);
   Y2=[Y2(1,:).-vsotaTockX1(1);Y2(2,:).-vsotaTockX1(2);Y2(3,:).-vsotaTockX1(3)];
   Y2=[Y2(1,:).+vsotaTockY(1);Y2(2,:).+vsotaTockY(2);Y2(3,:).+vsotaTockY(3)];
   
  %konec

  %narišemo staro matriko Y ter novo matriko Y
  Y2
  Y
  hold on
  plot(horzcat(X(1,:),X(1,1)),horzcat(X(2,:),X(2,1)),'b');
  plot(horzcat(Y(1,:),Y(1,1)),horzcat(Y(2,:),Y(2,1)), 'k')
  plot(horzcat(Y2(1,:),Y2(1,1)),horzcat(Y2(2,:),Y2(2,1)), 'r')
  
  %funkcija za izracun razdalje dveh tock na GPS-u
  haversine(vsotaTockX(1,2),vsotaTockX(1,1),vsotaTockY(1,2),vsotaTockY(1,1)); 
  
   %plot3(Y(1,:),Y(2,:),Y(3,:),'bo',X(1,:), X(2,:),X(3,:),'*')
end

function rad = radians(degree) 
% degrees to radians
    rad = degree .* pi / 180;
end; 
 
function [a,c,dlat,dlon]=haversine(lat1,lon1,lat2,lon2)
% HAVERSINE_FORMULA.AWK - converted from AWK 
    dlat = radians(lat2-lat1);
    dlon = radians(lon2-lon1);
    lat1 = radians(lat1);
    lat2 = radians(lat2);
    a = (sin(dlat./2)).^2 + cos(lat1) .* cos(lat2) .* (sin(dlon./2)).^2;
    c = 2 .* asin(sqrt(a));
    arrayfun(@(x) printf("distance: %.4f km\n",6372.8 * x), c);
end;