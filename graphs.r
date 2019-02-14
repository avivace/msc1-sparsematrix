setwd("~/uni/msc/mcs1-sparsematrix/results")
library(ggplot2)

py_win = read.csv("py_windows.csv", header = TRUE )
py_linux = read.csv("py_linux.csv", header = TRUE)
py_win = read.csv("matlab_windows.csv", header = TRUE)
py_win = read.csv("py_windows.csv", header = TRUE)
matlab_win = read.csv("matlab_windows.csv", header = TRUE)
matlab_linux = read.csv("matlab_linux.csv", header = TRUE)

d_subset = py_win[,c(1,6)]
d_subset$patternEntries = d_subset$patternEntries/1000

# Profiler gives 10 (pages) of the actual allocated peak memory
# Add a minimum of 600 base ram consumption of the matlab environment (no jvm, cli)
matlab_win$mem = matlab_win$mem * 10 + 600000000
matlab_linux$mem = matlab_linux$mem * 9 + 600000000

redAcc1= "#FF5722"
redAcc2= "#D32F2F"
blueAcc1="#303F9F"
blueAcc2="#448AFF"

solveTime = ggplot() + 
	geom_line(data= matlab_linux, aes(x=patternEntries, y=solveTime), size=20, color =blueAcc1)+ 
	geom_line(data= matlab_win, aes(x=patternEntries, y=solveTime),size=2, color = blueAcc2)+ 
  geom_line(data= py_linux, aes(x=patternEntries, y=solveTime),size=2, color = redAcc1)+ 
  geom_line(data= py_win, aes(x=patternEntries, y=solveTime),size=2, color = redAcc2)+ 
	scale_x_continuous(trans='log2') +
  geom_point(data= matlab_win, aes(x=patternEntries, y=solveTime)) +
  geom_point(data= matlab_linux, aes(x=patternEntries, y=solveTime)) +
  geom_point(data= py_win, aes(x=patternEntries, y=solveTime)) +
  geom_point(data= py_linux, aes(x=patternEntries, y=solveTime))


mem= ggplot() + 
  geom_line(data= matlab_linux, aes(x=patternEntries, y=mem), size=2, color = blueAcc1)+ 
  geom_line(data= matlab_win, aes(x=patternEntries, y=mem),size=2, color = blueAcc2)+ 
  geom_line(data= py_linux, aes(x=patternEntries, y=mem),size=2, color = redAcc1)+ 
  geom_line(data= py_win, aes(x=patternEntries, y=mem),size=2, color = redAcc2)+ 
  scale_x_continuous(trans='log2') +
  geom_point(data= matlab_win, aes(x=patternEntries, y=mem)) +
  geom_point(data= matlab_linux, aes(x=patternEntries, y=mem)) +
  geom_point(data= py_win, aes(x=patternEntries, y=mem)) +
  geom_point(data= py_linux, aes(x=patternEntries, y=mem))



err= ggplot() + 
  geom_line(data= matlab_linux, aes(x=patternEntries, y=error), size=2, color = blueAcc1)+ 
  geom_line(data= matlab_win, aes(x=patternEntries,y=error),size=2, color = blueAcc2)+ 
  geom_line(data= py_linux, aes(x=patternEntries, y=error),size=2, color = redAcc1)+ 
  geom_line(data= py_win, aes(x=patternEntries, y=error),size=2, color = redAcc2)+ 
  scale_x_continuous(trans='log2') +
  scale_y_continuous(trans='log2') +
  geom_point(data= matlab_win, aes(x=patternEntries, y=error)) +
  geom_point(data= matlab_linux, aes(x=patternEntries, y=error)) +
  geom_point(data= py_win, aes(x=patternEntries, y=error)) +
  geom_point(data= py_linux, aes(x=patternEntries, y=error))


solveTime