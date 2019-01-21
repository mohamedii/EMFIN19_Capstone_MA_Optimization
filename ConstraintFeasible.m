%%
R=100;
n=12;
T=R-n+1;
Q=20;

i=1;

gamma=10;
Z=zeros(16,Q);

%%
H=-0.25/12;
alpha=linspace(0.005,0.2,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(1,:)=xReturns(:)';

%%
H=-0.20/12;
alpha=linspace(0.005,0.25,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(2,:)=xReturns(:)';

%%
H=-0.15/12;
alpha=linspace(0.005,0.25,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(3,:)=xReturns(:)';

%%
H=-0.10/12;
alpha=linspace(0.01,0.29,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(4,:)=xReturns(:)';

subplot(3,1,1)
    plot(impliedG(1:10),xReturns(1:10),'r--')
    title('H=-10%; Optimized Expectecd Returns vs.Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Monthly Expected Return');
    
subplot(3,1,2)
    plot(impliedG(1:10),alpha(1:10),'b--')
    title('H=-10%; Probability of reaching Threshold H vs. Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Probability');
    
subplot(3,1,3)
    plot(alpha,xReturns,'g--')
    title('H=-10%; Efficient Frontier for Mental Account');
    xlabel('Probability');
    ylabel('Monthly Expected Return');

%%
H=-0.05/12;
alpha=linspace(0.15,0.35,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(5,:)=xReturns(:)';

%%
H=0.00/12;
alpha=linspace(0.4,0.6,Q); %0.34
clear B

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(6,:)=xReturns(:)';

subplot(3,1,1)
    plot(impliedG(1:10),xReturns(1:10),'r--')
    title('H=0%; Optimized Expectecd Returns vs.Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Monthly Expected Return');
    
subplot(3,1,2)
    plot(impliedG(1:10),alpha(1:10),'b--')
    title('H=0%; Probability of reaching Threshold H vs. Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Probability');
    
subplot(3,1,3)
    plot(alpha,xReturns,'g--')
    title('H=0%; Efficient Frontier for Mental Account');
    xlabel('Probability');
    ylabel('Monthly Expected Return');

%%
H=0.05/12;
alpha=linspace(0.41,0.9,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(7,:)=xReturns(:)';

subplot(3,1,1)
    plot(impliedG(1:10),xReturns(1:10),'r--')
    title('H=5%; Optimized Expectecd Returns vs.Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Monthly Expected Return');
    
subplot(3,1,2)
    plot(impliedG(1:10),alpha(1:10),'b--')
    title('H=5%; Probability of reaching Threshold H vs. Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Probability');
    
subplot(3,1,3)
    plot(alpha,xReturns,'g--')
    title('H=5%; Efficient Frontier for Mental Account');
    xlabel('Probability');
    ylabel('Monthly Expected Return');
    

%%
H=0.10/12;
alpha=linspace(0.46,0.9,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(8,:)=xReturns(:)';

subplot(3,1,1)
    plot(impliedG(1:10),xReturns(1:10),'r--')
    title('H=10%; Optimized Expectecd Returns vs.Implied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Expected Returns');
    
subplot(3,1,2)
    plot(impliedG(1:10),alpha(1:10),'b--')
    title('H=10%; Probability of reaching Threshold HImplied Risk Aversion (Gamma)');
    xlabel('Implied Risk Aversion (Gamma)');
    ylabel('Probability');
    
subplot(3,1,3)
    plot(alpha,xReturns,'g--')
    title('H=10%; Efficient Frontier for Mental Account #1');
    xlabel('Probability');
    ylabel('Expected Returns');

%%
H=0.15/12;
alpha=linspace(0.51,0.99,Q);
clear B

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(9,:)=xReturns(:)';

%%
H=0.20/12;
alpha=linspace(0.55,0.99,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(10,:)=xReturns(:)';

%%
H=0.25/12;
alpha=linspace(0.6,0.99,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(11,:)=xReturns(:)';

%%
H=0.30/12;
alpha=linspace(0.65,0.99,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(12,:)=xReturns(:)';

%%
H=0.40/12;
alpha=linspace(0.7,0.99,Q)';
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(13,:)=xReturns(:);

%%
H=0.50/12;
alpha=linspace(0.8,0.99,Q)';
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(14,:)=xReturns(:);

%%
H=0.60/12;
alpha=linspace(0.85,0.99,Q)';
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(15,:)=xReturns(:)';

%%
H=1.00/12;
alpha=linspace(0.97,0.99,Q);
clear B;

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B(k,:)]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B(k,:)*AssetExpReturns(i,:)';
    
end

Z(16,:)=xReturns(:)';