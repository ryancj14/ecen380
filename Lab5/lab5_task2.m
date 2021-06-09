clc, clear, close all;

recObj = audiorecorder(48000, 24, 1);
recordblocking(recObj, 5);

myRecording = getaudiodata(recObj);
player = audioplayer(myRecording, 48000);
playblocking(player);

my8kRecording = myRecording(1:6:length(myRecording));
player = audioplayer(my8kRecording, 8000);
playblocking(player);

fs = 8000; % sampling frequency
ww = -pi:0.0001:pi; % identify which frequencies you’d like to test
XX = freqz(my8kRecording,1,ww); % calculate the frequency response
ff = ww*fs/(2*pi); % convert the frequency vector to Hz
figure
plot(ff,(20*log10(abs(XX)))); % plot the magnitude response in dB

recObj = audiorecorder(8000, 24, 1);
recordblocking(recObj, 5);

myRecording = getaudiodata(recObj);
player = audioplayer(myRecording, 8000);
playblocking(player);

fs = 8000; 
ww = -pi:0.0001:pi; 
XX = freqz(myRecording,1,ww); 
ff = ww*fs/(2*pi); 
figure
plot(ff,(20*log10(abs(XX))));
