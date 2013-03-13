clear;
close all;

% parameters
Pi = 3.1415926;
vf = 0.02;  % volume fraction
cube = 2;   % space cube dimension
Lf = 0.5;   % fiber length
df = 0.008; % fiber diameter

orient_type = 'strong_principal'; %'random';%'strong_principal';   % orientation distribution type
kappa1 = 1;                         % uniformity parameter of theta1
kappa2 = 1;                     % uniformity parameter of theta2

sig_type = 'uniform';               % post-crack stress model type  
ta = 1.0;                           % interfacial shear stress

gamm1 = 0*Pi;   % cut plane angle, plane vector in xy plane vs. x axis 
gamm2 = 1/6*Pi;     % cut plane angle, plane vector  vs. xy plane axis 

% create typical fiber
fb1 = Singlefiber(Lf,df);


%fg1.plot_single_angle();  % plot angle distribution


% start sampling 
nsample = 1000;% number of total placement
res = {};

for i=1:10
    kappa2 = 0.1*i; 
    % create fib8er group
    fg1 = Fibergroup(vf,cube);
    % generate fiber based on settings
    fg1 = fg1.gen_fiber(fb1,orient_type,kappa1,kappa2);
    
    res{i}.gamm1 = gamm1;
    res{i}.gamm2 = gamm2;
    res{i}.kappa1 = kappa1;
    res{i}.kappa2 = kappa2;
    res{i}.nsample = nsample;
    
    fprintf('==============generate fiber sampling group:%i=====\n',i); 
    
    for j=1:nsample

        MySim = Simulation();                  % generate sampling instance
        [ang,lem] = MySim.quicksampling(fg1,j,gamm1,gamm2);   % Do the sampling
        res{i}.lem{j} = lem;
        res{i}.ang{j} = ang;
        res{i}.n_coss{j} = length(ang);

    end
   
end

savefile = 'axis_gamma_066.mat';
save(savefile, 'res');

