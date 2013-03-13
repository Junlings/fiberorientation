function [ang,lem] = quicksampling(sim,fg,index,gamm1,gamm2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    fgn = {};
    

    % place all fibers in space
    fprintf('generate fiber sampling seq:%i\n',index); 
    fgn = fg.gen_fiber();
    fgn = fgn.cross_check(gamm1,gamm2);
    lem = fgn.lem;
    ang = fgn.ang_cross;

end