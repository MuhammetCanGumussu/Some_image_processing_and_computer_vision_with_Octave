pkg load image;

%read and show image
img = imread('pictures/chad2.jpg');
figure,imshow(img),title('original image');

%apply salt and pepper noise to image 
noisy_img=imnoise(img,'salt & pepper',0.09);
figure,imshow(noisy_img),title('salt and pepper');

%apply median filter to noisy image 
median_filtered_image=medfilt2(noisy_img);
figure,imshow(median_filtered_image),title('median filter applied');

