%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filename: ss2_lab4_single_echo.m
%Author: Johannah Rosenblum
%Date: 25.06.2018
%Description: Is a function 
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y] = ss2_lab4_single_echo(x,a,R)
y = x;
N = length(x);
for n = 1:1:N
    if (n - R) > 0 % meets continuity property
        y(n) = x(n)+a*x(n-R);
   end
end
end