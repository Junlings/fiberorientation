function [ sim] = sim_sig(sim,type,ta,gamm1,gamm2)
%function to estimate the post crack bridging force
%   inpurres  : input sampling dataset
%   ta        : uniform distributed interfacial stress
    sig = [];
    
    % loop over all sampling
    for i=1:length(sim.fgn)
        fprintf('generate fiber crossing for seq%i\n',i); 
        sim.fgn{i} = sim.fgn{i}.sim_sig(type,ta,gamm1,gamm2);
        sig = [sig sim.fgn{i}.sig];
    end
    
    sim.sig =sig;
    sim.sig_mean_sim = mean(sig);
    sim.sig_std_sim = std(sig);
    
    kappa1 = sim.fgn{1}.orient_kappa1;
    kappa2 = sim.fgn{1}.orient_kappa2;
    sim.fgn{1} = ana_sig(sim.fgn{1},...
        type,ta,kappa1,kappa2,gamm1,gamm2);

    sim.sig_mean_ana = sim.fgn{1}.sig_mean_ana;
    sim.sig_std_ana = sim.fgn{1}.sig_std_ana;
end

