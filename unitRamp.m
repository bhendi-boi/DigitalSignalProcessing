function [x,n] = unitRamp(nmin,nmax,dt)
    if nargin == 2
        dt = 1;
    end
   n = nmin:dt:nmax;
   [unitStepTemp,t ]= unitStep(nmin,nmax,dt);
   x = n .* unitStepTemp;
end