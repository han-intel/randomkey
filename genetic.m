% the random key genetic algorithm
function [chromosome,fitness,bins] = genetic(bin,boxes,varargin)
mindim=varargin{1};
minvol=varargin{2};
n=length(boxes);
populnum=30*n;
elitenum=floor(0.1*populnum);
eliteposs=0.70;
mutantnum=floor(0.15*populnum);
iteratenum=1;

% initate population
populations=cell(populnum,3);
tb1=clock;
for i=1:populnum
% parpool(4);
% parfor i=1:populnum
% random sequence
    chromosome=rand(1,n*2);
    tb=clock;
    [fitness, bins]=evaluate(chromosome,bin,boxes,mindim,minvol);
    et=etime(clock,tb);
    fprintf('evaluate elapsed time: %f\n',et);
    populations(i,:)=[{fitness},{chromosome},{bins}];
end
et1=etime(clock,tb1);
fprintf('initate elapsed time: %f\n',et1);
populations=sortrows(populations,1);
elitepopul=populations(1:elitenum,:);
nomalpopul=populations(elitenum+1:end,:);
% iterate genetic progress
for i=1:iteratenum
    
%     generate mutants
    mutantpopul=cell(mutantnum,3);
    for j=1:mutantnum
%     parfor j=1:mutantnum
        chromosome=rand(1,n*2);
        [fitness, bins]=evaluate(chromosome,bin,boxes,mindim,minvol);
        mutantpopul(j,:)=[{fitness},{chromosome},{bins}];
    end
%     mating and crossover
    evolnum=populnum-elitenum-mutantnum;
    evolpopul=cell(evolnum,3);
    for j=1:evolnum
%     parfor j=1:evolnum
        parentone=elitepopul(ceil(rand(1)*elitenum),:);
        parenttwo=nomalpopul(ceil(rand(1)*(populnum-elitenum)),:);
        evolchrom=zeros(1,n*2);
        for k=1:2*n
            choose=rand(1);
            if choose<eliteposs
                evolchrom(k)=parentone{2}(k);
            else
                evolchrom(k)=parenttwo{2}(k);
            end
        end
        [fitness, bins]=evaluate(evolchrom,bin,boxes,mindim,minvol);
        evolpopul(j,:)=[{fitness},{evolchrom},{bins}];
    end
    
% new generation
    newpopul=cell(populnum,3);
    newpopul(1:elitenum,:)=elitepopul;
    newpopul(elitenum+1:elitenum+mutantnum,:)=mutantpopul;
    newpopul(elitenum+mutantnum+1:end,:)=evolpopul;
    newpopul=sortrows(newpopul,1);
    elitepopul=newpopul(1:elitenum,:);
    nomalpopul=newpopul(elitenum+1:end,:);
end
optimal=newpopul(1,:);
fitness=optimal{1};
chromosome=optimal{2};
bins=optimal{3};

end