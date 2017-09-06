%Problema 3 setul 1
%Calculam coeficientii filtrelor
x1=fir1(25,0.08,boxcar(26))
x2=fir1(25,0.08,hamming(26))
x3=fir1(25,0.08,bartlett(26))
x4=fir1(25,0.08,hanning(26))
x5=fir1(25,0.08,blackman(26))

%Afisam coeficientii celor 5 tipuri de filtre
figure(1);
subplot(3,1,1); stem(x1);
subplot(3,1,2); stem(x2);
subplot(3,1,3); stem(x3);
figure(2);
subplot(2,1,1); stem(x4);
subplot(2,1,2); stem(x5);

%Calculam coeficientii spectrelor semnalului
y1=dtft(x1);
y2=dtft(x2);
y3=dtft(x3);
y4=dtft(x4);
y5=dtft(x5);

%Afisam caracteristicile amplitudine-frecventa ale celor cinci tipuri de filtre
f=-256:255;
figure(3);
subplot(3,1,1); plot(f,abs(y1));
subplot(3,1,2); plot(f,abs(y2));
subplot(3,1,3); plot(f,abs(y3));
figure(4);
subplot(2,1,1); plot(f,abs(y4));
subplot(2,1,2); plot(f,abs(y5));

%Afisam faza celor cinci tipuri de filtre
f=linspace(-pi,pi,512);
figure(5);
subplot(3,1,1); plot(f,angle(y1));
subplot(3,1,2); plot(f,angle(y2));
subplot(3,1,3); plot(f,angle(y3));
figure(6);
subplot(2,1,1); plot(f,angle(y4));
subplot(2,1,2); plot(f,angle(y5));
