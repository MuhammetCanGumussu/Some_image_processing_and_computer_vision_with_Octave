pkg load image;

%read and show image
img = rgb2gray(imread('pictures/einstein.png'));
figure,imshow(img),title('original image');

%create  impulse_filter
impulse_filter=[0 0 0;0 2 0;0 0 0];

%create box_filter
box_filter=1/9*[1 1 1;1 1 1;1 1 1];


%H_Twice_Impulse - H_Box_Filter = H_Sharpen
sharpening_filter=impulse_filter-box_filter;


%apply sharpening_filter to image 
img_sharpened=imfilter(img,sharpening_filter,'symmetric');
figure,imshow(img_sharpened),title('Sharpening Filter applied');

