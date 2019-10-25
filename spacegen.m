% generate new empty maximal space
function [emses]=spacegen(bspace,space)
emses=[];
if bspace.minx>space.minx
    ems=space;
    ems.maxx=bspace.minx;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end
if bspace.miny>space.miny
    ems=space;
    ems.maxy=bspace.miny;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end
if bspace.minz>space.minz
    ems=space;
    ems.maxz=bspace.minz;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end
if bspace.maxx<space.maxx
    ems=space;
    ems.minx=bspace.maxx;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end
if bspace.maxy<space.maxy
    ems=space;
    ems.miny=bspace.maxy;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end
if bspace.maxz<space.maxz
    ems=space;
    ems.minz=bspace.maxz;
    ems.h=ems.maxz-ems.minz;
    ems.d=ems.maxx-ems.minx;
    ems.w=ems.maxy-ems.miny;
    ems.vol=ems.h*ems.d*ems.w;
    emses=[emses ems];
end


