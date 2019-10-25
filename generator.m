function [bin,boxes]=generator(num,classtype)



types=[1 2 3 4 5];
type=classtype;
othertypes=setdiff(types,type);

D=100;
W=100;
H=100;
boxes=[];
switch classtype
    case 6
        D=10;
        W=10;
        H=10;
        boxes=[boxes genbox(type,num)];
    case 7
        D=40;
        W=40;
        H=40;
        boxes=[boxes genbox(type,num)];
    case 8
        D=100;
        W=100;
        H=100;
        boxes=[boxes genbox(type,num)];
    otherwise
        for i = 1:num
            rd = rand(1);
            if rd<0.6
            	type=type;
            elseif rd<0.7
            	type=othertypes(1);
            elseif rd<0.8
            	type=othertypes(2);
            elseif rd<0.9
            	type=othertypes(3);
            else
                type=othertypes(4);
            end
            boxes=[boxes genbox(type,1)];
        end
end

%generate bin
bin.h=H;
bin.w=W;
bin.d=D;
ems.minx=0;
ems.miny=0;
ems.minz=0;
ems.maxx=D;
ems.maxy=W;
ems.maxz=H;
ems.h=ems.maxz-ems.minz;
ems.d=ems.maxx-ems.minx;
ems.w=ems.maxy-ems.miny;
ems.vol=ems.h*ems.d*ems.w;
bin.emses=[ems];
bin.boxspaces=[];
%    generate boxes
    function box = genbox(type,num)
    
    switch type
    case 1
        d=2/3*D+1/3*D*rand(1,num);
        h=2/3*H+1/3*H*rand(1,num);
        w=1+(1/2*W-1)*rand(1,num);

    case 2
        d=2/3*D+1/3*D*rand(1,num);
        h=1+(1/2*H-1)*rand(1,num);
        w=2/3*W+1/3*W*rand(1,num);

    case 3
        d=1+(1/2*D-1)*rand(1,num);
        h=2/3*H+1/3*H*rand(1,num);
        w=2/3*W+1/3*W*rand(1,num);

    case 4
        d=1/2*D+1/2*D*rand(1,num);
        h=1/2*H+1/2*H*rand(1,num);
        w=1/2*W+1/2*W*rand(1,num);

    case 5
        d=1+(1/2*D-1)*rand(1,num);
        h=1+(1/2*H-1)*rand(1,num);
        w=1+(1/2*W-1)*rand(1,num);

    case 6
        
        d=1+9*rand(1,num);
        h=1+9*rand(1,num);
        w=1+9*rand(1,num);

    case 7
        
        d=1+34*rand(1,num);
        h=1+34*rand(1,num);
        w=1+34*rand(1,num);

    case 8
        
        d=1+99*rand(1,num);
        h=1+99*rand(1,num);
        w=1+99*rand(1,num);

    end

    
    for i=1:num
       box(i).h=h(i);
       box(i).w=w(i);
       box(i).d=d(i);
       box(i).vol=box(i).d*box(i).w*box(i).h;
       box(i).mindim=min([box(i).d,box(i).w,box(i).h]);
    end
    
    end
   
end