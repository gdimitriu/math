function Z=gen_expiter(nr)
Z=zeros(1,nr);
for i=1:nr
    N=0;
    K=0;
    while rem(K,2)==0
        u0=rand(1,1);
        u1=rand(1,1);
        ut=u0;
        K=1;
        while u0>=u1
            K=K+1;
            u0=u1;
            u1=rand(1,1);
        end
        if rem(K,2)==0
            N=N+1;
        end
    end
    Z(i)=N+ut;
end