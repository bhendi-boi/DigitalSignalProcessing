%% 
% Generate an image of size 512×512 pixels, where the central regions of all the pixels have low intensity
% levels within a 64×64 pixel area, while the surrounding regions have high intensity levels. Prove that
% the convolution in spatial domain is equal to multiplication in the frequency domain using MATLAB
% code.
clear
image1 = zeros(512,512);
for i=224:288
    for j=224:288
        image1(i,j) = 1;
    end
end

image2 = ones(512,512);
for i=224:288
    for j=224:288
        image2(i,j) = 0;
    end
end

subplot(2,2,1)
imshow(image1)
title("Image 1")
subplot(2,2,2)
imshow(image2)
title("Image 2")

ci1i2 = conv2(image1,image2,"same");
subplot(2,2,3)
imshow(log(1+abs(ci1i2)),[])
title("Convolution in spacial domain")

Image1 = fft2(image1);
Image2 = fft2(image2);

cI1I2 = Image1 .* Image2;
subplot(2,2,4)
imshow(log(1+abs(fftshift(ifft2(cI1I2)))),[])
title("Multiplication in frequency domain")

%%
% Generate an image of size 512 × 512 pixels, where the central regions of all the pixels have high
% intensity levels within a 32 × 32 pixel area, while the surrounding regions have low intensity levels.
% Rotate the image at various angles, specifically at 45 degrees, 125 degrees, 225 degrees, and any
% random angle. plot and observe the original and rotated images both in spatial and transform
% domain using MATLAB code.
clear
image1 = zeros(512,512);
for i=240:272
    for j=240:272
        image1(i,j) = 1;
    end
end
subplot(2,2,1)
imshow(image1)
title("Original Image")

rotimage45 = imrotate(image1, 45, "bilinear", "crop");
subplot(2,2,2)
imshow(rotimage45)
title("Rotated by 45⁰")

rotimage135 = imrotate(image1, 125, "bilinear", "crop");
subplot(2,2,3)
imshow(rotimage135)
title("Rotated by 125⁰")

rotimage225 = imrotate(image1, 215, "bilinear", "crop");
subplot(2,2,4)
imshow(rotimage225)
title("Rotated by 215⁰")

figure();
Image1 = fft2(image1);
subplot(2,2,1)
imshow(log(1+abs(fftshift(Image1))),[])
title("Original Image")

Rotimage45 = fft2(rotimage45);
subplot(2,2,2)
imshow(log(1+abs(fftshift(Rotimage45))),[])
title("Rotated by 45⁰")

Rotimage135 = fft2(rotimage135);
subplot(2,2,3)
imshow(log(1+abs(fftshift(Rotimage135))),[])
title("Rotated by 125⁰")

Rotimage225 = fft2(rotimage225);
subplot(2,2,4)
imshow(log(1+abs(fftshift(Rotimage225))),[])
title("Rotated by 215")


%%
% You have given two images: Image 1 and Image 2. First, take the Fourier transform of the two
% images. Determine the magnitude and phase component. During the reconstruction using inverse
% Fourier transform, interchange the phase of the two images and reconstruct the image and observe
% the difference. Do the analysis using MATLAB code.
clear
a = imread("cameraman.tif");
b = imread("circuit.tif");
b = imcrop(b,[0,0,256,256]);

subplot(2,2,1)
imshow(a)
title("Moon")

subplot(2,2,2)
imshow(b)
title("Fabric")

A = fft2(a);
B = fft2(b);

c = ifft2(abs(A).*exp(1j * unwrap(angle(B))));
d = ifft2(abs(B).*exp(1j * unwrap(angle(A))));

subplot(2,2,3)
imshow(log(1+abs(c)),[])
title("Abs of Moon with angle of Fabric")

subplot(2,2,4)
imshow(log(1+abs(d)),[])
title("Abs of Fabric with angle of Moon")

%%
% Prove that the inverse two-dimensional Fourier transform of the two-dimensional Fourier transform
% of f(m, n) is f(−m, −n) using MATLAB code.

a = imread("cameraman.tif");
b = fft2(a);
c = fft2(b);

subplot(1,2,1)
imshow(a)
title("Original Image")

subplot(1,2,2)
imshow(log(1+abs(c)),[])
title("2 times fft")
