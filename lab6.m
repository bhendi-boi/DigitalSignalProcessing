clear
syms n  T
f1 = n;
F1 = ztrans(f1);

a = 2;
f2 = a^n;
F2 = ztrans(f2);

f3 = n * a^n;
F3 = ztrans(f3);

f4 = 1./exp(a * T * n);
F4 = ztrans(f4);


%% question 2


x1 = 0.5^n;
X1 = ztrans(x1);

x2 = 1 + n * (0.4)^(n-1);
X2 = ztrans(x2);


%% question 3
clear
syms z
X1 = 1 ./ (1 - 1.5 * z^-1 + 0.5 * z^-2);
x1 = iztrans(X1);

X2 = 1./((1 + z^-1) * (1 - z^-1)^2) ;
x2 = iztrans(X2);

%% question 4
clear 
syms n
x1 = (0.4) ^ n;
X1 = ztrans(x1);

x2 = (0.5) ^ n;
X2 = ztrans(x2);

%% question 5
clear
a = [3 2 1];
b = [1 -3 2];
[r,p,d] = residue(a,b);

%% question 6
clear 
a = roots([1 0.8 0.8]);
b = roots([1 0 0.49]);
zplane(a,b);

%% question 7
clear 
a = [1 0 0];
b = [1 -0.8 0.16];
[h, n] = impz(a,b);
stem(n,h)
xlabel("n")
ylabel("h(n)")
title("Impulse Responsne")
