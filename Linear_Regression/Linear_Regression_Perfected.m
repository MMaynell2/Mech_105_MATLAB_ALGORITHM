clc
clear

x = [1 2 3 4 5 6];
y = [1 2 1.3 3.75 2.5 100];

if length(x)~=length(y);
    error('Matrices are not equal sizes');
end;

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)


n = length(x);


firstquartile = floor((n+1)/(4));
thirdquartile = floor((3*n+3)/(4));
Q1 = sortedY(firstquartile);
Q3 = sortedY(thirdquartile);
IQR = Q3 - Q1;

lowerthreshold = Q1 - (1.5*IQR)
higherthreshold = Q3 + (1.5*IQR)

x2 = x 
y2 = y

x = []
y = []


for i = 1:n
    if y2(i) >= lowerthreshold && y2(i) <= higherthreshold
        y = [y,y2(i)]
        x = [x,x2(i)]
    end
end
n = length(x)

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)


fX = sortedX
fY = sortedY





a1 = ((n*(sum(x.*y)))-(sum(x)*sum(y)))/(n*(sum(x.^2))-(sum(x))^2)
a0 = mean(y)-a1*(mean(x))





slope = a1
intercept = a0
ybar = mean(y)

sstot = sum((y-ybar).^2)
ssres = sum((y-(x.*slope+intercept)).^2)
Rsquared = 1 - (ssres/sstot)


 






