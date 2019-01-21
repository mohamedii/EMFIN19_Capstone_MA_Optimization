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
alpha=linspace(0.005,0.29,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    W(k,:)=B;
    
end

Z(1,:)=xReturns(:)';

%%
H=-0.20/12;
alpha=linspace(0.005,0.29,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(2,:)=xReturns(:)';

%%
H=-0.15/12;
alpha=linspace(0.005,0.29,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(3,:)=xReturns(:)';

%%
H=-0.10/12;
alpha=linspace(0.005,0.29,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(4,:)=xReturns(:)';

%%
H=-0.05/12;
alpha=linspace(0.1,0.29,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(5,:)=xReturns(:)';

%%
H=0.00/12;
alpha=linspace(0.38,0.72,Q)';

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(6,:)=xReturns(:)';

%%
H=0.05/12;
alpha=linspace(0.31,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(7,:)=xReturns(:)';

%%
H=0.10/12;
alpha=linspace(0.31,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(8,:)=xReturns(:)';

%%
H=0.15/12;
alpha=linspace(0.31,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(9,:)=xReturns(:)';

%%
H=0.20/12;
alpha=linspace(0.32,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(10,:)=xReturns(:)';

%%
H=0.25/12;
alpha=linspace(0.32,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(11,:)=xReturns(:)';

%%
H=0.30/12;
alpha=linspace(0.32,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(12,:)=xReturns(:)';

%%
H=0.40/12;
alpha=linspace(0.34,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(13,:)=xReturns(:);

%%
H=0.50/12;
alpha=linspace(0.34,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(14,:)=xReturns(:);

%%
H=0.60/12;
alpha=linspace(0.34,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(15,:)=xReturns(:)';

%%
H=1.00/12;
alpha=linspace(0.36,0.99,Q);

for k=1:Q
    
    Obj=@(g) MAOptimize(g,alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    impliedG(k)=fzero(@(g) Obj(g)-H,gamma);

    [t,B]=MAOptimize(impliedG(k),alpha(k),AssetExpReturns(i,:),AssetVarCov{i});
    xReturns(k)=B*AssetExpReturns(i,:)';
    
end

Z(16,:)=xReturns(:)';