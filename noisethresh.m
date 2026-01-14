function [UP,LO,SIGMA] = noisethresh(TST_1,TST_2,TST_3,TST_4)
%%
% noise terms can also be added to model. If multiple input matrices exist
% for TST and TLT, standard deviation calculations can be used to find 
% theoretical minimum and maximum noise thresholds for each component,
% timepoint combination.
%%
a = 1:length(TST_1(:,1));
b = 1:length(TST_1(1,:));
%%
% define index based on size of input matrix. All matrices should be the same size.
%%
for x = a
for y = b
N = [TST_1(x,y),TST_2(x,y),TST_3(x,y),TST_4(x,y)];
S = std(N,1);
M = mean(N);
U = M+S;
L = M-S;
UP(x,y) = U;
LO(x,y) = L;
SIGMA(x,y) = S;
end
end
%%
% nested for loops extract descriptive parameters for each x,y pair across all matrices. The upper-bound, lower-bound, and sigma value (in this case, the standard deviation) is returned as output.
%% 
% Please use responsibly. Courtesy (2012) of Orthogonal Research,
% bradly.alicea@outlook.com

