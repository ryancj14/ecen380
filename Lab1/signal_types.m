 % Plot examples of signal types
%
echo on

figure(1)
t = 0:0.001:2;
theta = pi/4;
C = 2*exp(1j*theta);
r = -1.5;
omega = 5*2*pi;

x = abs(C)*exp(r*t).*exp(1j*(omega*t+theta));
plot(t,real(x),t,imag(x)) 
title('Continuous-time x(t)','FontSize',14)
xlabel('t','FontSize',14)
ylabel('x(t)','FontSize',14)
legend('Real part','Imaginary part');
pause

figure(2) 
n = 0:200;
fs = 100;                   % sample frequency in samples per second
x = abs(C)*exp(r*n/fs).*exp(1j*(omega*n/fs+theta));
subplot(2,1,1);
stem(n,real(x),'b')
title(['discrete-time x[n] real part, fs = ',num2str(fs),' samp/sec'],'FontSize',14)
xlabel('n','FontSize',14)
ylabel('x[n]','FontSize',14)
subplot(2,1,2);
stem(n,imag(x),'r')
title(['discrete-time x[n] imaginary part, fs = ',num2str(fs),' samp/sec'],'FontSize',14)
xlabel('n','FontSize',14)
ylabel('x[n]','FontSize',14)
pause

figure(3)
n_bits = 4;                 % Number of ADC bits
n_bins = 2^(n_bits-1);
x_quant = round(n_bins*exp(-n/fs).*sin(10*2*pi*n/fs))/n_bins;
stem(n,x_quant,'k')
title(['discrete-time & digital x[n], fs = ',num2str(fs),' samp/sec'],'FontSize',14)
xlabel('n','FontSize',14)
ylabel('x[n]','FontSize',14)
pause


% An RGB image 
figure(4)
U = imread('ngc6543a.jpg');
imagesc(U);
title('3-D signal (RGB) as a function of 2-D independent variables (x,y)') 
size(U)
pause

figure(5)
colormap('gray')
imagesc(U(:,:,2))
title('1-D signal (G) as a function of 2-D independent variables (x,y)') 
pause

mesh(U(:,:,2));
