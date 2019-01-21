%% Initial allocation of starting wealth into accounts

impliedG1=zeros(T,1);
impliedG2=zeros(T,1);
impliedG3=zeros(T,1);

x1Returns=zeros(T,1);
x1Variance=zeros(T,1);
MA1Weights=zeros(T,nAC);

x2Returns=zeros(T,1);
x2Variance=zeros(T,1);
MA2Weights=zeros(T,nAC);

x3Returns=zeros(T,1);
x3Variance=zeros(T,1);
MA3Weights=zeros(T,nAC);

MAP1=zeros(T+1,1);
MAP2=zeros(T+1,1);
MAP3=zeros(T+1,1);

cumRMAP1=zeros(T,1);
cumRMAP2=zeros(T,1);
cumRMAP3=zeros(T,1);

MAP1(1)=2200;
MAP2(1)=50;
MAP3(1)=1750;

Cntrb1=20;
Cntrb2=3;
Cntrb3=7;


%% Construct account portfolios characterized by (H,alpha) i.e. threshold return and probability of not reaching threshold return
gamma=10;

% Retirement Account
    H=-0.075/12;
    alpha=0.15;

    for k=1:T

        Obj=@(g) MAOptimize(g,alpha,AssetExpReturns(k,:),AssetVarCov{k});
        impliedG1(k)=fzero(@(g) Obj(g)-H,gamma);

        [~,B{k}]=MAOptimize(impliedG1(k),alpha,AssetExpReturns(k,:),AssetVarCov{k});

        x1Returns(k)=B{k}*AssetExpReturns(k,:)';
        x1Variance(k)=B{k}*AssetVarCov{k}*B{k}';
        MA1Weights(k,:)=B{k};
        MAP1(k+1)=MAP1(k)*MA1Weights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb1;
        cumRMAP1(k)=((MAP1(k+1)-Cntrb1)/MAP1(1))^(12/k)-1;

    end
    
% Education Account
    H=-0.10/12;
    alpha=0.1;
    
    for k=1:T
     
        Obj=@(g) MAOptimize(g,alpha,AssetExpReturns(k,:),AssetVarCov{k});
        impliedG2(k)=fzero(@(g) Obj(g)-H,gamma);

        [~,B{k}]=MAOptimize(impliedG2(k),alpha,AssetExpReturns(k,:),AssetVarCov{k});

        x2Returns(k)=B{k}*AssetExpReturns(k,:)';
        x2Variance(k)=B{k}*AssetVarCov{k}*B{k}';
        MA2Weights(k,:)=B{k};
        MAP2(k+1)=MAP2(k)*MA2Weights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb2;
        cumRMAP2(k)=((MAP2(k+1)-Cntrb2)/MAP2(1))^(12/k)-1;
        
    end
    
% Property Account
    H=-0.1/12;
    alpha=0.08;
    
    for k=1:T
     
        Obj=@(g) MAOptimize(g,alpha,AssetExpReturns(k,:),AssetVarCov{k});
        impliedG3(k)=fzero(@(g) Obj(g)-H,gamma);

        [~,B{k}]=MAOptimize(impliedG3(k),alpha,AssetExpReturns(k,:),AssetVarCov{k});

        x3Returns(k)=B{k}*AssetExpReturns(k,:)';
        x3Variance(k)=B{k}*AssetVarCov{k}*B{k}';
        MA3Weights(k,:)=B{k};
        MAP3(k+1)=MAP3(k)*MA3Weights(k,:)*(1+returns(n+k,2:end))'*(1-CF)+Cntrb3;
        cumRMAP3(k)=((MAP3(k+1)-Cntrb3)/MAP3(1))^(12/k)-1;

    end

Aggregate=MAP1+MAP2+MAP3;
  
plot(MAP1,'r');
hold on
plot(MAP2,'b');
plot(MAP3,'g');
plot(Aggregate,'p--');

xlabel('Month After Jun 2006');
ylabel('Account Value');
legend('Retirement Account', 'Education Account','Property Account','Aggregate Portfolio');

hold off

plot(cumRMAP1,'r');
hold on
plot(cumRMAP2,'b');
plot(cumRMAP3,'g');

xlabel('Month After Jun 2006');
ylabel('Cumulative CAGR Since Inception');
legend('Retirement Account', 'Education Account','Property Account');

hold off

plot(x1Returns,'r');
hold on
plot(x2Returns,'b');
plot(x3Returns,'g');

xlabel('Month After Jun 2006');
ylabel('Sub-Portolio Monthly Returns since Inception');
legend('Retirement Account', 'Education Account','Property Account');

hold off

plot(x1Returns./sqrt(x1Variance),'r');
hold on
plot(x2Returns./sqrt(x2Variance),'b');
plot(x3Returns./sqrt(x3Variance),'g');

xlabel('Month After Jun 2006');
ylabel('Portfolio Return per unit of Standard Deviation');
legend('Retirement Account', 'Education Account','Property Account');
title('Sharpe Ratio of Mental Accounts');

hold off