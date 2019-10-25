% evaluate the solution
function [anb bins]=evaluate(chromosome,bin,boxes,varargin)
mindim=varargin{1};
minvol=varargin{2};
n=length(chromosome)/2;
% orientation sequence
vbo = zeros(1,n);
for i = 1:n
    brk(i).randomkey=chromosome(i);
    brk(i).orientation=chromosome(i+n);
    vbo(i)=chromosome(i+n);
end
% box packing sequence
bpssort=zeros(n,2);
for i=1:n
    bpssort(i,1)=chromosome(i);
    bpssort(i,2)=i;
end
bpssort=sortrows(bpssort,1);
bps=bpssort(:,2);
bps=reshape(bps,1,n);

% place the boxes into bines
bins=placement(bps,vbo,bin,boxes,mindim,minvol);

% calculate the fitness
anb=calfitness(bins);


end