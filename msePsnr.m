function [mse,psnr] = msePsnr(ref,noise)
%msePsnr Finds mean square error and peak signal to noise ratio given 2
%grayscale images
%  
mse = (norm(ref(:)-noise(:),2).^2)/numel(ref);
psnr = 10 * log10(65025/mse);
end