%% 1st question
close all
clear 
clc
t = linspace(-pi,pi,101);

n = 0:1:100;
w = linspace(-pi,pi,101);

x = cos(n*pi/2);
y = exp(1i * pi * n /4) .* x;

X = x * exp(-1i * w * n');
Y = y * exp(-1i * w * n');

magnitudeOfY = abs(Y);
magnitudeOfX = abs(X);

phaseOfY = angle(Y);
phaseOfX = angle(X);

subplot(2,2,1)
stem(t,magnitudeOfX)
title("Magnitude of X")
ylabel("abs(X)")
xlabel("w")

subplot(2,2,2)
stem(t,magnitudeOfY)
title("Magnitude of Y")
ylabel("abs(Y)")
xlabel("w")

subplot(2,2,3)
stem(t,phaseOfX)
title("Phase of X")
ylabel("angle(x(n))")
xlabel("n")

subplot(2,2,4)
stem(t,phaseOfY)
title("Phase of Y")
ylabel("angle(y(n))")
xlabel("n")


%% 2nd question
% y(n) = 0.8y(n − 1) + x(n)
close all
clear 
clc
n = linspace(0,100*pi,101);

x = cos(0.05*n);
b = 1;
a = [1, -0.8];
y = filter(b,a,x);


subplot(1,2,1)
stem(n,x)
title("Input Signal")
ylabel("x(n)")
xlabel("n")

subplot(1,2,2)
stem(n,y)
title("Output Signal")
ylabel("y(n)")
xlabel("n")

%% 3rd question
% y(n) = 0.0181x(n)+0.0543x(n−1)+0.0543x(n−2)+0.0181x(n−3)+1.76y(n−1)−1.1829y(n−2)+0.2781y(n−3)
close all
clear
clc

w = linspace(0,pi,501);

b = [0.0181 0.0543 0.543 0.0181];
a = [1 1.76 -1.1829 0.2781 0];
[H, w] = freqz(b,a,w);

phaseOfH = angle(H);
magnitudeOfH = abs(H);

subplot(1,2,1)
stem(w,magnitudeOfH)
title("Magnitude of Impulse Response")
xlabel("n")
ylabel("abs(H)")

subplot(1,2,2)
stem(w,phaseOfH)
title("Phase of Impulse Response")
xlabel("n")
ylabel("angle(H)")
