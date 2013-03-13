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
kappa2 = 0.2;                     % uniformity parameter of theta2

sig_type = 'uniform';               % post-crack stress model type  
ta = 1.0;                           % interfacial shear stress


gamm1 = 0*Pi;   % cut plane angle, plane vector in xy plane vs. x axis 
gamm2 = 0*Pi;     % cut plane angle, plane vector  vs. xy plane axis 

% create typical fiber
fb1 = Singlefiber(Lf,df);

% create fiber group
fg1 = Fibergroup(vf,cube);

% generate fiber based on settings
fg1 = fg1.gen_fiber(fb1,orient_type,kappa1,kappa2);
fg1.plot_single_angle();  % plot angle distribution



% generate fiber crossing
fg1 = fg1.cross_check(gamm1,gamm2);
fg1.plot_single_crossing(gamm1,gamm2);  % plot 3d shape

% estimate sig by simulation
fg1 = fg1.sim_sig(sig_type,ta,gamm1,gamm2);

% estimate sig by formula
fg1 = ana_sig(fg1,sig_type,ta,kappa1,kappa2,gamm1,gamm2);


% start sampling 
nsample = 1000;                          % number of total placement
MySim = Simulation();                  % generate sampling instance
MySim = MySim.sampling(fg1,nsample);   % Do the sampling


MySim = MySim.sim_sig(sig_type,ta,gamm1,gamm2);  % calculate the stress
MySim.plot_hist(nsample,'ang_cross');                        % generate hist plot

MySim = MySim.progress_mean();
savefile = 'axis_02.mat';
save(savefile, 'MySim');

