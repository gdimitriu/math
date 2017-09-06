echo on
% Tema I de proiect / Problema nr 14
% Definirea unui filtru multibanda
% Raspunsul filtrului ideal
rfi=[ones(512*.2,1);zeros(512*.1,1);.5*ones(512*.1,1);zeros(512*.6+1,1)];
stem(rfi)
pause
% Fereastra rectangulara
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,boxcar(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],boxcar(51));
% Filtrul complet
fr=.5*ftb+ftj;
% Afisarea rezultatelor
% Raspunsul la impulsul unitate
clf
impz(fr)
pause
% Caracteristica in frecventa
clf
freqz(fr)
pause
% Pozitia zerourilor
%clf
%zplane(fr)
%pause
% Calculul erorii patratice medii
err=sqrt((sum((abs(freqz(fr))-rfi).^2))/512)
% Fereastra triangulara
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,triang(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],triang(51));
% Filtrul complet
ftr=.5*ftb+ftj;
% Afisarea rezultatelor
% Raspunsul la impulsul unitate
clf
impz(ftr)
pause
% Caracteristica in frecventa
clf
freqz(ftr)
pause
% Pozitia zerourilor
%clf
%zplane(ftr)
%pause
% Calculul erorii patratice medii
ertr=sqrt((sum((abs(freqz(ftr))-rfi).^2))/512)
% Fereastra Hanning
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,hanning(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],hanning(51));
% Filtrul complet
fhan=.5*ftb+ftj;
% Afisarea rezultatelor
% Raspunsul la impulsul unitate
clf
impz(fhan)
pause
% Caracteristica in frecventa
clf
freqz(fhan)
pause
% Pozitia zerourilor
%clf
%zplane(fhan)
%pause
% Calculul erorii patratice medii
erhan=sqrt((sum((abs(freqz(fhan))-rfi).^2))/512)
% Fereastra Hamming
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,hamming(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],hamming(51));
% Filtrul complet
fham=.5*ftb+ftj;
% Afisarea rezultatelor
% Raspunsul la impulsul unitate
clf
impz(fham)
pause
% Caracteristica in frecventa
clf
freqz(fham)
pause
% Pozitia zerourilor
%clf
%zplane(fham)
%pause
% Calculul erorii patratice medii
erham=sqrt((sum((abs(freqz(fham))-rfi).^2))/512)
% Fereastra Blackman
% Partea corespunzatoare filtrului trece jos
ftj=fir1(50,.2,blackman(51));
% Partea corespunzatoare filtrului trece banda
ftb=fir1(50,[.3 .4],blackman(51));
% Filtrul complet
fb=.5*ftb+ftj;
% Afisarea rezultatelor
% Raspunsul la impulsul unitate
clf
impz(fb)
pause
% Caracteristica in frecventa
clf
freqz(fb)
pause
% Pozitia zerourilor
%clf
%zplane(fb)
%pause
% Calculul erorii patratice medii
erb=sqrt((sum((abs(freqz(fb))-rfi).^2))/512)