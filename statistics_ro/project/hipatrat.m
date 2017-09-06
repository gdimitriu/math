function y=hipatrat(x,sigma,N)
%sigama-parametrul legii (sigma=1 <=> Hi-patrat standard) 
%N- nr grade de libertate
y=(2^(-N/2))/gamma(N/2).*(x.^(N/2-1))/(sigma^N).*exp(-x/2/sigma/sigma);