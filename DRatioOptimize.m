function [B]=DRatioOptimize(AssetVarCov)

nAC=size(AssetVarCov,2);
w0=ones(1,nAC)./nAC;
LB=zeros(1,nAC);
UB=ones(1,nAC);
Aeq=ones(1,nAC);
Beq=1;

Obj=@(weights) -DRatio(weights,AssetVarCov);
B=fmincon(Obj,w0,[],[],Aeq,Beq,LB,UB,[]);


function [y]=DRatio(weights, AssetVarCov)

    PVar=weights*AssetVarCov*weights';

    [y]=weights*sqrt(diag(AssetVarCov))/sqrt(PVar);
    
end

end