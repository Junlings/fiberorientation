clear;
close all;
load 'data/angcollect';

nbin = 30;
cf = {};
table_n ={};
table_c = {};
table_kappa2 = zeros(7,10);
table_gamm2 = zeros(7,10);
for i=1:7
    table_n{i} = zeros(30,10);
    table_c{i} = zeros(30,10);

    for j=1:10

        [fh,xh,flo,fup] = ecdf(ang{i,j}.ang);
        [n_theta3,c_theta3] = ecdfhist(fh,xh,nbin);
        
        table_n{i}(:,j) = n_theta3;
        table_c{i}(:,j) = c_theta3;


    end
    
end

savefile = 'nbin_angle';
save(savefile, 'table_n','table_c');


