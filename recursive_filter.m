%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filename: recursive_filter.m
%Author: Johannah Rosenblum
%Date: 27.06.2018
%Description: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y] = recursive_filter(x, N, a,R)

%setup y array
y = 1:length(x);

%non-recursive part
for n = 1:length(x)
    if n - R * (N+1) > 0 %fulfill causality property
        y(n) = x(n) - power(a, N+1) * x(n - R * (N+1));
    else
        y(n) = x(n);
    end
end
 
%recursive part
for n = 1:length(x)
    if n - R > 0 %fulfill causality property
        y(n) = y(n) + a * y(n-R);
    end
end
 
end

