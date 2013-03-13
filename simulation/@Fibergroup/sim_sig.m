function  fg  = sim_sig(fg,type,ta,gamm1,gamm2)
%function to estimate the post crack bridging force
%   inpurres  : input sampling dataset
%   ta        : uniform distributed interfacial stress
    sig = 0;
    
    fg = fg.cross_check(gamm1,gamm2);
        
    for i=1:fg.n_cross;
        fg.fb = fg.fb.sim_sig(type,ta,fg.ang_cross(i),fg.lem(i));
        sig = sig + fg.fb.sig;
    end
    
    fg.sig = sig;
end

