% the random key genetic algorithm
function [chromosome,fitness,bins] = genetic(bin,boxes)
n=length(boxes);
populnum=30*n;
elitenum=0.1*populnum;
eliteposs=0.70;
mutantnum=0.15*populnum;
iteratenum=100;

% initate population
populations=cell(populnum,3);
for i=1:populnum
% random sequence
    chromosome=rand(1,n*2);
    [fitness, bins]=evaluate(chromosome,bin,boxes);
    populations(i,1)={fitness};
    populations(i,2)={chromosome};
    populations(i,3)={bins};
end
populations=sortrows(populations,1);
elitepopul=populations(1:elitenum,:);
nomalpopul=populations(elitenum+1:end,:);
% iterate genetic progress
for i=1:iteratenum
    
%     generate mutants
    mutantpopul=cell(mutantnum,3);
    for j=1:mutantnum
        chromosome=rand(1,n*2);
        [fitness, bins]=evaluate(chromosome,bin,boxes);
        mutantpopul(j,1)={fitness};
        mutantpopul(j,2)={chromosome};
        mutantpopul(j,3)={bins};
    end
%     mating and crossover
    evolnum=populnum-elitenum-mutantnum;
    evolpopul=cell(evolnum,3);
    for j=1:evolnum
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
        [fitness, bins]=evaluate(evolchrom,bin,boxes);
        evolpopul(j,1)={fitness};
        evolpopul(j,2)={evolchrom};
        evolpopul(j,3)={bins};
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