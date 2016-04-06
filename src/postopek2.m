function [Qp b Y2] = postopek2(X,Y)
  format free
  
  m = columns(X);
  n = rows(X)
  
  avgX = sum(X, 2)/m;
  avgY = sum(Y, 2)/m;
  
  X1 = X-avgX;
  Y1 = Y-avgY;
  
  X2 = X1;
  #Ce imamo tri dimenzije rešujemo sistem X*Q=y, pri cemer X v prvem stolpcu vsebuje vse koordinate x1, 
  #v drugem stolpcu vse koordinate x2 in v tretjem stolpcu vse koordinate x3
  #Po vrsticah je enacba x1*qi1 + x2*qi2 + x3*qi3 = y1i
  #Vektor p je resitev in vsebuje (qi1;qi2;qi3)
  for i = 1:n
    p= X2'\(Y1(i,:))';
    Q(i,1:n) = p(1:n);
  endfor
  

  [Qp R] = qr(Q);
  
  diagonale = diag(R)
  diagonale = sign(diagonale)
  Qp = Qp * diag(diagonale)
  
  Y2 = Qp*X1;
  plot(X1(1, :), X1(2, :), Y1(1, :), Y1(2, :), Y2(1, :), Y2(2, :))
  
  b = avgY - avgX;
  
  Y2 = Y2 .+ avgX .+ b;
  

endfunction
