echo on
% Tema I de proiect / Problema nr 14
% Definirea unui filtru multibanda
% Raspunsul filtrului ideal
rfi=[ones(512*.2,1);zeros(512*.1,1);.5*ones(512*.1,1);zeros(512*.6+1,1)];
% Fereastra rectangulara
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,boxcar(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],boxcar(51));
% Filtrul complet
fr=.5*ftb+ftj;
% Calculul erorii patratice medii
err=sqrt((sum((abs(freqz(fr))-rfi).^2))/512)
% Fereastra triangulara
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,triang(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],triang(51));
% Filtrul complet
ftr=.5*ftb+ftj;
% Calculul erorii patratice medii
ertr=sqrt((sum((abs(freqz(ftr))-rfi).^2))/512)
% Fereastra Hanning
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,hanning(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],hanning(51));
% Filtrul complet
fhan=.5*ftb+ftj;
% Calculul erorii patratice medii
erhan=sqrt((sum((abs(freqz(fhan))-rfi).^2))/512)
% Fereastra Hamming
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,hamming(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],hamming(51));
% Filtrul complet
fham=.5*ftb+ftj;
% Calculul erorii patratice medii
erham=sqrt((sum((abs(freqz(fham))-rfi).^2))/512)
% Fereastra Blackman
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,blackman(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],blackman(51));
% Filtrul complet
fb=.5*ftb+ftj;
% Calculul erorii patratice medii
erb=sqrt((sum((abs(freqz(fb))-rfi).^2))/512)
% Afisarea rezultatelor
clf
subplot(3,2,1)
plot(rfi,'b-')
title('Ideal')
FR=freqz(fr);
FTR=freqz(ftr);
FHAN=freqz(fhan);
FHAM=freqz(fham);
FB=freqz(fb);
subplot(3,2,2)
plot(abs(FR),'m-')
title('Dreptunghiular')
subplot(3,2,3)
plot(abs(FTR),'c-')
title('Triunghiular')
subplot(3,2,4)
plot(abs(FHAN),'y-')
title('Hanning')
subplot(3,2,5)
plot(abs(FHAM),'g-')
title('Hamming')
subplot(3,2,6)
plot(abs(FB),'r-')
title('Blackman')
pause
clf
s=1:512;
plot(s,rfi,s,abs(FR),s,abs(FTR),s,abs(FHAN),s,abs(FHAM),s,abs(FB))


