%对个体按适应度大小进行排序，并且保存最佳个体
%pop_size: 种群大小
%chromo_size: 染色体长度

function rank(pop_size, chromo_size,type)
global fitness_value;
global fitness_table;
global fitness_avg;
global best_fitness;
global best_individual;
global best_generation;
global pop;
global G;

for i=1:pop_size    
    fitness_table(i) = 0.;
end

min = 1;
max = 1;
temp = 1;
temp1(chromo_size)=0;
if type == 1 || type == 2
for i=1:pop_size
    min = i;
    for j = i+1:pop_size
        if fitness_value(j)<fitness_value(min);
            min = j;
        end
    end
    if min~=i
        temp = fitness_value(i);
        fitness_value(i) = fitness_value(min);
        fitness_value(min) = temp;
        temp = pop(i);
        for k = 1:chromo_size
            temp1(k) = pop(i,k);
            pop(i,k) = pop(min,k);
            pop(min,k) = temp1(k);
        end
    end
end
end
if type == 3 || type == 4
for i=1:pop_size
    max = i;
    for j = i+1:pop_size
        if fitness_value(j)>fitness_value(max);
            max = j;
        end
    end
    if min~=i
        temp = fitness_value(i);
        fitness_value(i) = fitness_value(min);
        fitness_value(min) = temp;
        temp = pop(i);
        for k = 1:chromo_size
            temp1(k) = pop(i,k);
            pop(i,k) = pop(max,k);
            pop(max,k) = temp1(k);
        end
    end
end
end
for i=1:pop_size
    if i==1
        fitness_table(i) = fitness_table(i) + fitness_value(i);    
    else
        fitness_table(i) = fitness_table(i-1) + fitness_value(i);
    end
end
fitness_table
fitness_avg(G) = fitness_table(pop_size)/pop_size;


if fitness_value(pop_size) > best_fitness
    best_fitness = fitness_value(pop_size);
    best_generation = G;
    for j=1:chromo_size
        best_individual(j) = pop(pop_size,j);
    end
end


clear i;
clear j;
clear k;
clear min;
clear max;
clear temp;
clear temp1;