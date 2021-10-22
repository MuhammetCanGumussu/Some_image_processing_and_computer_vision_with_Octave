pkg load image;

function [yIndex xIndex]=findTemplate2D(template,image)
  % we apply normalize cross corelation which makes kernels standart deviation=1.
  % c is standart deviation map(of entire image.
  c=normxcorr2(template,image);
  
  % we are searchig the biggest value index from c map.
  [yRaw xRaw]=find(c==max(c(:)));
  
  % for finding exact location we must extract sizes of kernel from raw indexes(and add 1)
  yIndex=yRaw-size(template,1)+1;
  xIndex=xRaw-size(template,2)+1;

endfunction

% we read and resize image
img=imread('pictures/band_of_hawk.jpg');
img=imresize(img,[512 610]);

figure,imshow(img),title('image');

% we extract some part from image and show it
part_of_image=img(290:400,170:290);
figure,imshow(part_of_image),title('part of image (which we are search for)');

% with this function we are now able to search part of image with entire image
[y x]=findTemplate2D(part_of_image,img);


% we are showing which part we extracted and search.
figure,colormap('gray'),imagesc(img);
hold on;
plot(x+(400-290)/2,y+(290-170)/2,'g+','markersize',15);
rectangle('Position',[170 290 290-170 400-290 ]);
hold off;