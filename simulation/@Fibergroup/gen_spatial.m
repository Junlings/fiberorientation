function fg =gen_spatial(fg)
% for now only the uniform spatial distribution case

% generate uniform distributed fiber at x,y,z location
fg.XYZ = unifrnd(0,fg.cube,fg.nfib,3);

end