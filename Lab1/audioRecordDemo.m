% audio recording example
echo on
recorder = audiorecorder(48000,16,1)
pause

disp('Start speaking.')
recordblocking(recorder,3);
disp('End of Recording.');
pause

% Play back Recording
play(recorder);
pause

%Store data in a double-precision array
myRecording = getaudiodata(recorder);
plot(myRecording);

 