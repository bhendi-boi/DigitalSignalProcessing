%% 1st question ✅

[deltaFunction, t] = impulse(-1, 1, 0.0001);
subplot(4, 2, 1);
plot(t, deltaFunction)
xlabel("Time (s)")
ylabel("Impulse signal")
title("Impulse Signal")

subplot(4, 2, 2)
stem(t, deltaFunction)
xlabel("Time (s)")
ylabel("Impulse signal")
title("Impulse Signal")

[unitStepFunction, t] = unitStep(-1, 1, 0.0001);
subplot(4, 2, 3)
plot(t, unitStepFunction)
xlabel("Time (s)")
ylabel("Unit Step signal")
title("Unit Step Signal")

subplot(4, 2, 4)
stem(t, unitStepFunction)
xlabel("Time (s)")
ylabel("Unit Step signal")
title("Unit Step Signal")

[unitRampFunction, t] = unitRamp(-1, 4, 0.01);
subplot(4, 2, 5)
plot(t, unitRampFunction)
xlabel("Time (s)")
ylabel("Unit Ramp singal")
title("Unit Ramp Signal")

subplot(4, 2, 6)
stem(t, unitRampFunction)
xlabel("Time (s)")
ylabel("Unit Ramp singal")
title("Unit Ramp Signal")

t = linspace(0, 4 * pi, 101);
sinusoidal = sin(t);
subplot(4, 2, 7);
plot(t, sinusoidal);
xlabel("Time (s)")
ylabel("Sinusoidal")
title("Sinusoidal")

subplot(4, 2, 8);
stem(t, sinusoidal);
xlabel("Time (s)")
ylabel("Sinusoidal")
title("Sinusoidal")
%%

t = linspace(-1, 10);
exponentialSignal = exp(t);
subplot(2, 3, 1)
plot(t, exponentialSignal)
title("Exponential (Rising)")
xlabel("Time (s)")
ylabel("Exponential Signal")

subplot(2, 3, 2)
stem(t, exponentialSignal)
title("Exponential (Rising)")
xlabel("Time (s)")
ylabel("Exponential Signal")

exponentialSignal = exp(-t);
subplot(2, 3, 3)
plot(t, exponentialSignal)
title("Exponential (Falling)")
xlabel("Time (s)")
ylabel("Exponential Signal")

subplot(2, 3, 4)
stem(t, exponentialSignal)
title("Exponential (Falling)")
xlabel("Time (s)")
ylabel("Exponential Signal")

t = linspace(-2, 2);
rectangularPulseSignal = rectangularPulse(t);
subplot(2, 3, 5)
plot(t, rectangularPulseSignal)
subplot(2, 3, 6)
stem(t, rectangularPulseSignal)

%% 2nd question

% Define sequences
n = -5:15;
x1 = 3 * (n + 2 == 0) + 2 * (n == 0) - (n - 3 == 0) + 5 * (n - 7 == 0);
x2 = 10 * (n >= 0) - 5 * (n - 5 >= 0) - 10 * (n - 10 >= 0) + 5 * (n - 15 >= 0);
x3 = exp(0.1 * n) .* ((n + 20 >= 0) - (n - 10 >= 0));
% Plot sequences using stem
figure;
subplot(3, 1, 1);
stem(n, x1, "filled");
title('x1(n)');
xlabel('n');
ylabel('Amplitude');
subplot(3, 1, 2);
stem(n, x2);
title('x2(n)');
xlabel('n');
ylabel('Amplitude');
subplot(3, 1, 3);
stem(n, x3, "filled");
title('x3(n)');
xlabel('n');
ylabel('Amplitude');

%% 3rd question

u = 5;
s = 3;
k = 8;
m = 2.4;
F = @(t, x) [x(2); -0.1/2.4 * x(2) - 2 * x(1)];
T = 0:0.001:10;
S = [0.5 0];
[t, y] = ode45(F, T, S);
plot(t, y)
legend({'Position', 'Speed'});
ylabel('Position / Speed [m / m/s]')
xlabel('Time [s]')
title('Mass Spring System');

%% 4th question  ✅

time = linspace(0, 10 * pi, 201);
sinx = sin(time);
t = linspace(0, 5, 201);
subplot(3, 2, 1);
plot(t, sinx)
xlabel("Time (s)")
ylabel("Sine(t)")
title("Sin function 1 Hz for 5 s")

timePeriod = 2;
t = linspace(0, timePeriod * 10, 1000);
squareWave = square(t / 2 * pi * timePeriod);
subplot(3, 2, 2);
plot(t, squareWave)
xlabel("Time (s)")
ylabel("Square wave")
title("Square wave with 50% duty cycle and 2 Hz")

randomSignal = 0.25 * randn(1000, 1);
t = 1:1:1000;
subplot(3, 2, 3);
plot(t, randomSignal)
title("Random signal with mean=0 and standard deviation=0.5")
xlabel("Time(s)");
ylabel("Random signal")

t = linspace(0, 10);
chirpSignal = chirp(t, 1, 10, 5, "linear");
subplot(3, 2, 4);
plot(t, chirpSignal)
xlabel("Time (s)")
ylabel("Chirp Signal")
title("Chirp signal which varies from 1 Hz to 5 Hz linearly over 10 seconds")

t = linspace(0, 4 * pi, 201);
time = linspace(0, 4, 201);
realPart = 2 * sin(t);
subplot(3, 2, 5);
plot(time, realPart)
xlabel("Time (s)")
ylabel("2 * sin(2*pi*2*t)")
title("Real part of Complex signal")

binarySequence = randi([0, 1], 101, 1);
n = 0:0.01:1;
subplot(3, 2, 6);
stem(n, binarySequence)
title("A sequence of binary data")
xlabel("n")
ylabel("Sequence")
