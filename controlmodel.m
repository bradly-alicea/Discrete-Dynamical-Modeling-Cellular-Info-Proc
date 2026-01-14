function [FF,FB,SINK_TST,SINK_TLT] = controlmodel(TLT, TST)
% acquire matrix from pre-processing tool (raw Ct values). TLT and TST must
% be the same dimensions.
%%
a = length(TLT(:,1));
b = length(TLT(1,:));
c = 2:length(TLT(1,:));
% count of number of genes in analysis. Create an index for normalization w.r.t. control.
%%
for i = c
	for j = a
	TLT_2(j,i) = -1*(TLT(j,1)-TLT(j,i))
end
for i = c
	for j = a
	TST_2(j,i) = -1*(TST(j,1)-TST(j,i))
end
end
%%
% normalize w.r.t control (row 1) for each gene (column). Can either use
% these matrices (no initial condition) or original matrices (provides an
% initial condition -- e.g. formal input). 
%%
% control model parameters (next four matrices -- FF, FB, SINK_TST, SINK_TLT -- serve as outputs).
%%
for i = b
    for j = a
    if TLT(i,j)>TST(i,j)
        FF(i,j) = abs(TLT(i,j)-TST(i,j))
    else
        FF(i,j) = 0
end
end
%%
% define feedforward (FF) component.
%%
for i = b
    for j = a
    if TLT(i,j)>TST(i+1,j)
        FB(i,j) = abs(TLT(i+1,j)-TST(i,j))
    else
        FB(i,j) = 0
end
end
%%
% define feedback (FB) component.
%%
for i = b
    for j = a
    if TST(i+1,j)<TST(i,j)
        SINK_TST(i,j) = abs(TST(i+1,j)-TST(i,j))
    else
        SINK_TST(i,j) = 0
end
end
%%
% define sink for transcriptome (SINK_TST) component.
%%
for i = b
    for j = a
    if TLT(i+1,j)<TLT(i,j)
        SINK_TLT(i,j) = abs(TLT(i+1,j)-TLT(i,j))
    else
        SINK_TLT(i,j) = 0
end
end
%%
% define sink for translatome (SINK_TLT) component.
%%
%%
% Please use responsibly. Courtesy (2012) of Orthogonal Research,
% bradly.alicea@outlook.com


        
        

