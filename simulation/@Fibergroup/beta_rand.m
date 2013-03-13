function [ r ] = beta_rand( m,n,A,B,v )
%BETA_RAND Summary of this function goes here
%   Detailed explanation goes here
R = betarnd(A,B,v);
r = -(m-n).*R;
end

