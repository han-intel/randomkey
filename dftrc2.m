function [emso,orientationo]=dftrc2(box,bin)
emses=bin.emses;
maxdist=-1;
boo=-1;
emso='';
orientationo=[];
for i=1:length(emses)
    ems=emses(i);
    origin.x=ems.minx;
    origin.y=ems.miny;
    origin.z=ems.minz;
    orientations=[];
    ismax=0;
    for j=1:6
        orientation=j;
        bspace=getspace(box,orientation,origin);
        dist=spacefit(bspace,ems,bin);
        if dist<0
            continue;
        end
        orientations=[orientations j];
        if dist>maxdist
            maxdist=dist;
            emso=ems;
            boo=orientation;
            ismax=1;
        end
    end    
    if ismax==1
        orientationo=orientations;
    end
end

end