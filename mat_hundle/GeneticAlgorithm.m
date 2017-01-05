%遗传算法主函数
%pop_size: 输入种群大小
%chromo_size: 输入染色体长度
%generation_size: 输入迭代次数
%cross_rate: 输入交叉概率
%cross_rate: 输入变异概率
%elitism: 输入是否精英选择
%m: 输出最佳个体
%n: 输出最佳适应度
%p: 输出最佳个体出现代
%q: 输出最佳个体自变量值

function [m,n,p,q] = GeneticAlgorithm(pop_size, chromo_size, generation_size, cross_rate, mutate_rate, elitism)

global G ; %当前代
global fitness_value;%当前代适应度矩阵
global best_fitness;%历代最佳适应值
global fitness_avg;%历代平均适应值矩阵
global best_individual;%历代最佳个体
global best_generation;%最佳个体出现代


m(4)=0;
n(4)=0;
p(4)=0;
q(4)=0;
fitness_avg = zeros(generation_size,1);

disp "hhee"

fitness_value(pop_size) = 0.;
best_fitness = 0.;
best_generation = 0;
initilize(pop_size, chromo_size);%初始化
for t=1:4
for G=1:generation_size   
    fitness(pop_size, chromo_size,t);  %计算适应度 
    rank(pop_size, chromo_size,t);  %对个体按适应度大小进行排序
    selection(pop_size, chromo_size, elitism);%选择操作
    crossover(pop_size, chromo_size, cross_rate);%交叉操作
    mutation(pop_size, chromo_size, mutate_rate);%变异操作
end
plotGA(generation_size);%打印算法迭代过程
m(t) = best_individual;%获得最佳个体
n(t) = best_fitness;%获得最佳适应度
p(t) = best_generation;%获得最佳个体出现代


end
clear i;
clear j;
clear t;