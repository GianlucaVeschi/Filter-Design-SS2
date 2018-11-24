%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filename: ss2_lab4_multi_echo.m
%Author: Johannah Rosenblum, Gianluca Veschi
%Date: 27.06.2018
%Description:
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameters
N = 6; %Filter order
R = 3;
a = 1/2;
%a = 2; 
L = 100; %length
%frequency
Ts = 0.001;
fs = 1/Ts;
T = Ts*L; %time period
f = 1/T;
freq = 0:f:fs-f;

%dirac pulse
dirac = zeros(1,L);
dirac(1) = 1;

%Impulse response of filter
y_recursive = recursive_filter(dirac, N, a, R);
y_nonrecursive = non_recursive_filter(dirac, N, a, R);

%plot the zero map of impulse response
subplot(2,1,1);
zplane(y_recursive);
title('Pole/zero map of recursive filter');
%
subplot(2,1,2);
zplane(y_nonrecursive);
title('Pole/zero map of non-recursive filter');

%Transfer function of filter
H_recursive = fftshift(fft(y_recursive));
H_nonrecursive = fftshift(fft(y_nonrecursive));

figure
subplot(2,2,1);
plot(freq, abs(power(H_recursive,2)));
title('Magnitude of recursive filter');
subplot(2,2,2);
plot(freq, (angle(H_recursive)))
title('Phase of recursive filter');
 
subplot(2,2,3);
plot(freq, abs(power(H_nonrecursive,2)));
title('Magnitude of non-recursive filter');
subplot(2,2,4);
plot(freq, (angle(H_nonrecursive)));
title('Phase of non-recursive filter');

%---------------------------------------------------------------
%                   Sound File
%---------------------------------------------------------------
%Parameters
R = 3000;
%R = 2000
%a = 1.9;
%a = 30

file = '~/MyFiles/Student/HAW/SignalsSystems2/Lab/touchtone1.wav';
[y_audio,Fs_audio] = audioread(file);

%frequency
Ts = 1/Fs_audio;
L = length(y_audio);
t = 0:Ts:(L*Ts-Ts);
freq = (0:L-1)*Fs_audio/L;

%filter
y_recursive = recursive_filter(y_audio, N, a, R);
y_nonrecursive = non_recursive_filter(y_audio, N, a, R);

%Plotting
figure();
subplot (2,2,1);
plot (y_audio);
title('Original Signal');
%
subplot(2,2,2)
plot(y_recursive);
%axis([0 Ts*N  -1 1])
title('non-Recursive Filter');
%
subplot (2,2,3);
plot (y_audio);
%
subplot(2,2,4)
plot(y_nonrecursive);
title('Recursive Filter');



