%Problema A8 din setul 2
%Sa se proiecteze un FTJ RII de ordinul 5 cu frecventa de esantionare 2KHz s i o 
%banda de 0.6 KHz

%Formam frecventele numerice 
ot=600/2000

%Sintetizam filtrul analogic
[ba aa]=butter(4,ot,'s')

[b a]=bilinear(ba,aa,1)
%Reprezentam caracteristica faza-frecventa si amplitudine-frecventa
figure(1);
freqz(b,a);

%Reprezentam pozitia polilor si zerourilor
figure(2);
zplane(a)

%Aflam raspunsul la impuls folosind impz
figure(3);
[ c d]=impz(b,a,20)
stem(0:1:19,c);

%Reprezentam carcteristicile in planul z
figure(4);
freqs(ba,aa);

