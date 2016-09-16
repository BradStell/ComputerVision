ferrari = imread('Ferrari.jpg');
figure;
imshow(ferrari);

ferrariDS = ferrari(1:6:end, 1:6:end, :);
figure;
imshow(ferrariDS);

gaussian = fspecial('gaussian', [9 9], 3);
ferrariB = imfilter(ferrari, gaussian, 'replicate');
figure;
imshow(ferrariB);

ferrariDSB = ferrariB(1:6:end, 1:6:end, :);
figure;
imshow(ferrariDSB);