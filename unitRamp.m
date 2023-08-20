function [x,n] = unitRamp(nmin,nmax,dt)
   n = nmin:dt:nmax;
   [unitStepTemp,t ]= unitStep(nmin,nmax,dt);
   x = n .* unitStepTemp;
end