%Problema 16 setul 1
rfi=[ones(512*0.2 ,1);zeros(512*1.5,1);5*ones(512*0.5,1);zeros(512*0.6,1)];
figure(1);
stem(rfi)
ftj4=fir1(30,0.2,kaiser(31,4))
ftb4=fir1(30,[0.35 0.4],kaiser(3,4))
filtru4=ftj4+0.5*ftb
figure(2)
freqz(filtru4)
ftj8=fir1(30,0.2,kaiser(31,8))
ftb8=fir1(30,[0.35 0.4],kaiser(31,8))
filtru8=ftj8+0.5*ftb8
er4=sqrt((sum((abs(freqz(filtru4))-rfi)^2)/512))
er8=sqrt((sum((abs(freqz(filtru8))-rfi)^2)/512))
