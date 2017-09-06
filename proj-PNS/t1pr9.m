echo on
% Tema I de proiect / Problema nr 9
% Introducerea vectorilor
h1=[1 2 3 4 4 3 2 1]
h2=[-1 -2 -3 -3 -2 -1 0 1]
% Afisarea vectorilor
clf
stem(h1)
pause
stem(h2)
pause
% Calculul TFD
H1=fft(h1)
H2=fft(h2)
% Afisarea  modulului rezultatului
subplot(2,1,1)
stem(abs(H1))
subplot(2,1,2)
stem(abs(H2))
pause
% Afisarea argumentului rezultatului
subplot(2,1,1)
stem(angle(H1))
subplot(2,1,2)
stem(angle(H2))
% Implementarea unui FTJ nerecursiv
% Nu se poate!
% Calculul parametrilor functiei de transfer
% Pozitia polilor si zerourilor
clf
zplane(h2,h1)     
pause
% Raspunsul in frecventa
clf
freqz(h2,h1)
pause

