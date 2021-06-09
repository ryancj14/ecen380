clc, clear, close all;

wcHz = 3*10^3;
wc = 2*pi*wcHz;
p = 4;

[B,A] = butter(p, wc, 's');
f = logspace(0, 5, 500);
[H, w] = freqs(B, A, 2*pi*f);
semilogx(f, 20*log10(abs(H)))
xlabel('Frequency in Hz');
ylabel('Magnitude response in dB');
figure
semilogx(f, angle(H))
xlabel('Frequency in Hz');
ylabel('Phase response in radians');

B = [0 0 wc^2];
A = [1 .7654*wc wc^2];

f = logspace(0, 5, 500);
[H, w] = freqs(B, A, 2*pi*f);
figure
semilogx(f, 20*log10(abs(H)))
xlabel('Frequency in Hz');
ylabel('Magnitude response in dB');
figure
semilogx(f, angle(H))
xlabel('Frequency in Hz');
ylabel('Phase response in radians');