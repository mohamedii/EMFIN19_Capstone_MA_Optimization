%%
LB=zeros(1,nAC);
UB=ones(1,nAC);
Aeq=ones(1,nAC);
Beq=1;

%set medium scale option
options=optimset('LargeScale','off');

i=1;
Q=20;

    MVW{1}=quadprog(AssetVarCov{i},w0,[],[],Aeq,Beq,LB,UB,w0,options);
    MVWeights(1,:)=MVW{1};
    sigmaMV(1)=sqrt(MVWeights(1,:)*AssetVarCov{i}*MVWeights(1,:)');
    xRetMV(1)=MVWeights(1,:)*AssetExpReturns(i,:)';
    
Y=linspace(xRetMV(1),max(AssetExpReturns(i,:)),Q);
Aeq=[ones(1,nAC); AssetExpReturns(i,:)];

for k=2:Q

    Beq=[1 Y(k)]';
    
%% Want to minimize this... Variance
    MVW{k}=quadprog(AssetVarCov{i},w0,[],[],Aeq,Beq,LB,UB,w0,options);
    MVWeights(k,:)=MVW{k};
    sigmaMV(k)=sqrt(MVWeights(k,:)*AssetVarCov{i}*MVWeights(k,:)');
    xRetMV(k)=MVWeights(k,:)*AssetExpReturns(i,:)';
    
end

% H=0/12;
% alpha=0.33;
% Z=norminv(alpha,0,1);
% 
% C=@(x) H-Z*x;
% sigma=linspace(0,sigmaMV(end),Q);
% 
% ER=C(sigma);

scatter(sqrt(12)*sigmaMV(1:end),12*xRetMV(1:end),'r');
xlabel('Annualized Portfolio Standard Deviation');
ylabel('Annualized Portfolio Return');
title('Mean-Variance Efficient Frontier');

% hold on
% plot(sigma,ER)
% hold off
