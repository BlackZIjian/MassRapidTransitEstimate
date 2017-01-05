%计算种群个体适应度，对不同的优化目标，此处需要改写
%pop_size: 种群大小
%chromo_size: 染色体长度

function fitness(pop_size, chromo_size,type)
global fitness_value;
global pop;
global D;
global K;
global C;
global G;
for i=1:pop_size
    fitness_value(i) = 0.;    
end
if type == 1
    for z=1:pop_size
    for i=1:11*3
        for j=1:12*3
            for k=i-1:i+1
                for l=j-1:j+1
                    if k>=1 && l>=1 && k<=11*3 && l <=12*3
                        fitness_value(z)= fitness_value(z) + pop(z,(11*3 * (k-1) +(l-1))* 33 + 1); 
                    end  
                end
            end
        end
    end
    end
end
if type == 2
    for z=1:pop_size
    for i=1:11*3
        for j=1:12*3
            
           fitness_value(z)= fitness_value(z) + pop(z,(11*3 * (i-1) +(j-1))* 33 + 1); 
                  
        end
    end    
    end
end

if type == 3
    for z=1:pop_size
    for i=1:11*3
        for j=1:12*3
            if fitness_value(z) < D(i,j) * pop(z,(11*3 * (i-1) +(j-1))* 33 + 1)
           fitness_value(z) = D(i,j) * pop(z,(11*3 * (i-1) +(j-1))* 33 + 1);
            end
                  
        end
    end    
    end
end

if type == 4
    for z=1:pop_size
    for i=1:11*3
        for j=1:12*3
            for k=1:11*3
                for l=1:12*3
                    
                        fitness_value(i,j)= fitness_value(i,j) + pop(z,(11*3 * (k-1) +(l-1))* 33 + 1)*pop(z,(11*3 * (i-1) +(j-1))* 33 + 1)*C(K(i,j)*K(k,l));
                     
                end
            end
        end
    end
    end
end
clear i;
clear j;
clear k;
clear l;
clear z;