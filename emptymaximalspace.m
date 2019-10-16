% generate new empty maximal spaces
function [emsesnew]=emptymaximalspace(bspace,emses)
emsesnew=[];
for i=1:length(emses)
    ems=emses(i);
    ispace=spaceintersection(bspace,ems);
    if ~isempty(ispace)
        emsesnew=[emsesnew spacegen(ispace,ems)];
    else
        emsesnew=[emsesnew ems];
    end
end
emsesnew=eliminateems(emsesnew);
% debug empty maximal space
% plotemptymaximalspace(emsesnew);
end