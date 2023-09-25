function [x, n] = impulse(nmin, nmax, dt, n0)

    if nargin == 3
        n0 = 0;
    end

    n = nmin:dt:nmax;
    x = (n == n0);
end
