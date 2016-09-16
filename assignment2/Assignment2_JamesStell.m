%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do all work on Ferrari
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ferrari = imread('Ferrari.jpg');
figure;
imshow(ferrari);

%%%%%%%
% apply gaussian and then subsample image
gaussian = fspecial('gaussian', [7 7], 1);


% Make gaussian pyramid with 6 levels
% for i = 1:6
%     ferrari = imfilter(ferrari, gaussian, 'replicate');
%     ferrari = ferrari(1:2:end, 1:2:end, :);
%     figure;    
%     imshow(ferrari);
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do all work on Wrangler
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wrangler = imread('Wrangler.jpg');
figure;
imshow(wrangler);

% one way to get high pass filter is
% original - lowpass = highpass
wrangerLP = imfilter(wrangler, gaussian, 'replicate');
wranglerHP = wrangler - wrangerLP;
figure;
imshow(wranglerHP);

% Make unit impulse
unitImpulse = [ 
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 1 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    ];
 
% make laplacian filter
laplacian = unitImpulse - gaussian;

% second way to make high pass image
% unit impulse - gaussian -> filter
wranglerLap = imfilter(wrangler, laplacian, 'replicate');
figure;
imshow(wranglerLap);

% laplacian filter image
% gaussian image
% downsample image
% laplacian image
% repeat
% for i = 1:6
%     wranglerLaplacian = imfilter(wrangler, laplacian, 'replicate');
%     figure;
%     imshow(wranglerLaplacian);
%     wrangler = imfilter(wrangler, gaussian, 'replicate');
%     wrangler = wrangler(1:2:end, 1:2:end, :);
% end






