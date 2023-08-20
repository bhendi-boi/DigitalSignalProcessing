function [x,n] = unitStep(nmin,nmax,dt)
   n = nmin:dt:nmax;
   x = 1 * (n >= 0);
end