clc, clear, close all;

t = 0:1/16000:5;
s1 = cos(2*pi*400*t);
soundsc(s1,16000)
audiowrite('sound1.wav',s1,16000)
audiowrite('sound2.wav',s1,48000)