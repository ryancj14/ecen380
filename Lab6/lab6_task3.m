clc, clear, close all;

f_players = [1471, 1724, 2000, 2273, 2632, 2941, 3333, 3571, 3846, 4167];
% Player center frequencies in Hz
f_s = 10000; % sampling frequency (remember we have decimated)
BW = 50; % Full bandwidth of filters in Hz
for f = f_players
    f_lower = f - BW/2; % Lower corner frequency of BPF
    f_upper = f + BW/2; % Upper corner frequency of BPF
    [b, a] = butter(5, [f_lower*2/f_s, f_upper*2/f_s]);
    % IMPORTANT: ‘butter’ takes frequency specifications in half cycles/sample,
    % not Hz, hence the division by f s and multiplication by 2
    
    f_axis = linspace(1000, 4500, 2000); % create a freq axis from 1 to 4.5 kHz
    H = freqz(b, a, f_axis, f_s); % calculates the freq response H1
    % at the frequencies in f axis
    plot(f_axis, abs(H)); % magnitude of the frequency response
    hold on;
end
xlabel("Frequency (Hz)")
ylabel("Magnitude")

load('lab6_data_sets.mat')

E = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
x = [(x_easy1),(x_easy2),(x_easy3),(x_easy4),(x_easy5),(x_hard1),(x_hard2),(x_hard3),(x_hard4),(x_hard5)];

for j = 1:10
    for i = 1:10
        f_lower = f_players(i) - BW/2; % Lower corner frequency of BPF
        f_upper = f_players(i) + BW/2; % Upper corner frequency of BPF
        [b, a] = butter(5, [f_lower*2/f_s, f_upper*2/f_s]);
        % IMPORTANT: ‘butter’ takes frequency specifications in half cycles/sample,
        % not Hz, hence the division by f s and multiplication by 2
    
        f_axis = linspace(1000, 4500, 2000); % create a freq axis from 1 to 4.5 kHz
        h = freqz(b, a, f_axis, f_s); % calculates the freq response H1
        % at the frequencies in f axis
        K = filter(b, a, x(:,j));
        Ex = sum(abs(K).^2);
        E(i) = Ex;
    end
    figure;
    bar(E)
    xlabel('Player');
    ylabel('Magnitude');
end
