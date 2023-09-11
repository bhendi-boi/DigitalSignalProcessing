clear
x = [unitStep(0,5) ,2 * unitStep(6,9)];

X = fftn(x);
n = 0:9;
m = abs(X);
p = unwrap(angle(X));
r = real(X);
i = imag(X);

subplot(2,2,1)
stem(n,r);
xlabel("n")
ylabel("real(X)")
title("Real {X}")
subplot(2,2,2)
stem(n,i)
xlabel("n")
ylabel("imag(X)")
title("Imgaginary {X}")
subplot(2,2,3)
stem(n,m);
xlabel("n")
ylabel("abs(X)")
title("Magnitude Spectrum")
subplot(2,2,4)
stem(n,p)
xlabel("n")
ylabel("angle(X)")
title("Phase Spectrum")

figure()
xNew = ifft(X);
stem(n,xNew)
xlabel("n")
ylabel("x(n)")
title("Time Domain Signal after perfoming ifft")

%% question 2

clear
n = 0:9;
x1 = [0, 1, 2, 0, 0, 0, 0, 0, -2, -1];
X1 = fftn(x1);
m1 = abs(X1);
p1 = unwrap(angle(X1));
r1 = real(X1);
i1 = imag(X1);
subplot(2,2,1)
stem(n,r1);
xlabel("n")
ylabel("real(X1)")
title("Real {X1}")
subplot(2,2,2)
stem(n,i1)
xlabel("n")
ylabel("imag(X1)")
title("Imgaginary {X1}")
subplot(2,2,3)
stem(n,m1);
xlabel("n")
ylabel("abs(X1)")
title("Magnitude Spectrum")
subplot(2,2,4)
stem(n,p1)
xlabel("n")
ylabel("angle(X1)")
title("Phase Spectrum")


n = 0:10;
x2 = 5 * exp(-8 * n);
X2 = fftn(x2);

figure()
m2 = abs(X2);
p2 = unwrap(angle(X2));
r2 = real(X2);
i2 = imag(X2);

subplot(2,2,1)
stem(n,r2);
xlabel("n")
ylabel("real(X2)")
title("Real {X2}")
subplot(2,2,2)
stem(n,i2)
xlabel("n")
ylabel("imag(X2)")
title("Imgaginary {X2}")
subplot(2,2,3)
stem(n,m2);
xlabel("n")
ylabel("abs(X2)")
title("Magnitude Spectrum")
subplot(2,2,4)
stem(n,p2)
xlabel("n")
ylabel("angle(X2)")
title("Phase Spectrum")

%% question 3

clear
n = 0:9;
alpha = 0.2;
x = exp(-1 * alpha * n);
X = fftn(x);
h = [unitRamp(0,2), unitStep(3,6), -3, -2, -1];
H = fftn(h);

Y = X .* H;
y = ifftn(Y);
m = abs(Y);
p = unwrap(angle(Y));

fprintf("y(5) = %d\n", y(6))

subplot(2,1,1)
stem(n,m);
xlabel("n")
ylabel("abs(Y)")
title("Magnitude Spectrum")

subplot(2,1,2)
stem(n,p)
xlabel("n")
ylabel("angle(Y)")
title("Phase Spectrum")

%% question 4

clear
x = [1, -2, 2, 4, 1, 0, 0, 0];
n = 0:7;
y = fft(x);
powerTime = sum(x(1:length(x)).^2);
powerFreq = sum(abs(y(1:length(n))).^2) / length(x);

if (powerFreq == powerTime)
    fprintf("It is verified\n")
else
    fprintf("Not verified\n")
end

%% question 5

clear
n = 0:4;
x = unitRamp(0,4) + 1;
X = fftn(x);
Y = ones(1,length(x));
for k=1:length(x)
    Y(k) = X(k) * exp(-2 * 1j * pi * k * 6 / length(x));
end
y = ifftn(Y);

stem(n,abs(y))
title("Shifted Signal")
ylabel("y(n)")
xlabel("n")
