function [B]=MVOptimize(AssetExpReturns,AssetVarCov)

nAC=size(AssetExpReturns,2);
w0=ones(1,nAC)./nAC;
LB=zeros(1,nAC);
UB=[0.2 0.2 0.1 0.1 0.1 0.2 0.1];%ones(1,nAC);
Aeq=ones(1,nAC);
Beq=1;

%set medium scale option
options=optimset('LargeScale','off');

B=quadprog(AssetVarCov,w0,[],[],Aeq,Beq,LB,UB,w0,options);