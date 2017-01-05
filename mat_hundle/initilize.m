%初始化种群
%pop_size: 种群大小
%chromo_size: 染色体长度

function initilize(pop_size, chromo_size)
global pop;
global D;
global K;
global C;
for i=1:pop_size
    for j=1:chromo_size
        pop(i,j) = round(rand);
    end
end
for i=1:11*3
    for j=1:12*3
        D(i,j) = sqrt((400 / 3 * (6 - i*3))^2 + (1600 / 11 * (5 - j*3))^2);
        K(i,j) = round(rand*12);
    end
end
for i=1:13
    for j=1:13
        C(i,j) = 0;
        if i ~= j
            C(i,j) = round(rand*100);
        end
    
    end
end
    
clear i;
clear j;