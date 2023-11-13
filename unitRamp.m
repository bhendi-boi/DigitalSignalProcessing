function [x, n] = unitRamp(nmin, nmax, dt, n0)

    if nargin == 3
        n0 = 0;
    end

    n = nmin:dt:nmax;
    [unitStepTemp, ~] = unitStep(nmin, nmax, dt, n0);
    x = n .* unitStepTemp;
end
