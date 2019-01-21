function [y]=DRatio(weights, CovMatrix)

PVar=weights*CovMatrix*weights';

[y]=weights*sqrt(diag(CovMatrix))/sqrt(PVar);
