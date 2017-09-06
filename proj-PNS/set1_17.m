%Problema 17 setul 1
x=remez(20,[0 0.2 0.21 1],[1 1 0 0]);
y=dtft(x);
f=linspace(-pi,pi,512);
subplot(3,1,1);
stem(f); grid;
title('SPECTRUL SEMNALULUI h[n]');
subplot(3,1,2);
plot(i,abs(y)); grid;
titile('CARACTERISTICA IN FRECVENTA');
subplot(3,1,3);
zplane(roots(f)); grid;
title('POZITIA ZEROURILOR');
