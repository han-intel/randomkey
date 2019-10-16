% eliminate invalid empty maximal space
function [emsesleft]=eliminateems(emses)
emsesleft=[];
els=[];
for i=1:length(emses)
    if ismember(i,els)
        continue;
    end
%     eliminate the thin ones
    ems=emses(i);
    if ems.maxx-ems.minx<1 || ems.maxy-ems.miny<1 || ems.maxz-ems.minz<1
        continue;
    end
%     elminate the inscribed ones
    for j=i+1:length(emses)
        if ismember(j,els)
            continue;
        end
        emsi=emses(j);
        if ems.minx>=emsi.minx && ems.maxx<=emsi.maxx && ...
           ems.miny>=emsi.miny && ems.maxy<=emsi.maxy && ...
           ems.minz>=emsi.minz && ems.maxz<=emsi.maxz
            els=[els i];
            break;
        end
        if emsi.minx>=ems.minx && emsi.maxx<=ems.maxx && ...
           emsi.miny>=ems.miny && emsi.maxy<=ems.maxy && ...
           emsi.minz>=ems.minz && emsi.maxz<=ems.maxz
            els=[els j];
        end
        
    end
    if ~ismember(i,els)
        emsesleft=[emsesleft ems];
    end
end



end