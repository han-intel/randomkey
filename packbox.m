% pack the box into the bin
function [bin]=packbox(box,orientation,origin,bin,varargin)
mindim=varargin{1};
minvol=varargin{2};
bspace=getspace(box,orientation,origin);
bin.boxspaces=[bin.boxspaces bspace];
[emsesnew]=emptymaximalspace(bspace,bin.emses,mindim,minvol);
bin.emses=emsesnew;

end