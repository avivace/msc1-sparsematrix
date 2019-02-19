from scipy.sparse.linalg import spsolve, use_solver
from numpy.linalg import norm
from scipy.io import loadmat
from scipy import ones
import time
import sys
import psutil
import os
from memory_profiler import memory_usage
process = psutil.Process(os.getpid())

x = 0
A = []
b = []
basemem= process.memory_info().rss

mat_file = sys.argv[1]
mat = loadmat(mat_file)
A = mat['Problem']['A'][0][0]
N = A.shape[0]
b = A * ones(N)
tick = time.time()
x = spsolve(A, b, use_umfpack=True)
tock = time.time()
error = norm(x - ones(N))/norm(ones(N))


#peakmem= process.memory_info().peak_wset WINDOWS ONLY
print(sys.argv[1].split("/")[-1][:-4], ",", error, ",", tock - tick, ",",basemem)
