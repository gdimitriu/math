%Problema 5 setul 1
f1=fir1(24,[1/4 3/4],'stop',drept(25));
f2=fir1(24,[1/4 3/4],'stop');
f3=fir1(24,[1/4 3/4],'stop',bartlett(25));
f4=fir1(24,[1/4 3/4],'stop',hanning(25));
f5=fir1(24,[1/4 3/4],'stop',blackman(25));
[g1 h1]=dtft(f1);
[g2 h2]=dtft(f2);
[g3 h3]=dtft(f3);
[g4 h4]=dtft(f4);
[g5 h5]=dtft(f5);
f=linspace(-pi,pi,512);
%afisari
figure(1);
subplot(3,1,1); 
plot(f,h1); grid;
subplot(3,1,2);
plot(f,h2); grid;
subplot(3,1,3);
plot(f,h3); grid;
figure(2);
subplot(2,1,1);
plot(f,h4); grid;
subplot(2,1,2);
plot(f,h5); grid;

