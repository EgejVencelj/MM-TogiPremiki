function [] = primerjava (X, Y)
  [Q1 b1 pos1Y2] = postopek1(X, Y);
  [Q2 b2 pos2Y2] = postopek2(X, Y);
  
  
  #X
  clf reset
  hold on
 
  
  if(size(X, 1) == 2)
    plot([X(1, :), X(1, 1)], [X(2, :), X(2, 1)], 'r');
    plot([Y(1, :), Y(1, 1)], [Y(2, :), Y(2, 1)], 'g');
    plot([pos1Y2(1, :), pos1Y2(1, 1)], [pos1Y2(2, :), pos1Y2(2, 1)], 'b');
    plot([pos2Y2(1, :), pos2Y2(1, 1)], [pos2Y2(2, :), pos2Y2(2, 1)], 'm');
    #axis("equal")
  endif
  
  if(size(X, 1) == 3)
    plot3(X(1, :), X(2, :), X(3, :), "r.");
    plot3(Y(1, :), Y(2, :), Y(3, :), "gx");
    plot3(pos1Y2(1, :), pos1Y2(2, :), pos1Y2(3, :), "b+");
    plot3(pos2Y2(1, :), pos2Y2(2, :), pos2Y2(3, :), "mp");
    #axis("equal")
  endif
endfunction

%!demo1
%! load("pod1.txt");
%! primerjava(X, Y1)

%!demo2
%! load("pod2.txt");
%! primerjava(X, Y2)


%!demo3
%!	X = [
%!	  19.750 19.710 19.991 20.031;
%!	  5.000 5.155 5.304 5.147
%!	];
%!	
%!	Y = [
%!	  19.806 19.698 19.589 19.696;
%!	  3.104 3.043 3.437 3.500
%!	];
%!  
%!  primerjava(X, Y)

%!demo4
%!	X = [
%!	  46.232559 46.232491 46.232398 46.232463;
%!      14.623575 14.623480 14.623613 14.623709
%!	];
%!	
%!	Y = [
%!	  46.231653 46.231780 46.231821 46.231695;
%!	  14.622347 14.622427 14.622291 14.622212
%!	];
%!  
%!  primerjava(X, Y)
