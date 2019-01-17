function Z=gen_expvect(nr)
N=zeros(1,nr);
K=zeros(1,nr);
index=find(rem(K,2)==0);
while isempty(index)==0
    u0t=rand(1,length(index));
    u1t=rand(1,length(index));
    u0(index)=u0t;
    u1(index)=u1t;
    Kt=ones(1,length(index));
    K(index)=Kt;
    ut(index)=u0t;
    index1=find(u0(index)>=u1(index));
    index=index(index1);
    while isempty(index)==0
        u0=u1;
        u1t=rand(1,length(index));
        u1(index)=u1t;
        K(index)=K(index)+1;
        index1=find(u0(index)>=u1(index));
        index=index(index1);
    end
    index=find(rem(K,2)==0);
    N(index)=N(index)+1;
end
Z=N+ut;
