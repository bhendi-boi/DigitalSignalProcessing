function [x, n] = unitStep(nmin, nmax, dt, n0)

    if nargin == 3
        n0 = 0;
    end

    n = nmin:dt:nmax;
    x = 1 * (n >= n0);
end
