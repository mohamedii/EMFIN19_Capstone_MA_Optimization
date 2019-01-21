%% Define vectors and initialize

Q=32;

xReturns=zeros(Q,1);
xStdDev=zeros(Q,1);
MAWeights=zeros(Q,nAC);

%% Generate the efficient portfolios using MAOptimize()
H=0/12;
alpha=0.38;
clear B

i=1;

gamma=linspace(100,0.5,Q);

for k=1:Q
    
    [~,B{k}]=MAOptimize(gamma(k),alpha,AssetExpReturns(i,:),AssetVarCov{i});
    
    xReturns(k)=B{k}*AssetExpReturns(i,:)';
    xStdDev(k)=sqrt(B{k}*AssetVarCov{i}*B{k}');
    MAWeights(k,:)=B{k};
    
end

hold on

scatter(xStdDev,xReturns)

% for i=2:10
%     
%     clear B
%     
%     for k=1:Q
%     
%     [~,B{k}]=MAOptimize(gamma(k),alpha,AssetExpReturns(i,:),AssetVarCov{i});
%     
%     xReturns(k)=B{k}*AssetExpReturns(i,:)';
%     xStdDev(k)=sqrt(B{k}*AssetVarCov{i}*B{k}');
%     MAWeights(k,:)=B{k};
%     
%     end
%     
%     scatter(xStdDev,xReturns)
% 
% end
% 
% hold off

%% Generate threshold boundaries to determine goal probabilities
sigma=linspace(0,xStdDev(end),Q);

alphaL=0.34;
alphaU=0.38;
ZL=norminv(alphaL,0,1);
ZU=norminv(alphaU,0,1);

C=@(x) H-ZL*x;
ERL=C(sigma);

C=@(x) H-ZU*x;
ERU=C(sigma);

plot(sigma(0.25*Q:end),ERL(0.25*Q:end),'p--','Linewidth',0.8)
plot(sigma(0.25*Q:end),ERU(0.25*Q:end),'r--','Linewidth',0.8)
legend('MV Utility Efficient Frontier','VaR constraint where H=0%; alpha=0.34','VaR constraint where H=0%; alpha=0.38')

xlabel('Monthly Portfolio Standard Deviation');
ylabel('Monthly Portfolio Return');
title('Determining Feasibility of MA Portfolios');

hold off