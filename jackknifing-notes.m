Generate a distribution for data over the interval 34-37 (replicates for single gene, time point).

s = 10000
%
%% s is the resampling rate.
% 
N = randn(1,.s);
M = N + abs(min(N));
P = M*(1/max(M));
Q = P*range;
%
%% in this case, range = 3.0.
%
R = Q+min(range);
%
%% in this case, range is 34. 
%


Generate an interpolation of each time series.

%
%% need at least 10 points, zero-pad if necessary.
%% get rid of all data after point 300.
%
x = idresamp(T,0.01);
