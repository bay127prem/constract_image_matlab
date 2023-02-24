I1 = imread('aqui.pgm');
figure;
imshow(I1);
hI1 = imhist(I1);

minI1 = min(I1);
maxI1 = max(I1);

I2 = imread('pont.pgm');
figure;
imshow(I2);
hI2 = imhist(I2);

minI2 = min(I2);
maxI2 = max(I2);

I3 = imread('Loup-noir.jpg');
figure;
imshow(I3);
hI3 = imhist(I3);

minI3 = min(I3);
maxI3 = max(I3);
