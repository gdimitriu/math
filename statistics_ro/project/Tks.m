function tks(x,Volum,alfa)
	% **********************************************
	% * Testul de concordanta Kolmogorov - Smirnov *
	% **********************************************
fprintf('\n');
fprintf('\tTestul Kolmogorov - Smirnov \n');
fprintf('\nIpotezele statistice\n')
fprintf('\tH0 : Legea de repartitie a v.a. din care provin')
fprintf('datele este F(x) data\n')
fprintf('\tH1 : Ipoteza alternativa (H0 nu este adevarata)\n')
fprintf('\nTestul KS este valabil doar pt. v.a. continue.\n')
hist(x);   title('Histograma datelor experimentale');
figure(gcf)
% Graficul densitatii teoretice de probabilitate
% de parametri cunoscuti sau nu.
	subplot(2,1,1)
	plot(-3:0.06:3,  gaussian(-3:0.06:3, [0 1]));
	axis([-3 3 0 0.5]);
	title('Densitate de probabilitate gaussiana standard');
	subplot(2,1,2)
	plot((-3:0.06:3 - 0) ./ 1, Pr_norm((-3:0.06:3 - 0) ./ 1))
	axis([-3 3 0 1.1]);
	title('Functia de repartitie gaussiana standard'); figure(gcf)
	% Parametrii legii sunt cunoscuþi?
fprintf('\n\t----  Parametrii legii sunt cunoscuti?  ----');
	fprintf('\nMedia estimata: %f\n', mean(x));
	fprintf('Sigma estimat: %f\n', std(x));
	miu = mean(x);
	sigma = std(x);	
	
	% Functia de repartitie experimentala a datelor
	% pentru fiecare punct x(i), reprezentind o realizare 
	% particulara a v.a. X, i = 1 : Volum, se calculeaza
	% functia de repartitie experimentala, evaluata in trepte
fprintf...
('\n\t--- Evaluarea functiei de repartitie experimentala Fe, în trepte ---\n');

x = sort(x);	% Sortarea datelor
for i = 1 : Volum
	Fe(i) = i / Volum;
end
subplot(1,1,1)
pct1 = min(x) - (max(x) - min(x)) / (Volum - 1);
pct2 = max(x) + (max(x) - min(x)) / (Volum - 1);
stairs([pct1  x  pct2], [0  Fe  1])
		% Reprezentarea grafica a functia de repartitie 
		% experimentala în trepte

	for i = 1 : Volum
		F(i) = Pr_norm((x(i) - miu) ./ sigma);
	end

for i = 1 : Volum
	d1 = abs( i / Volum  -  F(i) );
	d2 = abs( F(i)  -  (i - 1) / Volum );
	d(i) = max(d1, d2);	% d(i) - diferenta maxima absoluta
					% calculata în toate punctele
end

hold on
if (Volum <= 100)
	plot(x, F, 'r+')		% Funcþia de repartitie teoretica
					% calculata in aceleasi puncte
	plot(x, d, 'go')		% diferentele intre F si Fe
else
	plot(x, F, 'r-')		% Functia de repartitie teoretica
					% calculata in aceleasi puncte
	plot(x, d, 'g-')		% diferentele între F si Fe
end
title('Functia de repartitie teoretica, experimentala, diferenta absoluta');
axis([pct1 pct2 0 1.1]),  figure(gcf)

fprintf('\nTastati ceva!\n'),	pause

	% Formam v.a. Delta de test, reprezentând diferenta absoluta
	% maxima între F si Fe calculata in toate punctele
fprintf('\n\t----  V.a. Delta - diferenþa maxima între F si Fe  ----');
Delta = max(d)

	% Determinam alfa-cuantila superioara pentru 
	% testul Kolmogorov-Smirnov
fprintf('\n\t----  Alfa - cuantila superioara pt. testul KS:  ----\n')
Delta_alfa = sqrt((1 / (2*Volum)) * log(2 / alfa))

	% Decizia pentru testul Kolmogorov-Smirnov
fprintf('\n\t----  Decizia pentru testul Kolmogorov-Smirnov:  ----\n')

mesaj=' normala\n';

	% Decizia pentru testul Kolmogorov-Smirnov
fprintf('\n\t----  Decizia pentru testul Kolmogorov-Smirnov:  ----\n')
if Delta < Delta_alfa
	fprintf...
	(['Cu increderea de %f repartitia datelor este' mesaj], 1 - alfa)
else
	fprintf...
	(['Cu increderea de %f repartitia datelor nu este' mesaj], 1 - alfa)
end
hold off
