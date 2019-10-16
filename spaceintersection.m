% get the intersection space of two spaces
function [ispace] = spaceintersection(bspace,espace)

minx=max(espace.minx,bspace.minx);
maxx=min(espace.maxx,bspace.maxx);
miny=max(espace.miny,bspace.miny);
maxy=min(espace.maxy,bspace.maxy);
minz=max(espace.minz,bspace.minz);
maxz=min(espace.maxz,bspace.maxz);


if maxx<=minx || ...
   maxy<=miny || ...
   maxz<=minz
    ispace = '';
else
    ispace.minx=minx;
    ispace.maxx=maxx;
    ispace.miny=miny;
    ispace.maxy=maxy;
    ispace.minz=minz;
    ispace.maxz=maxz;
end

end