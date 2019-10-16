% get the box space of a box
function [space] = getspace(box,orientation,origin)
space.minx=origin.x;
space.miny=origin.y;
space.minz=origin.z;
% seqence correspond to depth(x) width(y) height(z)
switch orientation
    case 1%'xyz'
        space.maxx=space.minx+box.d;
        space.maxy=space.miny+box.w;
        space.maxz=space.minz+box.h;
    case 2%'xzy'
        space.maxx=space.minx+box.d;
        space.maxy=space.miny+box.h;
        space.maxz=space.minz+box.w;
    case 3%'yxz'
        space.maxx=space.minx+box.w;
        space.maxy=space.miny+box.d;
        space.maxz=space.minz+box.h;
    case 4%'yzx'
        space.maxx=space.minx+box.w;
        space.maxy=space.miny+box.h;
        space.maxz=space.minz+box.d;
    case 5%'zxy'
        space.maxx=space.minx+box.h;
        space.maxy=space.miny+box.d;
        space.maxz=space.minz+box.w;
    case 6%'zyx'
        space.maxx=space.minx+box.h;
        space.maxy=space.miny+box.w;
        space.maxz=space.minz+box.d;
end


end