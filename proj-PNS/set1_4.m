echo on
% Tema I de proiect / Problema nr. 4
% Filtru de lungime 25
% (RFI cu faza liniara)
% Fereastra rectangulara
% Determinarea coeficientilor
stem(Boxcar(25))
pause
fr=fir1(24,1/6,boxcar(25));
% Afisarea rezultatului
clf
freqz(fr)
pause
% Fereastra Hamming
% Determinarea coeficientilor
stem(Hamming(25))
pause
fr=fir1(24,1/6,Hamming(25));
% Afisarea rezultatului
clf
freqz(fr)
pause
% Fereastra Bartlett
% Determinarea coeficientilor
stem(Bartlett(25))
pause
fr=fir1(24,1/6,Bartlett(25));
% Afisarea rezultatului
clf
freqz(fr)
pause
% Fereastra Hanning
% Determinarea coeficientilor
stem(Hanning(25))
pause
fr=fir1(24,1/6,Hanning(25));
% Afisarea rezultatului
clf
freqz(fr)
pause 
% Fereastra Blackman
% Determinarea coeficientilor
stem(Blackman(25))
pause
fr=fir1(24,1/6,Blackman(25));
% Afisarea rezultatului
clf
freqz(fr)
pause