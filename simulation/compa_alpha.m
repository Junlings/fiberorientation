clear;
close all;
load 'data/ncrosscollect.mat';

alpha_mean = zeros(10,7);
alpha_std = zeros(10,7);


for i=1:7

    for j=1:10

        alpha_mean(i,j) = n_cross{i,j}.n_cross_mean;
        alpha_std(i,j) = n_cross{i,j}.n_cross_std;
    end
end
