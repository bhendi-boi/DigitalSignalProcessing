% change all the images to grayscale first
clear;
ref = rgb2gray(double(imread("carnivaldolls.bmp")));
refWithNoise = rgb2gray(double(imread("img181.bmp")));

[mse1, psnr1] = msePsnr(ref, refWithNoise);
[ssim1, ssimMap1] = ssim(ref, refWithNoise);
subplot(1, 2, 1)
imshow(ssimMap1, [])
title("SSIM for carnivaldolls")

ref2 = sort(ref, "ascend");
refWithNoise2 = sort(refWithNoise, "ascend");

[mse2, psnr2] = msePsnr(ref2, refWithNoise2);
[ssim2, ssimMap2] = ssim(ref2, refWithNoise2);
subplot(1, 2, 2)
imshow(ssimMap2, [])
title("SSIM for carnivaldolls sorted")

%% question 2
clear;
ref = double(rgb2gray(imread("carnivaldolls.bmp")));
refWithNoise = imnoise(ref, "gaussian");

[mse1, psnr1] = msePsnr(refWithNoise, ref);
[ssim1, ssimMap1] = ssim(ref, refWithNoise);
subplot(1, 2, 1)
imshow(ssimMap1, [])
title("SSIM for carnivaldolls")

ref2 = double(rgb2gray(imread("monarch.bmp")));
ref2 = imresize(ref2, [488, 610]);
refWithNoise2 = imnoise(ref2, "gaussian");

[mse2, psnr2] = msePsnr(ref2, refWithNoise2);
[ssim2, ssimMap2] = ssim(ref2, refWithNoise2);
subplot(1, 2, 2)
imshow(ssimMap2, [])
title("SSIM for Monarch")

%% question 3

clear;
ref = double(rgb2gray(imread("carnivaldolls.bmp")));
img1 = imadd(ref, 50);
img2 = imadd(ref, -50);

[mse1, psnr1] = msePsnr(img1, ref);
[mse2, psnr2] = msePsnr(img2, ref);

[ssim1, ssimMap1] = ssim(ref, img1);
subplot(1, 2, 1)
imshow(ssimMap1, [])
title("SSIM for ref - 50")

[ssim2, ssimMap2] = ssim(ref, img2);
subplot(1, 2, 2)
imshow(ssimMap2, [])
title("SSIM for ref + 50")

%% question 4

clear;
ref = double(rgb2gray(imread("carnivaldolls.bmp")));
refWithNoise = double(rgb2gray(imread("img181.bmp")));

localAbsError = ref;
[rows, cols] = size(localAbsError);

for i = 1:rows

    for j = 1:cols
        localAbsError(i, j) = abs(ref(i, j) - refWithNoise(i, j));
    end

end

subplot(1, 2, 1)
imshow(localAbsError, [])
title("Local Absolute Error for carnivaldolls")
[ssim, ssimMap] = ssim(ref, refWithNoise);
subplot(1, 2, 2)
imshow(ssimMap, [])
title("SSIM Map for carnivaldolls")

%% question 5

clear;
ref = double(rgb2gray(imread("carnivaldolls.bmp")));
refWithNoise = double(rgb2gray(imread("img181.bmp")));
subplot(2, 2, 1)
imshow(ref, [])
title("Original Image")
subplot(2, 2, 2)
imshow(refWithNoise, [])
title("Distorted Image")

localAbsError = ref;
[rows, cols] = size(localAbsError);

for i = 1:rows

    for j = 1:cols
        localAbsError(i, j) = abs(ref(i, j) - refWithNoise(i, j));
    end

end

subplot(2, 2, 3)
imshow(localAbsError, [])
title("Local Absolute Error for carnivaldolls")
[ssim, ssimMap] = ssim(ref, refWithNoise);
subplot(2, 2, 4)
imshow(ssimMap, [])
title("SSIM Map for carnivaldolls")
