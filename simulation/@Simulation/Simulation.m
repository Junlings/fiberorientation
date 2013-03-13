classdef Simulation
    % repeating placement and checking
    
    properties
        fgn;
        n_cross;  % collection of crossing number
        p_mean;   % progress mean of crossing number
        p_std; % progress std
        sig;
        sig_mean_ana;
        sig_std_ana;
        sig_mean_sim;
        sig_std_sim;
    end
    
    methods
        % get angle and embedment length from single simulation
        [ang,em]=cross_check(sim,gamm1,gamm2);
        
        sim = sampling(sim,fg,numsample);
        [ sim] = sim_sig(sim,type,ta,gamm1,gamm2);
        plot_hist(sim,range,type);
        [n_cross ] = get_n_cross( sim );
        [ang_cross ] = get_crossang( sim );
        [ang,lem] = quicksampling(sim,fg,index,gamm1,gamm2)
    end

      
end

