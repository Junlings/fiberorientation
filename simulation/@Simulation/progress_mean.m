function  sim = progress_mean(sim)
% this is the function to calculate the progress means of the number of fi
% fiber cross, to determine the minimum sampling number

n_total = length(sim.fgn);

p_mean = [];
p_std = [];
n_cross = [];
for i=1:n_total
    n_cross = [n_cross sim.fgn{i}.n_cross];
    p_mean = [p_mean mean(n_cross)];
    p_std = [p_std std(n_cross)];
end
sim.n_cross = n_cross;
sim.p_mean = p_mean;
sim.p_std = p_std;

