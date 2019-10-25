clear;
% generate instance
n=50;
classtype=7;
[bin,boxes]=generator(n,classtype);
% calculate minimal dimension and volume
mindim=intmax;
minvol=intmax;
for i=1:length(boxes)
    mindim=min([mindim,boxes(i).mindim]);
    minvol=min([minvol,boxes(i).vol]);
end
% genetic progress
% parpool(3);
tb=clock;
[chromosome,fitness,bins]=genetic(bin,boxes,mindim,minvol);
et=etime(clock,tb);
fprintf('elapsed time: %f\n',et);
% plot the package
plotpacking(bins);







