%Tema II de proiect,problema A11
%Frecventele normate
wp=1.2/4
ws=2/4
%Atenuarile
rp=.5
rs=40
%Determinarea ordinului filtrelor
[nbut, wbut]=buttord(wp,ws,rp,rs)
[ncheb1,wcheb1]=cheb1ord(wp,ws,rp,rs)
[ncheb2,wcheb2]=cheb2ord(wp,ws,rp,rs)
[nell,well]=ellipord(wp,ws,rp,rs)
%Construirea filtrelor
[bbut,abut]=butter(nbut,wbut)
[bcheb1,acheb1]=cheby1(ncheb1,rp,wcheb1)
[bcheb2,acheb2]=cheby2(ncheb2,rs,wcheb2)
[bell,aell]=ellip(nell,rp,rs,well)
%Afisarea rezultatelor
figure(1)
freqz(bbut,abut)
pause
figure(2)
clf
zplane(bbut,abut)
pause
figure(1)
clf
freqz(bcheb1,acheb1)
pause
figure(2)
clf
zplane(bcheb1,acheb1)
pause
figure(1)
clf
freqz(bcheb2,acheb2)
pause
figure(2)
clf
zplane(bcheb2,acheb2)
pause
figure(1)
clf
freqz(bell,aell)
pause
figure(2)
clf
zplane(bell,aell)
pause
clf
subplot(2,2,1)
plot(abs(freqz(bbut,abut)))
title('Butter')
subplot(2,2,2)
plot(abs(freqz(bcheb1,acheb1)))
title('Cheb1')
subplot(2,2,3)
plot(abs(freqz(bcheb2,acheb2)))
title('Cheb2')
subplot(2,2,4)
plot(abs(freqz(bell,aell)))
title('Ellip')
pause
