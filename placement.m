% place the boxes into the bins
function [bins]=placement(bps,vbo,bin,boxes)
% initiate the variables
bins=[bin];
nb=1;
n=length(boxes);

% place all the boxes
for i=1:n
    binnoselected=0;
    emsselected='';
    boxnotopack=bps(i);
    box=boxes(boxnotopack);    
% iterate each bin for packing
    for j=1:nb
        [emsselected,orientationsfeasible]=dftrc2(box,bins(j));
        if ~isempty(emsselected)
            binnoselected=j;
            break;
        end
    end
% open a new bin
    if binnoselected==0
        binnoselected=nb+1;
        bins=[bins bin];
        nb=nb+1;
        [emsselected,orientationsfeasible]=dftrc2(box,bin);
        if isempty(emsselected)
            error('there is a box not feasible for a empty bin!');
        end
    end
% select the orientation
    boselected=orientationsfeasible;
    nbos=length(boselected);
    boo=boselected(ceil(vbo(boxnotopack)*nbos));
% pack box
    origin.x=emsselected.minx;
    origin.y=emsselected.miny;
    origin.z=emsselected.minz;
    bins(binnoselected)=packbox(boxes(boxnotopack),boo,origin,bins(binnoselected));
end
end