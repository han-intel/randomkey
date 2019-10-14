% numb
n=20;
rk=rand(1,n*2);
for i = 1:n
    boxs(i).num=i;
    boxs(i).randomkey=rk(i);
    boxs(i).orientation=rk(i+n);
end
% box packing sequence
bps=zeros(n,2);
for i=1:n
    bps(i,1)=rk(i);
    bps(i,2)=i;
end
bps=sortrows(bps);

