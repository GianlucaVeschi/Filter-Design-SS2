%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filename: ss2_lab4_test_single_echo.m
%Author: Johannah Rosenblum
%Date: 25.06.2018
%Description: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------------------
%           Part I Single Echo Test: Detla Pulse 
%-------------------------------------------------------
%delta-pulse
N = 100;
x = zeros(1,N);
x(1) = 1;

%parameters
%a = 1/2; %attenuation coefficient
a = 1; %effects phase and magntiude
R = 3; %time shift
%frequency
Ts = 0.001;
fs = 1/Ts;
T = Ts*N; %time period
f = 1/T;
freq = 0:f:fs-f;

%test echo function
y = ss2_lab4_single_echo(x,a,R);

%Frequency Response
H = fftshift(fft(y));
H = [H H];
H = H(N/2 : 1.5*N-1);

%Plotting 
%
figure
subplot (2,2,1);
stem(x);
title('Input signal x[n]');
%
subplot(2,2,2);
stem(y);
title('Output signal y[n]');
%
subplot(2,2,3);
plot(freq,abs(H));
title('Magnitude response');
%
subplot(2,2,4);
plot(freq,angle(H));
title('Phase response');

%-------------------------------------------------------
%            Part II Single Echo Test: Sound wav
%-------------------------------------------------------

file = '~/MyFiles/Student/HAW/SignalsSystems2/Lab/touchtone1.wav';
[y_audio,Fs_audio] = audioread(file);

%filter and play sound
R = 3000; % Td ~= 100ms
a = 1/2;
%varying a and R
%a = 1/4;%determines attentuation of the echo.
%a = 2;
%R = 3800; %determines the delay of the echo.
%R = 2000;
%R = 6000;
y = ss2_lab4_single_echo(y_audio, a, R);
%soundsc(y_audio,Fs_audio); % play the sound

%frequency
Ts = 1/Fs_audio;
N = length(y_audio);
t = 0:Ts:(N*Ts-Ts);
freq = (0:N-1)*Fs_audio/N;

%Plotting 
%
figure
subplot (2,1,1);
plot (t,y_audio);
axis([0 Ts*N  -1 1])
title('Input Audio Signal');
%
subplot(2,1,2);
plot (freq,y);
axis([0 Fs_audio -1 1])
title('Audio with Echo');


