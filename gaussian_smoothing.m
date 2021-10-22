pkg load image;

%reading and resizing image
img = imread('pictures/saturn.png');
img=rgb2gray(img);
figure,imshow(img),title('original image');

%noise array created by gaussian distribution
sigma = 25;
noise = randn(size(img))*sigma;

%noise applied to image
noisy_image = noise+img;
figure,imshow(noisy_image),title('noisy image');

%filter settings(sigma and kernel size)
filter_size = 11;
filter_sigma = 2;

%gaussian smoothing filter created
gauss_filter = fspecial('gaussian',filter_size,filter_sigma);

%show surface mesh of gauss_filter
figure,surf(gauss_filter),title('3D surface of gaussian filter');


%filter apply 
smoothed_image=imfilter(noisy_image,gauss_filter,'symmetric');
figure,imshow(smoothed_image),title('smoothed image');
