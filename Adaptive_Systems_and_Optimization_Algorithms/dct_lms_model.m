        function dct_lms_model
        %Proiect AOSA: DCT-LMS model
        nrpasi=200;
        nrpasi=nrpasi+1;
        eroare=0;
        miu=0.05;
        P(1)=0;P(2)=0;
        x1=0;y1=0;x2=0;y2=0;v=0;w=0;x=0;y=0;xx=0;
        b=0.02          %beta
        N=5;
        wor=[5;5];

        %functia de cost pt LMS
        for i=1:101
                w0=-5+(i-1)*0.1;
                x(i)=w0;
                for j=1:101
                w1=-5+(j-1)*0.1;
                y(j)=w1;
                J(i,j)=2+0.5*(w0^2+w1^2)+w0*w1*cos(2*pi/N)+2*w1*sin(2*pi/N);
                end
        end
        figure(1);
        contour(y,x,J,20);xlabel('functia de cost pentru LMS');

        %functia de cost pt DCT-LMS
        for i=1:101
            w0=-5+(i-1)*0.1;
            x(i)=w0;
            for j=1:101
                w1=-5+(j-1)*0.1;
                y(j)=w1;
        %functia de cost fara normare
        J1(i,j)=2+0.5*w0^2*(1+cos(2*pi/N))+0.5*w1^2*(1-cos(2*pi/N))-1.4142*sin(2*pi/N)*(-w0+w1);
        %functia de cost cu normare
        J(i,j)=2+w0^2+w1^2-2*sin(2*pi/N)*(-w0/sqrt(1+cos(2*pi/N))+w1/sqrt(1-cos(2*pi/N)));
            end
        end
        figure(2);
        contour(y,x,J,20);xlabel('functia de cost pt DCT-LMS cu normare');
        figure(3);
        contour(y,x,J1,20);xlabel('functia de cost pt DCT-LMS fara normare');
        
	
	%LMS standard
        w=wor;
        figure(1);
        hold on
        for i=1:nrpasi
            xx=[sin(2*pi*i/N);sin(2*pi*(i-1)/N)];
            y=(w')*xx;
            e=2*cos(2*pi*i/N)-y;
            w1=w+miu.*xx.*e;
            plot(w(2),w(1),'g.');
            w=w1;
        end
        hold off
        

	%BINLMS
	w=wor;
	L=10;
	figure(1);
	hold on
	for i=1:nrpasi
		i=L*i;
		xx=[sin(2*pi*i/N);sin(2*pi*(i-1)/N)];
		y=(w')*xx;
		e=2*cos(2*pi*i/N)-y;
		w1=w+miu.*e./xx;
		plot(w(2),w(1),'r.');
		w=w1;
	end
	hold off


	%DCT-LMS
        w=wor;
        xx=0;
        v=0;
        P1=P;
        figure(2);
        hold on
        for k=1:nrpasi
            u(1)=0.707*(sin(2*pi*(k)/N)+sin(2*pi*(k-1)/N));
            u(2)=0.707*(sin(2*pi*(k)/N)-sin(2*pi*(k-1)/N));
            P(1)=b*P1(1)+(1-b)*u(1)*u(1);
            v1=u(1)/sqrt(P(1));
            P(2)=b*P1(2)+(1-b)*u(2)*u(2);
            P3(k)=P1(2);
            P2(k)=P1(1);
            v2=u(2)/sqrt(P(2));
            v=[v1;v2];
            y=(w')*v;
            er=2*cos(2*pi*k/N)-y;
            w1=w+miu.*v.*er;
            plot(w(2),w(1),'r.');
            eroare(k)=er;
            w=w1;
            P1=P;
        end
        hold off
        w=wor;
        xx=0;
        P1=P;
        figure(3);
        hold on
        for k=1:nrpasi
            u1=0.707*(sin(2*pi*(k)/N)+sin(2*pi*(k-1)/N));
            u2=0.707*(sin(2*pi*(k)/N)-sin(2*pi*(k-1)/N));
            u=[u1;u2];
            y=(w')*u;
            er=2*cos(2*pi*k/N)-y;
            w1=w+miu.*u.*er;
            plot(w(2),w(1),'r.');
            w=w1;
            P1=P;
        end
        hold off
        figure(4);
        plot(1:nrpasi,eroare);