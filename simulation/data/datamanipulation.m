clear;
close all;

filename = {'axis_gamma_0.mat',
            'axis_gamma_0125.mat',
            'axis_gamma_025.mat',
            'axis_gamma_033.mat',
            'axis_gamma_0375.mat',
            'axis_gamma_066.mat',
            'axis_gamma_05.mat'};
n_cross = {};
ang = {};
for i = 1:7
    file = filename{i};
    load(file);
    
    for j=1:length(res)
       ang{i,j}.ang = [];
       ang{i,j}.kappa2 = res{j}.kappa2;
       ang{i,j}.gamma2 = res{j}.gamm2;
       
       for n=1:length(res{j}.ang)
           ang{i,j}.ang =[ang{i,j}.ang res{j}.ang{n}];
       end
       
       n_cross_data  = cell2mat(res{j}.n_coss);
       n_cross{i,j}.n_cross_mean = mean(n_cross_data)/400; 
       n_cross{i,j}.n_cross_std = std(n_cross_data)/400; 
       n_cross{i,j}.kappa2 = res{j}.kappa2;
       n_cross{i,j}.gamma2 = res{j}.gamm2;
       
       nbin = 20;
       [fh,xh,flo,fup] = ecdf(n_cross_data./400);
       [n_theta3,c_theta3] = ecdfhist(fh,xh,nbin);
       n_cross{i,j}.c=c_theta3;
       n_cross{i,j}.n=n_theta3;
    end
    
    
    
end

savefile = 'ncrosscollect';
save(savefile, 'n_cross');
