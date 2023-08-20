function [x,n] = impulse(nmin,nmax,dt)
   n = nmin:dt:nmax;
   x = (n == 0);
end