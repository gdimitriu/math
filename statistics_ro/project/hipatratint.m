function y=hipatratint(x,sigma,N,alpha)
%	Calculeaza integrala de la 0 la x din densitatea
%de probabilitate a legii Hi-patrat de N-1 g.l
y1=quad('hipatrat',0,x,[],[],sigma,N);
y=abs(y1-1+alpha);
