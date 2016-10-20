% pyramid building file
g_image = imread('darth-r.jpg');
l_image = imread('anakin.jpg');

% make images bigger if small res originals
%g_image = imresize(g_image, [500 NaN]);
%l_image = imresize(l_image, [500 NaN]);

% gaussian for gaussian pyramid
cf = 1;
gaussian = fspecial('gaussian', cf*4+1, cf);

% build gaussian pyramid
for i = 1:5
    g_image = imfilter(g_image, gaussian, 'replicate');
    g_image = g_image(1:2:end, 1:2:end, :);
    figure;
    imshow(g_image);
end

% gaussian for laplacian pyramid
cf = 2;
gaussian = fspecial('gaussian', cf*4+1, cf);

% build laplacian pyramid
for i = 1:5
    l_image_g = imfilter(l_image, gaussian, 'replicate');
    l_image = l_image - l_image_g;
    figure;
    imshow(l_image * 3);
    l_image = l_image_g(1:2:end, 1:2:end, :);
end