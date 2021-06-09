clc, clear, close all;

t = 0:1/16000:1;
for k = 100:100:1000,
    s1 = cos(2*pi*k*t);
    soundsc(s1, 16000)
    pause(3)
end

cc1 = ((0:10)' < 3);
cc2 = ((0:10)' > 3);
cc3 = ((0:10)' <= 3);

t = 0:1/16000:5;
s1 = cos(2*pi*400*t);
s2 = s1.*(t > 2).*(t < 4);
plot(t,s2)
xlabel("time")
ylabel("s2")
soundsc(s2,16000)
    