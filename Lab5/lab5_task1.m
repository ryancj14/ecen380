clc, clear, close all;

recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

play(recObj); % This directly plays back the recording using the recording sampling rate

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

whos myRecording

plot(myRecording);

player = audioplayer(myRecording, 96000); % 2nd param plays back at 96,000 samples/s
playblocking(player); % Actually plays the sound in object player back
player = audioplayer(myRecording, 70000); % 70,000 samples/s
playblocking(player);
player = audioplayer(myRecording, 120000); % 120,000 samples/s
playblocking(player);

impulse_echo = zeros(192000,1);
impulse_echo(1) = 1; % A delta at the beginning of our impulse response
impulse_echo(48000) = 0.5; % A smaller (softer) one after 0.5 seconds (48,000 samples)
impulse_echo(96000) = 0.25;
player = audioplayer(impulse_echo, 96000);
playblocking(player);

myRecording_echo = conv(myRecording, impulse_echo); % This will be a bit slow...
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

impulse_great_hall = audioread('great_hall.wav');
impulse_octagon = audioread('octagon.wav');
impulse_classroom = audioread('classroom.wav');

player = audioplayer(impulse_great_hall, 96000);
playblocking(player);
player = audioplayer(impulse_octagon, 96000);
playblocking(player);
player = audioplayer(impulse_classroom, 96000);
playblocking(player);

figure;
subplot(3,1,1);
plot(impulse_great_hall);
subplot(3,1,2);
plot(impulse_octagon);
subplot(3,1,3);
plot(impulse_classroom);

%% Task 1 Signoff Section
clc, clear, close all;

disp('Matlab will now record 5 seconds of audio');
recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');
myRecording = getaudiodata(recObj);

impulse_echo = zeros(192000,1);
impulse_echo(1) = 1; % A delta at the beginning of our impulse response
impulse_echo(48000) = 0.5; % A smaller (softer) one after 0.5 seconds (48,000 samples)
impulse_echo(96000) = 0.25;
myRecording_echo = conv(myRecording, impulse_echo);
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

impulse_great_hall = audioread('great_hall.wav');
myRecording_echo = conv(myRecording, impulse_great_hall);
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

impulse_octagon = audioread('octagon.wav');
myRecording_echo = conv(myRecording, impulse_octagon);
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

impulse_classroom = audioread('classroom.wav');
myRecording_echo = conv(myRecording, impulse_classroom);
player = audioplayer(myRecording_echo, 96000);
playblocking(player);

%% Task 1 Saving .wav file
clc, clear, close all;

recObj = audiorecorder(48000, 24, 1);
recordblocking(recObj, 2);

myRecording = getaudiodata(recObj);
player = audioplayer(myRecording, 48000);
playblocking(player);

audiowrite('elevator.wav', myRecording, 48000);


%% Task 1 Extra Credit
clc, clear, close all;

disp('Matlab will now record 5 seconds of audio');
recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');
myRecording = getaudiodata(recObj);

impulse_elevator = audioread('elevator.wav');
myRecording_echo = conv(myRecording, impulse_elevator);
player = audioplayer(myRecording_echo, 96000);
playblocking(player);
