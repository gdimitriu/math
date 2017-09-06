function y=myerfinv(x)
%here x=1/sqrt(2pi)*integral from -Inf to y of exp(-u^2/2)
y=(erfinv(1-2*x))*sqrt(2);