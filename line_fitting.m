pkg load image;

img=imread('pictures/chess_board.png');
img=imresize(img,[400 350]);
figure,imshow(img);

gray_img=rgb2gray(img);
figure,imshow(gray_img);

edges_of_img=edge(gray_img,'canny');
figure,imshow(edges_of_img);


smoothed_edges=edge(gray_img,'canny');
figure,imshow(smoothed_edges);

%Apply Hough transform to find candidate lines

[accum, theta, rho]=hough(smoothed_edges);

figure , imagesc(theta, rho, accum), title('Hough Accumulator');

%Find peaks in the Hough accumulator matrix
peaks = houghpeaks(accum,30,'Threshold',50);

hold on; plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');hold off;

line_segs=houghlines(smoothed_edges,theta,rho,peaks);

figure,imshow(img),title('Line Segments');
hold on;
for k=1:length(line_segs)
  endpoints=[line_segs(k).point1 ; line_segs(k).point2];
  plot(endpoints(:,1),endpoints(:,2),'LineWidth',1,'Color','green');
end
hold off;