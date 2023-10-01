A = 4 * pi;
Nq = 2000;
t = linspace(0,A,1001);

x1 = cos(2 * pi * 1000 * t);

x2 = x1 .* x1 ;

x3 = real(exp(-1i * 2 * pi * 2000 * t));

x = x1 + x2 + x3;

subplot(5,1,1)
plot(t,x)
xlabel("t")
ylabel("x(t)")
title("x(t) for t = 0 to 4*pi")


fs = 500;
noOfSamples = round(A * fs);
s = linspace(0,A,noOfSamples);
x1 = cos(2 * pi * 1000 * s);

x2 = x1 .* x1 ;

x3 = real(exp(-1i * 2 * pi * 2000 * s));

x = x1 + x2 + x3;

subplot(5,1,2)
stem(s,x)
xlabel("t")
ylabel("x(t)")
title("Sampled signal for fs = 500 Hz")

fs = 1000;
noOfSamples = round(A * fs);
s = linspace(0,A,noOfSamples);
x1 = cos(2 * pi * 1000 * s);

x2 = x1 .* x1 ;

x3 = real(exp(-1i * 2 * pi * 2000 * s)); 

x = x1 + x2 + x3;

subplot(5,1,3)
stem(s,x)
xlabel("t")
ylabel("x(t)")
title("Sampled signal for fs = 1000 Hz")


fs = Nq;
noOfSamples = round(A * fs);
s = linspace(0,A,noOfSamples);
x1 = cos(2 * pi * 1000 * s);

x2 = x1 .* x1 ;

x3 = real(exp(-1i * 2 * pi * 2000 * s));

x = x1 + x2 + x3;

subplot(5,1,4)
stem(s,x)
xlabel("t")
ylabel("x(t)")
title("Sampled signal for fs = Nyquist Rate i.e., 4000 Hz")

fs = 2 * Nq;
noOfSamples = round(A * fs);
s = linspace(0,A,noOfSamples);
x1 = cos(2 * pi * 1000 * s);

x2 = x1 .* x1 ;

x3 = real(exp(-1i * 2 * pi * 2000 * s));

x = x1 + x2 + x3;

subplot(5,1,5)
stem(s,x)
xlabel("t")
ylabel("x(t)")
title("Sampled signal for fs = 2 * Nyquist Rate i.e., 8000 Hz")