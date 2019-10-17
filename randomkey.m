clear;
% generate instance
n=20;
classtype=2;
[bin,boxes]=generator(n,classtype);
% genetic progress
tb=clock;
[chromosome,fitness,bins]=genetic(bin,boxes);
et=etime(clock,tb);
fprintf('elapsed time: %f',et);
% plot the package
plotpacking(bins);







