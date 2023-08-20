%% 1st question


% 0th index at 1
x = [-2 -1 1 4 3];
n = -2:1:2;
subplot(2,2,1)
stem(n,x)
title("Input Signal")
xlabel("n")
ylabel("x(n)")
% 0th index at 5
h = [1 1 5 2 6];
n = -2:1:2;
subplot(2,2,2)
stem(n,x)
title("Impulse Response")
xlabel("n")
ylabel("x(n)")

[y,n] = convolution(x,-2,h,-2);
subplot(2,2,3)
stem(n,y)
title("Using user defined fn")
xlabel("n")
ylabel("y(n)")

y = conv(x,h);
n = -4:1:4;
subplot(2,2,4)
stem(n,y)
title("Using inbuilt fn")
xlabel("n")
ylabel("y(n)")


%% 2nd question
x = [1 2 3];
h = [0.5 0.5];

[y1,n] = convolution(x,0,h,0);
subplot(2,2,1)
stem(n,y1)
title("Using user defined fn x(n) * h(n)")
xlabel("n")
ylabel("y1(n)")

[y2,n] = convolution(h,0,x,0);
subplot(2,2,3)
stem(n,y2)
title("Using user defined fn h(n) * x(n)")
xlabel("n")
ylabel("y2(n)")

y3 = conv(x,h);
y4 = conv(h,x);

subplot(2,2,2)
stem(n,y3)
title("Using inbuilt fn x(n) * h(n)")
xlabel("n")
ylabel("y3(n)")

subplot(2,2,4)
stem(n,y4)
title("Using inbuilt fn h(n) * x(n)")
xlabel("n")
ylabel("y4(n)")

%% 3rd question Associative 

x = [1 2 3 -1 -1 2 3];
h1 = [1 2 4 1 -5 1];
h2 = [4 3 2 2 1 -2 -6];

% h1(n) * h2(n)
[h3,n] = convolution(h1,-5,h2,-3);
subplot(2,2,1)
stem(n,h3)
title("h1(n) * h2(n)")
xlabel("n")
ylabel("h3(n)")

% y1(n) = x(n) * {h1(n) * h2(n)}
[y1,n] = convolution(x,-6,h3,-8);
subplot(2,2,2)
stem(n,y1)
title("x(n) * (h1(n) * h2(n))")
xlabel("n")
ylabel("y1(n)")

% x(n) * h1(n)
[h4,n] = convolution(x,-6,h1,-5);
subplot(2,2,3)
stem(n,h4)
title("x(n) * h1(n)")
xlabel("n")
ylabel("h4(n)")

% y2(n) = {x(n) * h1(n)} * h2(n)
[y2,n] = convolution(h2,-3,h4,-11);
subplot(2,2,4)
stem(n,y2)
title("x(n) * h1(n)) * h2(n)")
xlabel("n")
ylabel("y2(n)")

%% 3rd question Distributive

x = [1 2 3 -1 -1 2 3];
h1 = [1 2 4 1 -5 1];
h2 = [4 3 2 2 1 -2 -6];

% h3(n) = x(n) * h1(n)
[h3,n1] = convolution(x,-6,h1,-5);
subplot(2,2,1)
stem(n1,h3)
title("h3(n) = x(n) * h1(n)")
xlabel("n")
ylabel("h3(n)")

% h4(n) = x(n) * h2(n)
[h4,n2] = convolution(x,-6,h1,-3);
subplot(2,2,2)
stem(n2,h3)
title("h4(n) = x(n) * h2(n)")
xlabel("n")
ylabel("h4(n)")

%% Finding h4(n) + h3(n)
if n1(1) < n2(1)
    temp = n2(1) - n1(1);
    n1 = n2;
    for i = 1:temp
        h3 = [0 h3];
    end
else
    temp = n1(1) - n2(1);
end


%% 4th question

[x,n] = unitStep(0,9,1);
subplot(2,2,1)
stem(n,x)
title("Input Signal")
xlabel("n")
ylabel("x(n)")

h = ones(1,10);
temp = 0.9;
for i = 1:10
    h(i) = temp ^ i;
end
subplot(2,2,2)
stem(n,h)
title("Impulse Response")
xlabel("n")
ylabel("h(n)")

[y,n] = convolution(x,0,h,0);
subplot(2,2,3)
stem(n,y)
title("Finding y(n) for given x(n) and h(n)")
xlabel("n")
ylabel("y(n)")

%% 5th question

x = [1 2 3 4];
h = [1 2 1 1];

y1 = circularConvolution(x,h);
y2 = cconv(x,h,4);
n = 0:1:3;

subplot(2,2,1)
stem(n,x)
title("Input Signal")
xlabel("n")
ylabel("x(n)")

subplot(2,2,2)
stem(n,x)
title("Impulse Response")
xlabel("n")
ylabel("h(n)")

subplot(2,2,3)
stem(n,y1)
title("User defined fn")
xlabel("n")
ylabel("y1(n)")

subplot(2,2,4)
stem(n,y2)
title("Inbuilt fn")
xlabel("n")
ylabel("y2(n)")
