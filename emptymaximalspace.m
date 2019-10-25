% generate new empty maximal spaces
function [emsesnew]=emptymaximalspace(bspace,emses,varargin)
mindim=varargin{1};
minvol=varargin{2};
emsesnew=[];
emsescheck=[];
for i=1:length(emses)
    ems=emses(i);
    ispace=spaceintersection(bspace,ems);
    if ~isempty(ispace)
        emsesinter=spacegen(ispace,ems);
        lenb=length(emsesnew);
        len=length(emsesinter);
        checkindex=lenb+1:1:lenb+len;
        emsesnew=[emsesnew emsesinter];
        emsescheck=[emsescheck checkindex];
    else
        emsesnew=[emsesnew ems];
    end
end
emsesnew=eliminateems(emsesnew,emsescheck,mindim,minvol);
% debug empty maximal space
% plotemptymaximalspace(emsesnew);
end