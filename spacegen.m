% generate new empty maximal space
function [emses]=spacegen(bspace,space)
emses=[];
if bspace.minx>space.minx
    ems=space;
    ems.maxx=bspace.minx;
    emses=[emses ems];
end
if bspace.miny>space.miny
    ems=space;
    ems.maxy=bspace.miny;
    emses=[emses ems];
end
if bspace.minz>space.minz
    ems=space;
    ems.maxz=bspace.minz;
    emses=[emses ems];
end
if bspace.maxx<space.maxx
    ems=space;
    ems.minx=bspace.maxx;
    emses=[emses ems];
end
if bspace.maxy<space.maxy
    ems=space;
    ems.miny=bspace.maxy;
    emses=[emses ems];
end
if bspace.maxz<space.maxz
    ems=space;
    ems.minz=bspace.maxz;
    emses=[emses ems];
end


