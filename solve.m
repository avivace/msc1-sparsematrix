profile -memory on

inputMatrix='matrices\non_positive_definite\torso3.mat';
tic();
load(inputMatrix);
loadTime=toc();

[filepath,name,ext] = fileparts(inputMatrix);

A = Problem.A;
n=size(A,1);
xe=ones(n,1);

tic();
b=A*xe;
x = A\b;
[user,sys] = memory();
mem = user.MemUsedMATLAB;

solveTime=toc();
err = norm(x-xe)/norm(xe);

sep = ',';


profile off
a = profile('info');
results = [name sep num2str(err) sep num2str(solveTime) sep num2str(a.FunctionTable(3).PeakMem)];
disp(results)