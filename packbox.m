% pack the box into the bin
function [bin]=packbox(box,orientation,origin,bin)
bspace=getspace(box,orientation,origin);
bin.boxspaces=[bin.boxspaces bspace];
[emsesnew]=emptymaximalspace(bspace,bin.emses)
bin.emses=emsesnew;

end