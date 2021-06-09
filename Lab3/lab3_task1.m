clc; clear; close all;

x = 5;
n = 10;
prob = 0.5;
y = binocdf(n,n,prob) - binocdf(x-1,n,prob)
y = binocdf(x-1,n,prob,'upper')
