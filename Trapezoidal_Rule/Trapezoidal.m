function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
    error('x and y input must be the same length')
end


%Turns out I don't need evenly spaced y data as that isn't how anything in
%real life works
%spacingofvectory = y(2)-y(1);
spacingofvectorx = x(2)-x(1);

for i = 1:length(x)-1
    if x(i+1)-x(i) ~= spacingofvectorx
        error('The X input vector is not evenly spaced')
    end
end

if length(x) == 2
    a = x(end-1);
    b = x(end);
    I = (b-a).*((y(end-1)+y(end))./2);
    warning('Trapezoid rule will be used on the last two data points')

elseif length(x) == 3
    a = x(1)
    b = x(end)
    n = length(x)-1;
    I = (b - a)*((y(1)+4*y(2)+y(end))/(3*n));
    
    
else
    
    
    finalSegment = 0;
    
    if rem((length(x)-1),2) ~=0
        c = x(end-1);
        d = x(end);
        finalSegment = (d-c)*(y(end-1)+y(end))/2;
        x(length(x)) = [];
        y(length(x)) = [];
        warning('Trapezoid rule will be used on the last two data points')
    end

    n = length(x)-1;
    a = x(1);
    b = x(end);
    odd = [];
    even = [];

    %Odd number of segments

    for i = 1:length(x)
        if rem(i,2) == 0
            odd(end+1) = y(i);
        end
    end

    %Even number of segments

    for i = 2:length(x)
        if rem(i,2) ~= 0
            even(end+1) = y(i);
        end
    end
%This is the code used to implement the composite simpsons rule
    I = (b-a)*(y(1)+4*sum(odd)+2*sum(even)+y(end))/(3*n)+finalSegment;
end
end