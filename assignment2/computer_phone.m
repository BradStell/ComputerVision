% Read in images
cat = imread('cat.JPG');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Make gaussian filters
cutoff_frequency2 = 3;
gaussian7 = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

cutoff_frequency2 = 1;
gaussian2 = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Low frequency images
cat_blurred = imfilter(cat, gaussian2, 'replicate');
cat_blurred_more = imfilter(cat, gaussian7, 'replicate');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Show images
figure; 
imshow(cat);

figure;
imshow(cat_blurred);

figure;
imshow(cat_blurred_more);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% High frequency images
cat_high_frequency = cat - cat_blurred;
cat_high_frequency2 = cat - cat_blurred_more;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Show images
figure; 
imshow(cat_high_frequency);

figure;
imshow(cat_high_frequency2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











