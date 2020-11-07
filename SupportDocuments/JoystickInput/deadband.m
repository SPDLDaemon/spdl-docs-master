function [ out ] = deadband( x, delta)
%DEADBAND Summary of this function goes here
%   Detailed explanation goes here

x(abs(x) < delta) = 0;
out = x;

end

