function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varagin)

if nargin < 3
    error('More inputs are needed (Lower x bound and Upper x bound')

elseif nargin < 4
    disp('Default ES will be set too 0.0001%')
    es = 0.0001;
elseif nargin < 5
    maxit = 200;
    es = 0.0001;
end

%%

funcU = func(xu);
funcL = func(xl);
%%
ea = 100;
i = 0;
fancy = xl;
while ea > es
   extrafancy = fancy
   fancy = xu-((funcU*(xl-xu))/(funcL-funcU));
   fnew = func(fancy)
   if fnew < 0
       xl = fancy
   elseif fnew > 0
       xu = fancy
   end
   i = i+1
   ea = abs((fancy - extrafancy)/fancy)*100;
end
%%
iter = i;
root = fancy;
fx = fnew





% if nargin < 3
%     error('input at least func, xlower,and xupper.')
% elseif nargin < 4
%     es = .0001;
% elseif nargin < 5
%     es = .0001;
%     maxit = 200;
% end
% %%
% funcU = func(xu);
% funcL = func(xl);
% %%
% n = xl;
% ea=100;
% i=0;
% while ea > es
%     o = n;
%     n= xu-((funcU.*(xl-xu))/(funcL-funcU));
%     x=n;
%     fn =  func(n);
%     if fn > 0
%         xu = n;
%     elseif fn < 0
%         xl = n;
%     end
%     i=i+1;
%     ea =abs((n-o)/n)*100;
% end
% %%
% fx = fn;
% iter=1;
% root = x;

    

       






    