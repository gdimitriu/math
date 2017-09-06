function y=studentint(x,N,alpha)
%	Calculeaza integrala de la 0 la x din densitatea
%de probabilitate a lui Student de parametru N (N-1 g.l)
y1=quad8('student',0,x,[],[],N);
y=abs(.5+y1-1+alpha);
