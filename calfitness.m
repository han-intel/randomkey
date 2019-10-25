function [anb] = calfitness(bins)
nb=length(bins);
vboxleastratio=1;
for i=1:nb
    bin=bins(i);
    vbin=bin.h*bin.w*bin.d;
    boxspaces=bin.boxspaces;
    nbox=length(boxspaces);
    vbox=0;
    for j=1:nbox
        vbox=vbox+(boxspaces(j).maxx-boxspaces(j).minx)*...
            (boxspaces(j).maxy-boxspaces(j).miny)*...
            (boxspaces(j).maxz-boxspaces(j).minz);
    end
    loadratio=vbox/vbin;
    if loadratio<vboxleastratio
        vboxleastratio=loadratio;
    end
end
anb=nb+vboxleastratio;
end