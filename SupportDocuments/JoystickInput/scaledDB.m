function [out] = scaledDB(x, fun, delta)
%SCALEDDB Summary of this function goes here
%   Detailed explanation goes here

out = (fun(x) - sign(x)*fun(delta)) ./ (max(fun(x)) - fun(delta));

out(abs(x) < delta) = 0;

end

