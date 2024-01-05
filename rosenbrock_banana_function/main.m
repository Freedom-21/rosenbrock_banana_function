clc;
clear all;
P1=[2, -0.5];
P2=[1, -2.5];
P3=[-1, -2.5];
P4=[-1, -0.5];

% history can be captured by uncommenting the second options

%  options1=optimset('PlotFcns',@history, 'TolFun', 1e-20); 
 options1=optimset('OutputFcn',@output, 'TolFun', 1e-20);
[x11,fval11,eflag11,output11]=fminsearch(@rosenbrock,P1,options1);
[x12,fval12,eflag12,output12]=fminsearch(@rosenbrock,P2,options1);
[x13,fval13,eflag13,output13]=fminsearch(@rosenbrock,P3,options1);
[x14,fval14,eflag14,output14]=fminsearch(@rosenbrock,P4,options1);

%  options2=optimoptions('fminunc','PlotFcns',@history,'Algorithm','quasi-newton', 'TolFun', 1e-20); 
options2=optimoptions('fminunc','OutputFcn',@output,'Algorithm','quasi-newton', 'TolFun', 1e-20);
[x21,fval21,eflag21,output21]=fminunc(@rosenbrock,P1,options2);
[x22,fval22,eflag22,output22]=fminunc(@rosenbrock,P2,options2);
[x23,fval23,eflag23,output23]=fminunc(@rosenbrock,P3,options2);
[x24,fval24,eflag24,output24]=fminunc(@rosenbrock,P4,options2);
% %
  options2=optimoptions(options2,'HessUpdate','steepdesc','MaxFunctionEvaluations',1000, 'TolFun', 1e-20);
[x31,fval31,eflag31,output31]=fminunc(@rosenbrock,P1,options2);
[x32,fval32,eflag32,output32]=fminunc(@rosenbrock,P2,options2);
[x33,fval33,eflag33,output33]=fminunc(@rosenbrock,P3,options2);
[x34,fval34,eflag34,output34]=fminunc(@rosenbrock,P4,options2);
% % 
gf=@(x)deal(rosenbrock(x),grad(x));
options2=resetoptions(options2,{'HessUpdate','MaxFunctionEvaluations'});
options2=optimoptions(options2,'SpecifyObjectiveGradient',true,'Algorithm','trust-region', 'TolFun', 1e-20);
[x41,fval41,eflag41,output41]=fminunc(gf,P1,options2);
[x42,fval42,eflag42,output42]=fminunc(gf,P2,options2);
[x43,fval43,eflag43,output43]=fminunc(gf,P3,options2);
[x44,fval44,eflag44,output44]=fminunc(gf,P4,options2);

X_values = {x11, x12, x13, x14, x21, x22, x23, x24, x31, x32, x33, x34, x41, x42, x43, x44};
X_names = {'x11', 'x12', 'x13', 'x14', 'x21', 'x22', 'x23', 'x24', 'x31', 'x32', 'x33', 'x34', 'x41', 'x42', 'x43', 'x44'};
for i = 1:length(X_values)
    accurancy(X_values{i}, X_names{i});
end

