profile off
profile -memory on


%[filepath,name,ext] = fileparts(inputMatrix);

A = Problem.A;
n=size(A,1);
xe=ones(n,1);

tic();
b=A*xe;
x = A\b;

solveTime=toc();
err = norm(x-xe)/norm(xe);

sep = ',';


profile off
a = profile("info");
profile("viewer")
