function [ang_cross ] = get_crossang( sim )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    ang_cross = [];   
    range = length(sim.fgn);
    for i=1:range
        ang_cross = [ang_cross sim.fgn{i}.ang_cross];

    end
    ang_cross =ang_cross';
end

