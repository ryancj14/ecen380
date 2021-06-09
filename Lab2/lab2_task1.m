clc; clear; close all;

C = 10E-6;
RL = 8.2;
Rs = 20;
Rg = 82;
t = linspace(-0.001,0.005);

h = (1/2250).*1/(C*(Rs+Rg)).*exp(-1/(RL.*C).*t).*(t >= 0);

plot(t,h);
xlabel("time (ms)")
ylabel("h(t) (V)")
