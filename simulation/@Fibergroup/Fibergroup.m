classdef Fibergroup
    %single fiber
    %   Detailed explanation goes here
    
    properties
        vf;
        nfib;
        cube;
        XYZ;
        ANG;
        xline;
        yline;
        zline;
        orient_kappa1;
        orient_kappa2;
        orient_type;
        fb;
        sig;
        lem;
        ang_cross;
        n_cross;
        fib_final;
        inter;
        maxdisc;
        sig_mean_ana;
        sig_std_ana;
        rc;
        rs;
    end
    
    methods
        function fg = Fibergroup(vf,cube)
           if nargin > 0 % Support calling with 0 arguments
              fg.vf = vf;
              fg.cube = cube;
           end
           
        end
        % first generate fibers
        fg = gen_fiber(fg,fb,type,gamm1,gamm2);
        
        % check crossing, and get sub crossing fiber group
        fg = cross_check(fg,gamm1,gamm2);
 
        % results visualization
        plot_single_crossing(fg,gamm1,gamm2);
        plot_single_angle(fg);
        
        % calculate the stress
        fg = sim_sig(fg,type,ta,gamm1,gamm2);
        
        %fg = ana_sig(fg,type,ta,kappa1,kappa2,gamm1,gamm2);
        
    end
end

