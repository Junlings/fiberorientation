function [ang,lem]=cross_check(sim,gamm1,gamm2)
    
    % based on the complete fiber distribution in space defined in res
    % to generate the crossing subgroup based on cut plane defined by 
    %                                        (gamm1,gamm2)
    ang = [];
    lem = [];
    for i=1:length(sim.fgn)
        [fib_final,angle_cross,embedlength] = sim.fgn{i}.cross_check(gamm1,gamm2);
        ang = [ang angle_cross];
        lem = [lem embedlength ];
    end
end