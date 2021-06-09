clc, clear, close all;

N = 81; % total number of samples in the filter
L = (N-1)/2; % the filter will go from -L to L
n = (-L:L); % this is our sample index

f_corner = 4600; % corner frequency of our low-pass filter in Hz
f_s = 100000; % our sampling frequency in Hz

h_rect_FIR = 2*f_corner/f_s*sinc(n*2*f_corner/f_s); % truncated sinc
% IMPORTANT: in the code above we convert f_corner from
% Hz to cycles/sample by dividing by f_s

F0 = 0;

hideal = transpose(h_rect_FIR);
h0 = rectwin(N).*hideal; % window with rectangular window
h1 = blackmanharris(N).*hideal; % window with Blackman-Harris window
h2 = hann(N).*hideal; % window with Hann window
h3 = hamming(N).*hideal; % window with Hamming window
Nd = 2048; % number of points around unit circle
FF = -0.5:1/Nd:0.5-1/Nd; % frequency axis for DFT plots
H0 = freqz(h0,1,Nd,'whole'); % DFT of h0
H1 = freqz(h1,1,Nd,'whole'); % DFT of h1
H2 = freqz(h2,1,Nd,'whole'); % DFT of h2
H3 = freqz(h3,1,Nd,'whole'); % DFT of h3
% plot H0 and H1 in dB
% and zoom in on the passband

stem(n, h0);
title("Rectangle Window Stem Plot");
xlabel("time (s)");
ylabel("Amplitude");

figure;
stem(n, h1);
title("Blackman-Harris Window Stem Plot");
xlabel("time (s)");
ylabel("Amplitude");

figure;
stem(n, h2);
title("Hann Window Stem Plot");
xlabel("time (s)");
ylabel("Amplitude");

figure;
stem(n, h2);
title("Hamming Window Stem Plot");
xlabel("time (s)");
ylabel("Amplitude");

figure;
plot(FF,20*log10(abs(fftshift(H0))),'b-');
grid on;
xlabel('frequency (cycles/sample)');
ylabel('magnitude (dB)');
axis([0 0.10 -120 5]);
set(gca,'XTick',[0 0.025 0.05 0.075 0.1]);
legend('rectangular window');

figure;
plot(FF,20*log10(abs(fftshift(H0))),'b-',FF,20*log10(abs(fftshift(H1))),'g-',FF,20*log10(abs(fftshift(H2))),'r-',FF,20*log10(abs(fftshift(H3))),'k-');
grid on;
xlabel('frequency (cycles/sample)');
ylabel('magnitude (dB)');
axis([0 0.10 -120 5]);
set(gca,'XTick',[0 0.025 0.05 0.075 0.1]);
legend('rectangular window','Blackman-Harris window','Hann window','Hamming window');

t = 0:1/f_s:0.5-1/f_s;
sin1 = sin(2*pi*4000*t);
sin2 = sin(2*pi*4600*t);
sin3 = sin(2*pi*6000*t);
sin4 = sin(2*pi*25000*t);
sin5 = sin(2*pi*40000*t);

s1 = sin1 + sin2 + sin3 + sin4 + sin5;
figure;
res = abs(fft(s1));
res = res(1:length(res)/2);
plot(res);
title("s1 Frequency Domain Plot");

f0 = filter(h0,1,s1);
f1 = filter(h1,1,s1);
f2 = filter(h2,1,s1);
f3 = filter(h3,1,s1);

figure;
res0 = abs(fft(f0));
res0 = res0(1:length(res0)/2);
plot(res0);
title("Rectangle Window Frequency Domain Plot");

figure;
res1 = abs(fft(f1));
res1 = res1(1:length(res1)/2);
plot(res1);
title("Blackman-Harris Window Frequency Domain Plot");

figure;
res2 = abs(fft(f2));
res2 = res2(1:length(res2)/2);
plot(res2);
title("Hann Window Freuency Domain Plot");

figure;
res3 = abs(fft(f3));
res3 = res3(1:length(res3)/2);
plot(res3);
title("Hamming Window Frequency Domain Plot");
