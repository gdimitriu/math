%Problema 11 setul 1
x=remez(50,[0 0.05 0.075 1],[1 1 0 0],[1 1]);
y=dtft(x);
f=linspace(-pi,pi,512);
figure(1);
subplot(2,1,1);
stem(x); grid;
title('SPECTRUL SEMNALULUI h[n]');
subplot(2,1,2);
plot(f,abs(y)); grid;
title('RASPUNSUL IN FRECVENTA');
x_d=decim(x,4);
y_d=dtft(x_d);
figure(2);
subplot(2,1,1);
stem(x_d); grid;
title('SPECTRUL SEMNALULUI DECIMAT');
subplot(2,1,2);
%OBS!: aici este o greseala ,nu se stie pe ce suport se face plotarea
plot(f,abs(x_d)); grid;
title('RASPUNSUL IN FRECVENTA AL SEMNALULUI DECIMAT');
