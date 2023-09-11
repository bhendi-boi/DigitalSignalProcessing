function [x,n] = unitStep(nmin,nmax,dt)
   if nargin == 2
       dt = 1;
   end
   n = nmin:dt:nmax;
   x = 1 * (n >= 0);
end