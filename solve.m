tic();
load(inputMatrix);
loadTime=toc();

[filepath,name,ext] = fileparts(inputMatrix)

A = Problem.A;
n=size(A,1);
xe=ones(n,1);

tic();
b=A*xe;
x = A\b;
solveTime=toc();
err = norm(x-xe)/norm(xe);

sep = ','
results = [name sep num2str(err) sep num2str(loadTime) sep num2str(solveTime)]
disp(results)

exit()