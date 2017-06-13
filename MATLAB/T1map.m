clc; clear all;
% load data
MRI_2D = importdata('../data/T1Lemon.csv');
MRI_2D = MRI_2D(:,2:end);
%%
% define variables
TR = [508.2336 ,1000 ,1500 ,2500 ,3500 ,4500 ,5500 ,6500]';
TR = TR / 1000;
Total_Slices = 21;

% model function
foo = @(p, x_) p(1)*(1-exp(-x_/p(2)));

%%
I = MRI_2D(:,1:21:end);
y= I(10000,:)' ;
[t1, rsq] = fitT1(  TR, y  );
%%
Slice = 1;
[rows, ~ ] = size(MRI_2D);
I = MRI_2D(:,Slice:21:end);
T1 = zeros(rows)    ;
RSQ = zeros(rows) ;
%%
tic
for i = 1:rows
    [T1(i), RSQ(i)] = fitT1( TR, I(i,:)' );
end
toc
%%

