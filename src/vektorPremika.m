function [b] = vektorPremika(X, Y)
  showPlot = 0;
  
	X = [
	1, 1, 1;
	1, 2, 1;
	2, 2, 3;
	];
  
	Y = X + ones(1, 3)*2;
 
	%povprecje tock avgX je tezisce mnozice tock X
	avgX = sum(X)./ numel(X(:, 1));
  
  %tezisce odstejemo od obeh mnozic, da se X prestavi
  %v izhodisce, vektor premika X->Y pa se ne pokvari
  X = X .- avgX;
  Y = Y .- avgX;

  %izracunamo tezisce monzice Y
  avgY = sum(Y) ./ numel(Y(:, 1));
  
  %b je kar tezisce mnozice Y, ker smo X prestavili v izhodisce, b = avgY - 0 = avgY
  b = avgY
  
  if showPlot > 0
    avgX = sum(X)./ numel(X(:, 1));
    hold on
    plot3(X(:,1), X(:, 2), X(:, 3), 'xr')
    plot3(avgX(:,1), avgX(:, 2), avgX(:, 3), 'o')
    plot3(Y(:,1), Y(:, 2), Y(:, 3), 'xg')
    plot3(b(:,1), b(:, 2), b(:, 3), 'o')
    quiver3(0, 0, 0, b(1), b(2), b(3), '-')
  endif
end