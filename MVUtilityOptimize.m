function [B]=MVUtilityOptimize(gamma,AssetExpReturns,AssetVarCov)

nAC=size(AssetExpReturns,2);
w0=ones(1,nAC)./nAC;
LB=zeros(1,nAC);
UB=ones(1,nAC);
Aeq=ones(1,nAC);
Beq=1;

Obj=@(w) -(w*AssetExpReturns'-(0.5*gamma)*w*AssetVarCov*w');
B=fmincon(Obj,w0,[],[],Aeq,Beq,LB,UB,[]);