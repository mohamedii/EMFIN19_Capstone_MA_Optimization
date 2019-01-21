%%
RPP(1)=4000;
MVP(1)=4000;
EWP(1)=4000;
DRP(1)=4000;

Cntrb=30;

for k=1:T
    
% %% Want to minimize this... Risk Parity
%     RPWeights(k,:)=RiskParityOptimize(AssetVarCov{k});
%     RPP(k+1)=RPP(k)*RPWeights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb;

%% Want to minimize this... MV Balanced Portoflio 60/40
    MVWeights(k,:)=MVOptimize(AssetExpReturns(k,:),AssetVarCov{k});
    MVReturns(k)=MVWeights(k,:)*AssetExpReturns(k,:)';
    MVVariance(k)=MVWeights(k,:)*AssetVarCov{k}*MVWeights(k,:)';
    MVP(k+1)=MVP(k)*MVWeights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb;

%% Equally weighted portfolio...
    EWP(k+1)=EWP(k)*w0*(1+returns(n+k,2:end))'*(1-CF)+Cntrb1;
    EWReturns(k)=w0*AssetExpReturns(k,:)';
    EWVariance(k)=w0*AssetVarCov{k}*w0';
    
%% Want to minimize this... DR
    DRWeights(k,:)=DRatioOptimize(AssetVarCov{k});
    DRP(k+1)=DRP(k)*DRWeights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb;
    DRReturns(k)=DRWeights(k,:)*AssetExpReturns(k,:)';
    DRVariance(k)=DRWeights(k,:)*AssetVarCov{k}*DRWeights(k,:)';

end

% plot(RPP)
% hold on
plot(MVP)
hold on
plot(EWP)
plot(DRP)
plot(Aggregate, 'p--')

xlabel('Month After Jun 2006');
ylabel('Account Value');
legend('60/40 Balanced Portfolio','Equally-Weighted Portfolio','Diversfication Ratio Portfolio','Mental Accounting Aggregate Portfolio');

hold off

plot(MVReturns./sqrt(MVVariance),'r');
hold on
plot(DRReturns./sqrt(DRVariance),'b');
plot(EWReturns./sqrt(EWVariance),'g');

xlabel('Month After Jun 2006');
ylabel('Portfolio Return per unit of Standard Deviation');
legend('60/40 Balanced Portfolio','Diversfication Ratio Portfolio','Equally-Weighted Portfolio');
title('Sharpe Ratio of Comparative Portfolios');

hold off