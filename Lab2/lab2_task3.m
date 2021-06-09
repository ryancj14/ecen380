clc; clear; close all;

C = 10E-6;
RL = 8.2;
Rs = 20;
Rg = 82;
t = linspace(-0.001,0.005);

h = (1/1300).*1/(C.*(Rs+Rg)).*exp(-1/(RL.*C).*t).*(t >= 0);

t0 = 0.001;
vs = (t >= 0).*(t <= 0.001);

h2 = (1/1300).*1/(C.*(Rs+Rg)).*exp(-1/(RL.*C).*(t-.001)).*(t >= 0);
vL = (1-h).*vs + h2.*(t>0.001);
plot(t,vL);
xlabel("time (ms)")
ylabel("vL (V)")
xlim([-0.001,0.003])

vL = conv(h,vs);
length(t)
length(vL)

t = linspace(-0.002,0.01,199);
figure;
plot(t,vL);
xlabel("time (ms)")
ylabel("vL (V)")
xlim([-0.001,0.003])