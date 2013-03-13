function [ fb ] = sim_sig(fb,type,ta,ang_cross,lem)
%function to estimate the post crack bridging force
%   inpurres  : input sampling dataset
%   ta        : uniform distributed interfacial stress
    df = fb.df;
    sig = 0;
    
    switch type
        case 'uniform'
            sig = ta*3.1415926*df*cos(ang_cross)*lem;
    end
    
    fb.sig = sig;
end

