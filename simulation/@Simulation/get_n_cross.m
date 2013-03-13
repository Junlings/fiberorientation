function [n_cross ] = get_n_cross( sim )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    n_cross = [];   
    range = length(sim.fgn);
    for i=1:range
        n_cross = [n_cross sim.fgn{i}.n_cross/400];

    end
end

