clc; clear; close all;

load lab3data.mat;

mc = mean(C)
mr = mean(R)
vc = var(C)
vr = var(R)

histogram(C)
xlabel("Capacitance (µF)")
ylabel("Frequency (#)")

figure
histogram(R)
xlabel("Resistance (Ohms)")
ylabel("Frequency (#)")

k = 1;
for i=1:87
    for j=1:87
         wc(k) = 1 / (R(i) * C(j) * 10^-6);
         k = k + 1;
    end
end
wcHz = wc / 2 / pi;

figure
histogram(wc)
xlabel("Corner Frequency (rad/sec)")
ylabel("# Combinations")

figure
histogram(wcHz)
xlabel("Corner Frequency (Hz)")
ylabel("# Combinations")