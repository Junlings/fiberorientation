function sim = sampling(sim,fg,numsample)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    fgn = {};
    
    for i=1:numsample
        % place all fibers in space
        fprintf('generate fiber sampling seq%i\n',i); 
        fgn{i} = fg.gen_fiber();

        
    end
    
    sim.fgn = fgn;
end