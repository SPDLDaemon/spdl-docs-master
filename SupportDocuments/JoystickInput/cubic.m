function [ out ] = cubic(x ,w)
%CUBIC Summary of this function goes here
%   Detailed explanation goes here

out = w.*x.^3 + (1-w)*x;

end

