function KS_tests
fprintf('Teste KS pentru distributii gauss, hipatrat si student\n');
nr=input('introduceti numarul de vectori de insumat ');
N=input('introduceti numarul de valori din setul de test ');
pauza=input('introduceti pauza in secunde ');
alpha=input('Introduceti nivelul de semnificatie alpha ');

gengauss=zeros(1,N); 	%constructia generatorului normal
for i=1:nr
	intermed=rand(1,N);
	gengauss=gengauss+intermed;
end
gauss=randn(1,N);
gengauss=sqrt(12/nr)*(gengauss-nr/2);
[frecventa, u]=hist(gengauss,10);
delta=u(2)-u(1);
iesire=frecventa./delta./N;
figure(1);
bar(u,iesire,'g'); hold on;
[frecventa1,v]=hist(gauss,10);
delta1=v(2)-v(1);
iesire1=frecventa1./delta1./N;
bar(v,iesire1,'r');hold off
%estimare si teste de dispersie si medie
%estimarea mediei
xbargengauss=sum(gengauss)/N;
s1=sqrt(sum((gengauss-xbargengauss).^2)/(N-1));
if N<35   
	talphape2=fmins('studentint',0,[],[],N,alpha/2);
else
   talphape2=abs(myerfinv(alpha/2));
end;
epsilon=s1*talphape2/sqrt(N-1)
fprintf('Media experimentala a esantionului de date este  %2.2f\n',xbargengauss);
fprintf('Intervalul (%f,%f) cu incredere %f % din cazuri\n',xbargengauss-epsilon,xbargengauss+epsilon,(1-alpha)*100);
fprintf('pauza\n');pause(pauza);
%test de medie
xbargauss=sum(gauss)/N;
s1gauss=sqrt(sum((gauss-xbargauss).^2)/(N-1));
if N<35   
	cuantila=fmins('studentint',0,[],[],N,alpha/2);
else
    cuantila=abs(myerfinv(alpha/2));
end;
t=sqrt(N)*(xbargauss-xbargengauss)/s1gauss;
if (t<cuantila) & (t>-cuantila)
   fprintf('Se accepta datele ca provenind dintr-o medie de  %f in %f cazuri\n',xbargengauss,(1-alpha)*100);
else
   fprintf('Se resping datele ca provenind dintr-o medie de  %f in %f cazuri\n',xbargengauss,(1-alpha)*100);
end
fprintf('pauza\n');pause(pauza);

%estimarea dispersiei
%secventa de estimare a dipersiei
%urmeaza calculul apha-cuantilelor; algoritmul are ca punct initial valoarea medie
yalphape2st=fmins('hipatratint',N-1,[],[],1,N-1,1-alpha/2);	%alpha-cuantila inferioara (stanga)
yalphape2dr=fmins('hipatratint',N-1,[],[],1,N-1,alpha/2);	%alpha-cuantila superiara (dreapta)
fprintf('\nDispersia de selectie a esantionului de date este %f \n',s1^2);
fprintf('\nIn %2.2f la suta din cazuri dispersia teoretica se afla in intervalul (%2.2f ; %2.2f) \n',(1-alpha)*100,(N-1)*(s1^2)/yalphape2dr,(N-1)*(s1^2)/yalphape2st);
fprintf('pauza');pause(pauza);
%secventa de testare a dispersiei cu dispersia estimata pe generatorul gauss cu insumare
disp=s1^2;
xbargauss=sum(gauss)/N;
s1gauss=sqrt(sum((gauss-xbargauss).^2)/(N-1));
ytest=(N-1)*(s1gauss^2)/disp;
%urmeaza calculul apha-cuantilelor; algoritmul are ca punct initial valoarea medie-2*sigma
yalphape2st=fmins('hipatratint',N-1-3*sqrt(2*(N-1)),[],[],1,N-1,1-alpha/2);	%alpha-cuantila inferioara (stanga)
yalphape2dr=fmins('hipatratint',N-1+3*sqrt(2*(N-1)),[],[],1,N-1,alpha/2);	%alpha-cuantila superiara (dreapta)
fprintf('\nDispersia de selectie a esantionului de date este %f \n',s1gauss^2);
if (ytest>yalphape2st)&(ytest<yalphape2dr)
  fprintf('\nSe accepta datele ca provenind dintr-o populatie de dispersie %.2f in %2.1f la suta din cazuri\n',disp, (1-alpha)*100);
else
	fprintf('\nSe resping datele ca provenind dintr-o populatie de dispersie %.2f in %2.1f la suta din cazuri\n',disp, (1-alpha)*100);
end;
fprintf('\npauza\n');pause(pauza);
figure(2);
tks(gengauss,N,alpha);
fprintf('\npauza\n'); pause(pauza);
tks(gauss,N,alpha);


