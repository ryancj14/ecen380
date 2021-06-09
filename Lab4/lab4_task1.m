clc, clear, close all;

wcHz = 3*10^3;
wc = 2*pi*wcHz;

p = 4;
[B, A] = butter(p, wc, 's');
poles = roots(A);
angle(poles);
abs(poles);
A
B

p = 2;
[B, A] = butter(p, wc, 's');
poles = roots(A);
angle(poles);
abs(poles);

p = 6;
[B, A] = butter(p, wc, 's');
poles = roots(A);
angle(poles);
abs(poles);

A1 = [1, 0.7654*wc, wc^2];
A2 = [1, 1.8478*wc, wc^2];
A = conv(A1, A2)

B1 = [0, 0, wc^2];
B2 = [0, 0, wc^2];
B = conv(B1, B2)

zplane(B, A);

figure;
f = logspace(0, 5, 500);
[H, w] = freqs(B, A, 2*pi*f);
semilogx(f, 20*log10(abs(H)))
xlabel('Frequency in Hz');
ylabel('Magnitude response in dB');

