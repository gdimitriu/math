        %Egalizare de canal
        %Initializari de variabile
        dt=0;z=0;y=0;error=0;out=0;y1=[1 1];out1=0;test=0;in=0;test1=0;
        l=10    %Lungimea filtrului canalului de transmisie
        m=5     %Lungimea filtrului feedback
        n=2     %Lungimea filtrului feed forward
        miu=0.002       %Pasul filtrului adaptiv
        enoise=1;       %Enable noise
        prag=0.5        %Pragul de decizie
        train=300       %Secventa de inceput de antrenament
        date=2000       %Numarul de elemente de intrare
        date=date+1;
        i=1;
        %Creem secventa de date
        while i<date
        for j=1:50
                in(i)=1;
                i=i+1;
        end
        for j=1:50
                in(i)=-1;
                i=i+1;
        end
        end
        nrpasi=length(in);

        %Semnalul complex (plus secventele de antrenament)
        dt=ones([nrpasi+ceil(nrpasi*0.1)+train,1]);
        k=1;pas=1;r=1;
        while(pas<train+1)
        for i=1:10
                dt(pas)=1;
                test1(pas)=1;
                pas=pas+1;
        end
        for i=1:10
                dt(pas)=1;
                test1(pas)=1;
                pas=pas+1;
        end
        end
        while (1<2)
        %Secventa periodica de date
        for i=1:100
                pas=pas+1;
                dt(pas)=in(k);
                if k==nrpasi
                break;
                end
                k=k+1;
        end
        if k==nrpasi
        break;
        end
        %Secventa periodica de antrenament
        for i=1:5
                dt(pas)=-1;
                test(r)=-1;
                pas=pas+1;
                r=r+1;
        end
        for i=1:5
                dt(pas)=1;
                test(r)=1;
                pas=pas+1;
                r=r+1;
        end
        end

        %Efectul filtrarii canalului de transmisiune
        z=zeros([nrpasi+train+ceil(0.1*nrpasi),1]);
        for i=1:(nrpasi+train+ceil(0.1*nrpasi)-l-1)
                for j=0:l
                z(i)=z(i)+rand(1)*dt(i+j);
                end
        z(i)=z(i)+randn(1)*enoise;
        end

        %Egalizorul de canal
        xff=0;xf=0;wff=0;wf=0;
        wff=zeros([n,1]);
        wf=zeros([m,1]);
        i=1;k=1;xff=ones([n,1]);xf=ones([m,1]);
        while (1<2)
              %Primele simboluri de antrenament
                if i<train
                        for j=0:n-2
                                xff(n-j,1)=xff(n-j-1,1);
                        end
                        xff(1,1)=z(i);
                        i=i+1;
                        for j=0:m-2
                                xf(m-j,1)=xf(m-j-1,1);
                        end
                        xf(1,1)=y1(1);
                        y=(wff')*xff+(wf')*xf;
                        y1(1)=y1(2);
                        y1(2)=test1(i-1);
                        e=y1(1)-y;
                        error(i)=e;
                        wff1=wff+miu*xff*e;
                        wf1=wf+miu*xf*e;
                        wf=wf1;
                        wff=wff1;

                else
                for r=1:100
                        for j=0:n-2
                                xff(n-j,1)=xff(n-j-1,1);
                        end
                        xff(1,1)=z(i);
                        i=i+1;
                        for j=0:m-2
                                xf(m-j,1)=xf(m-j-1,1);
                        end
                        xf(1,1)=y1(1);
                        y=(wff')*xff+(wf')*xf;
                        e=y1(1)-y;
                        y1(1)=y1(2);
                        error(i)=e;
                        if y<prag
                                out1(k)=-1;
                        else
                                out1(k)=1;
                        end
			y1(2)=y;
	                out(k)=y1(1);
                        if k==nrpasi
                        break;
                        end
                        k=k+1;
                        wff1=wff+miu*xff*e;
                        wf1=wf+miu*xf*e;
                        wf=wf1;
                        wff=wff1;
                end
                if k==nrpasi
                break;
                end
                %Secventa de antrenament periodica
                for r=1:10
                        for j=0:n-2
                                xff(n-j,1)=xff(n-j-1,1);
                        end
                        xff(1,1)=z(i);
                        i=i+1;
                        for j=0:m-2
                                xf(m-j,1)=xf(m-j-1,1);
                        end
                        xf(1,1)=y1(1);
                        y=(wff')*xff+(wf')*xf;
                        y1(1)=y1(2);
                        y1(2)=test(r);
                        e=y1(1)-y;
                        error(i)=e;
                        wff1=wff+miu*xff*e;
                        wf1=wf+miu*xf*e;
                        wf=wf1;
                        wff=wff1;
                end
                end
        end
