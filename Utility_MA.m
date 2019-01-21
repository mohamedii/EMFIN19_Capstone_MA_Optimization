%%

gamma=10;
H=-0.1/12;
alpha=0.1;

g1=6;
g2=12;
g3=24;

MAU=zeros(T,1);
U1=zeros(T,1);
U2=zeros(T,1);
U3=zeros(T,1);

MAReturns=zeros(T,1);
MAVariance=zeros(T,1);
impliedG=zeros(T,1);
MAWeights=zeros(T,nAC);

MVU1Returns=zeros(T,1);
MVU1Variance=zeros(T,1);
MVU1Weights=zeros(T,nAC);

MVU2Returns=zeros(T,1);
MVU2Variance=zeros(T,1);
MVU2Weights=zeros(T,nAC);

MVU3Returns=zeros(T,1);
MVU3Variance=zeros(T,1);
MVU3Weights=zeros(T,nAC);

MAP=zeros(T+1,1);
MVU1P=zeros(T+1,1);
MVU2P=zeros(T+1,1);
MVU3P=zeros(T+1,1);

MAP(1)=100;
MVU1P(1)=100;
MVU2P(1)=100;
MVU3P(1)=100;

for k=1:T
    %% Mental Account
    Obj=@(g) MAOptimize(g,alpha,AssetExpReturns(k,:),AssetVarCov{k});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [~,B{k}]=MAOptimize(impliedG(k),alpha,AssetExpReturns(k,:),AssetVarCov{k});
    
    MAReturns(k)=B{k}*AssetExpReturns(k,:)';
    MAVariance(k)=B{k}*AssetVarCov{k}*B{k}';
    MAWeights(k,:)=B{k};
    MAP(k+1)=MAP(k)*MAWeights(k,:)*(1+returns(n+k,2:end))';
    
    clear B
    
    %% MV Utility Only gamma=g1
    B{k}=MVUtilityOptimize(g1,AssetExpReturns(k,:),AssetVarCov{k});
    
    MVU1Returns(k)=B{k}*AssetExpReturns(k,:)';
    MVU1Variance(k)=B{k}*AssetVarCov{k}*B{k}';
    MVU1Weights(k,:)=B{k};
    MVU1P(k+1)=MVU1P(k)*MVU1Weights(k,:)*(1+returns(n+k,2:end))';
    
    clear B
    
    %% MV Utility Only gamma=g2
    
    B{k}=MVUtilityOptimize(g2,AssetExpReturns(k,:),AssetVarCov{k});
    
    MVU2Returns(k)=B{k}*AssetExpReturns(k,:)';
    MVU2Variance(k)=B{k}*AssetVarCov{k}*B{k}';
    MVU2Weights(k,:)=B{k};
    MVU2P(k+1)=MVU2P(k)*MVU2Weights(k,:)*(1+returns(n+k,2:end))';
    
    clear B
    
    %% MV Utility Only gamma=g3

    B{k}=MVUtilityOptimize(g3,AssetExpReturns(k,:),AssetVarCov{k});
    
    MVU3Returns(k)=B{k}*AssetExpReturns(k,:)';
    MVU3Variance(k)=B{k}*AssetVarCov{k}*B{k}';
    MVU3Weights(k,:)=B{k};
    MVU3P(k+1)=MVU3P(k)*MVU3Weights(k,:)*(1+returns(n+k,2:end))';
    
    clear B
    
end

% plot(alpha,xReturns);
% scatter(impliedG,sqrt(xVariance));
% plot(alpha,impliedG);
% scatter(sqrt(xVariance),xReturns);

plot(MAP')
hold on
plot(MVU1P')
plot(MVU2P')
plot(MVU3P')
legend('Mental Account','MV Utility g1','MV Utility g2','MV Utility g3');
hold off

%% Maximized (through optimization) Quadratic Utilty
for k=1:T
    MAU(k)=MAWeights(k,:)*AssetExpReturns(k,:)'-0.5*impliedG(k)*MAWeights(k,:)*AssetVarCov{k}*MAWeights(k,:)';
    U1(k)=MVU1Weights(k,:)*AssetExpReturns(k,:)'-0.5*g1*MVU1Weights(k,:)*AssetVarCov{k}*MVU1Weights(k,:)';
    U2(k)=MVU2Weights(k,:)*AssetExpReturns(k,:)'-0.5*g2*MVU2Weights(k,:)*AssetVarCov{k}*MVU2Weights(k,:)';
    U3(k)=MVU3Weights(k,:)*AssetExpReturns(k,:)'-0.5*g3*MVU3Weights(k,:)*AssetVarCov{k}*MVU3Weights(k,:)';
end

plot(MAU)
hold on
plot(U1)
plot(U2)
plot(U3)
legend('MAU','U1','U2','U3');
hold off

