pkg load image;

img = imread('pictures/chad2.jpg');

% resizing image and clustering range [0 1]
img=double(imresize(img,[512 610]))/255.0;
figure,imshow(img),title('Chad Suleyman');

% every sobel kernel takes 8 right derivates '[-1 1]' in total
sobel_x=[-1 0 1;-2 0 2;-1 0 1];
sobel_y=[1 2 1;0 0 0;-1 -2 -1];

% derivates are very sensitive to noise so we can apply gaussian to our gradients
% sobel(X)Image(X)gaussian -> order is not important (X):convolution 
gx=conv2(img,sobel_x);
gy=conv2(img,sobel_y);

kernel_size=3;
sigma=1;
gauss=fspecial('gaussian',kernel_size,sigma);
gx=imfilter(gx,gauss,'symmetric');
gy=imfilter(gy,gauss,'symmetric');

% our gx or gy now ranges between [-4 4]
% every sobel kernel takes 8 derivates in total so we need to normalize it by dividing 8
% and now gx or gy ranges between [-0.5 0.5] so we add 4 before division for range [0 1] again
% we did this because we want to see black(0) as negative derivative and white(1) as positive derivative
% and gray(0.5) as no change/derivative
figure,imshow((gx+4)/8),title('sobel for x direction');
figure,imshow((gy+4)/8),title('sobel for y direction');


% gx and gy ranges between [-4 4]
% we take magnitude of gradients with this formula : mag= srt(gx.^2+gy.^2)
% we divide it by 4*sqrt(2),now with this division our range clustered into again [0 1]
% 1(white) for strong magnitude of gradient, 0(black) for no gradient/magnitude. 
% magnitude of gradient = srt(gx.^2+gy.^2)we add /(4*sqrt(2) for proper range[] 
gmag=sqrt((gx.^2+gy.^2))./(4*(sqrt(2)));
figure,imshow(gmag),title('magnitude of gradient');

