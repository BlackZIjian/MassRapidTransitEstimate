%�Ŵ��㷨������
%pop_size: ������Ⱥ��С
%chromo_size: ����Ⱦɫ�峤��
%generation_size: �����������
%cross_rate: ���뽻�����
%cross_rate: ����������
%elitism: �����Ƿ�Ӣѡ��
%m: �����Ѹ���
%n: ��������Ӧ��
%p: �����Ѹ�����ִ�
%q: �����Ѹ����Ա���ֵ

function [m,n,p,q] = GeneticAlgorithm(pop_size, chromo_size, generation_size, cross_rate, mutate_rate, elitism)

global G ; %��ǰ��
global fitness_value;%��ǰ����Ӧ�Ⱦ���
global best_fitness;%���������Ӧֵ
global fitness_avg;%����ƽ����Ӧֵ����
global best_individual;%������Ѹ���
global best_generation;%��Ѹ�����ִ�


m(4)=0;
n(4)=0;
p(4)=0;
q(4)=0;
fitness_avg = zeros(generation_size,1);

disp "hhee"

fitness_value(pop_size) = 0.;
best_fitness = 0.;
best_generation = 0;
initilize(pop_size, chromo_size);%��ʼ��
for t=1:4
for G=1:generation_size   
    fitness(pop_size, chromo_size,t);  %������Ӧ�� 
    rank(pop_size, chromo_size,t);  %�Ը��尴��Ӧ�ȴ�С��������
    selection(pop_size, chromo_size, elitism);%ѡ�����
    crossover(pop_size, chromo_size, cross_rate);%�������
    mutation(pop_size, chromo_size, mutate_rate);%�������
end
plotGA(generation_size);%��ӡ�㷨��������
m(t) = best_individual;%�����Ѹ���
n(t) = best_fitness;%��������Ӧ��
p(t) = best_generation;%�����Ѹ�����ִ�


end
clear i;
clear j;
clear t;