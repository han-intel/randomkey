% eliminate invalid empty maximal space
function [emsesleft]=eliminateems(emses,emsescheck,varargin)
mindim=varargin{1};
minvol=varargin{2};
tb=clock;
emsesleft=[];
els=[];
indexall=1:1:length(emses);
emsesold=setdiff(indexall,emsescheck);
for i=1:length(emses)
    ems=emses(i);
    if ems.d<mindim || ems.h<mindim || ems.w<mindim ||ems.vol<minvol
        els=[els i];
        continue;
    end
end
emsesold=setdiff(emsesold,els);
emsescheck=setdiff(emsescheck,els);
els=[];
for i=1:length(emsesold)
    ems=emses(emsesold(i));
    emsesleft=[emsesleft ems];
    for j=1:length(emsescheck)
        index=emsescheck(j);
%         if ismember(index,els)
%             continue;
%         end
        emsi=emses(index);
        if emsi.minx>=ems.minx && emsi.maxx<=ems.maxx && ...
            emsi.miny>=ems.miny && emsi.maxy<=ems.maxy && ...
            emsi.minz>=ems.minz && emsi.maxz<=ems.maxz
            els=[els index];
        end
    end
%     emsescheck=setdiff(emsescheck,els);
end
emsescheck=setdiff(emsescheck,els);
els=[];
for i=1:length(emsescheck)
    index=emsescheck(i);
    if ismember(index,els)
        continue;
    end
    ems=emses(index);
    for j=1:length(emsescheck)
        if i==j
            continue;
        end
        indexj=emsescheck(j);
        emsi=emses(indexj);
        if ems.minx>=emsi.minx && ems.maxx<=emsi.maxx && ...
           ems.miny>=emsi.miny && ems.maxy<=emsi.maxy && ...
           ems.minz>=emsi.minz && ems.maxz<=emsi.maxz
            els=[els index];
            break;
        end
        if emsi.minx>=ems.minx && emsi.maxx<=ems.maxx && ...
            emsi.miny>=ems.miny && emsi.maxy<=ems.maxy && ...
            emsi.minz>=ems.minz && emsi.maxz<=ems.maxz
            els=[els indexj];
            continue;
        end
        
    end
    if ~ismember(index,els)
        emsesleft=[emsesleft ems];
    end
end
et=etime(clock,tb);
fprintf('eliminateems elapsed time: %f emes num:%f checknum: %f\n',et,length(emses),length(emsescheck));
end