%This code is mean't to employ Simpson's 1/3 rule

%function [I] = Simpson(x, y)
clear
clc

%I = 
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%end

% Two important quantities when studying fermentation are the carbon dioxide
% evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated
% from expiremental analysis of the inlet and exit gases of the fermentor, and the
% flow rates, temperature, and pressure of these gases
% Time of Fermentation (hours)
time = [140, 141];

CO2evo = [15.72, 15.53, 10];
OxUp = [15.59, 16.16 ];



if length(OxUp) && length(time) == 2
    a = time(1);
    b = time(2);
    I = ((b-a)*((OxUp(1)+OxUp(2)/(2))))
else length(OxUp)~=length(time);
    error('Trapezoidal rule ineligible')
end








    


