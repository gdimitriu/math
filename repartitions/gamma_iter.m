function x=gamma_iter(N,niu)
    function x1=gamma1(niu)
        k=0;
        while rem(k,2)==0
            u=rand(1,1);
            z0=u^(1/niu);
            z1=rand(1,1);
            k=1;
            zt=z0;
            while z0>=z1
                z0=z1;
                z1=rand(1,1);
                k=k+1;
            end
            %zt=z0;
        end
        x1=zt;
    end
    function x2=gamma2(niu)
        b=-1/(1-niu);
        u=rand(1,1);
        z=u^b;
        u0=gen_expvect(1);
        y=1+u0;
        while y>z
            u=rand(1,1);
            z=u^b;
            u0=gen_expvect(1);
            y=1+u0;
        end
        x2=y;
    end
for i=1:N
    u=rand(1,1);
    if u<gammainc(1,niu)./gamma(niu)
        x1=gamma1(niu);
        x(i)=x1;
    else
        x2=gamma2(niu);
        x(i)=x2;
    end
end
end