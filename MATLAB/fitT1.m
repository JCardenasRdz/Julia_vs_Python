function [ T1, RSQ ] = fitT1( xdata, ydata )
%UNTITLED3 Summary of this function ydata here
%   Detailed explanation goes here

% normalize
ydata= ydata / ydata(end);
   
%
T1rec = @(p, x_) p(1)*(1-exp(-x_/p(2)));

% fit
optimset('lsqcurvefit');
opts = optimset('lsqcurvefit');
opts.Display ='off';

pars = lsqcurvefit(T1rec,[1.0, 2.0],xdata,ydata, [], [], opts);

T1  = pars(2);
% evaluate fitting
yhat = T1rec(pars, xdata);
RSQ  = r_squared(ydata, yhat);


end

