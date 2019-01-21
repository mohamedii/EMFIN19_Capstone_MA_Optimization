clc
clear all

%% Import the returns data file
fileName='Index Data 3.xlsx';
[returns]=xlsread(fileName);

CF=10/10000;

imagesc(corr(returns(:,2:end)));
colormap(jet);
colorbar;

labelNames = {'MSCI US','FTSE 100','Barclays Bond','JPM GEMBI','US TIPS','REITS','CASH Equiv'};
set(gca,'XTickLabel',labelNames);
set(gca,'YTickLabel',labelNames);
title('Correlation Map', 'FontSize', 15);

%% Define vectors and initialize
R=size(returns,1)-1;
nAC=size(returns,2)-1;
n=12;
T=R-n+1;

w0=ones(1,nAC)./nAC;
AssetExpReturns=zeros(T,nAC);

%% Generate ex-post expectd returns and variance-covariances through dataset
for j=1:T
    AssetExpReturns(j,:)=mean(returns(n+j-1:-1:j,2:end)); %ex-post return data to estimate expected returns for each asset
    AssetVarCov{j}=cov(returns(n+j-1:-1:j,2:end)); %Variance-Covariance Matrix
    AssetCorrMat{j}=corr(returns(n+j-1:-1:j,2:end)); %Correlation Matrix
end

%% Run Mental Account Optimization for Constraint Portfolios
run MAConstraintOptimization
% run EFFQuadProg
% run EFMentalAccounts
% run Utility_MA
run ComparativePortfolios
