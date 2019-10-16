% fit a space into another space and calculate the distance
function [dist]=spacefit(bspace,ems,bin)
dist=-1;
h=bspace.maxz-bspace.minz;
w=bspace.maxy-bspace.miny;
d=bspace.maxx-bspace.minx;
if bspace.minx>=ems.minx && bspace.maxx<=ems.maxx && ...
   bspace.miny>=ems.miny && bspace.maxy<=ems.maxy && ...
   bspace.minz>=ems.minz && bspace.maxz<=ems.maxz
    dist=(bin.d-ems.minx-d).^2+(bin.w-ems.miny-w).^2+(bin.h-ems.minz-h).^2;
end

end