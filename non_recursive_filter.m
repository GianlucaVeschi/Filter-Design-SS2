%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filename: non_recursive_filter.m
%Author: Johannah Rosenblum
%Date: 27.06.2018
%Description: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y] = non_recursive_filter(x, N, a,R)

%setup y array
y = 1:length(x);

%calculate sum
for n = 1:length(x)
    y(n) = 0;
    for k = 0:N
        if n - R * k > 0 % fulfills causality property
            y(n) = y(n) + power(a, k) * x(n - R * k);
        end
    end
end

end

