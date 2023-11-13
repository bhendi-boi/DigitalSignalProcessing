clear
t = 0:1/10:100;
x = 10 * (t >= 0);

subplot(2, 1, 1)
plot(t, x)
xlabel("t")
ylabel("x (v)")
title("Original Signal")

subplot(2, 1, 2)
stem(t, x)
xlabel("Time (s)")
ylabel("n")
title("Sampled Signal")

%% question 2

clear
Am = 10;
fm = 10;
t = 0:0.01:10;
x = Am * sin(2 * pi * fm * t);

fs = 200;
numSamples = round(10 / (1 / fs));
s = linspace(0, 10, numSamples);

y = Am * sin(2 * pi * fm * s);

subplot(2, 2, [1 2])
plot(t, x)
title("Original Signal")
xlabel("t")
ylabel("x(t)")

subplot(2, 2, 3)
plot(s, y)
title("Sampled Signal with fs = 200")
xlabel("t")
ylabel("y1(t)")

subplot(2, 2, 4)
stem(s, y)
title("Sampled Signal with fs = 200")
xlabel("n")
ylabel("y1(n)")

%% question 3

f1 = figure("Name", "fs = 100");
fs = 100;
numSamples = round(10 / (1 / fs));
s = linspace(0, 10, numSamples);

y = Am * sin(2 * pi * fm * s);

subplot(2, 1, 1)
plot(s, y)
title("Sampled Signal with fs = 100")
xlabel("t")
ylabel("y2(t)")

subplot(2, 1, 2)
stem(s, y)
title("Sampled Signal with fs = 100")
xlabel("n")
ylabel("y2(n)")

f2 = figure("Name", "fs = 50");
fs = 50;
numSamples = round(10 / (1 / fs));
s = linspace(0, 10, numSamples);

y = Am * sin(2 * pi * fm * s);

subplot(2, 1, 1)
plot(s, y)
title("Sampled Signal with fs = 50")
xlabel("t")
ylabel("y3(t)")

subplot(2, 1, 2)
stem(s, y)
title("Sampled Signal with fs = 50")
xlabel("n")
ylabel("y3(n)")

f4 = figure("Name", "fs = 10");
fs = 10;
numSamples = round(10 / (1 / fs));
s = linspace(0, 10, numSamples);
y = Am * sin(2 * pi * fm * s);

subplot(2, 1, 1)
plot(s, y)
title("Sampled Signal with fs = 10")
xlabel("t")
ylabel("y4(t)")

subplot(2, 1, 2)
stem(s, y)
title("Sampled Signal with fs = 10")
xlabel("n")
ylabel("y4(n)")

f3 = figure("Name", "fs = 20");
fs = 20;
numSamples = round(10 / (1 / fs));
s = linspace(0, 10, numSamples);
y = Am * sin(2 * pi * fm * s);

subplot(2, 1, 1)
plot(s, y)
title("Sampled Signal with fs = 20")
xlabel("t")
ylabel("y5(t)")

subplot(2, 1, 2)
stem(s, y)
title("Sampled Signal with fs = 20")
xlabel("n")
ylabel("y5(n)")

%% question 4
syms w;
fs = 10;
wo = 2 * pi * fs;

fs1 = 20;
wo1 = 2 * pi * fs1;

fs2 = 30;
wo2 = 2 * pi * fs2;

X = 0.2 * triangularPulse(w / (20 * pi));
n = -10:10;
X1 = 0.2 * fs * triangularPulse((w - (n * wo)) / (20 * pi));
X2 = 0.2 * fs1 * triangularPulse((w - (n * wo1)) / (20 * pi));
X3 = 0.2 * fs2 * triangularPulse((w - (n * wo2)) / (20 * pi));

subplot(2, 2, 1)
fplot(X, [-1000 1000]);
title("Frequency Response")
xlabel("X1(w)")
ylabel("w")
subplot(2, 2, 2)
fplot(X1, [-1000 1000])
title("Frequency Response with fs = 10 Hz")
xlabel("X1(w)")
ylabel("w")
subplot(2, 2, 3)
fplot(X2, [-1000 1000])
title("Frequency Response with fs = 20 Hz")
xlabel("X1(w)")
ylabel("w")
subplot(2, 2, 4)
fplot(X3, [-1000 1000])
title("Frequency Response with fs = 30 Hz")
xlabel("X1(w)")
ylabel("w")

%% question 5
clear
f1 = 10;
f2 = 50;
A1 = 5;
A2 = 10;

t = linspace(0, 1, 1001);
x1 = A1 * sin(2 * pi * f1 * t);
x2 = A2 * sin(2 * pi * f2 * t);
x = x1 + x2;

subplot(2, 2, [1 2])
plot(t, x)
title("Original Signal")
xlabel("t")
ylabel("s(t)")

fs = 250;
numSamples = round(1 / (1 / fs));
s = linspace(0, 1, numSamples);

x1 = A1 * sin(2 * pi * f1 * s);
x2 = A2 * sin(2 * pi * f2 * s);
x = x1 + x2;

subplot(2, 2, 3);
plot(s, x)
title("Sampled Signal with fs = 250")
xlabel("t")
ylabel("y(t)")

subplot(2, 2, 4);
stem(s, x)
title("Sampled Signal with fs = 250")
xlabel("n")
ylabel("y(n)")

%% question 6

t = linspace(0, 1, 1001);
x1 = A1 * sin(2 * pi * f1 * t);
x2 = A2 * sin(2 * pi * f2 * t);
x = x1 + x2;

subplot(2, 2, [1 2])
plot(t, x)

fs = 500;
numSamples = round(1 / (1 / fs));
s = linspace(0, 1, numSamples);

x1 = A1 * sin(2 * pi * f1 * s);
x2 = A2 * sin(2 * pi * f2 * s);
x = x1 + x2;

subplot(2, 2, 3);
plot(s, x)
title("Sampled Signal with fs = 500")
xlabel("t")
ylabel("y(t)")

subplot(2, 2, 4);
stem(s, x)
title("Sampled Signal with fs = 500")
xlabel("n")
ylabel("y(n)")
