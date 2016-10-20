%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%
%%% High Pass: winter
%%% Low Pass: summer
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read in images
winter_tree = imread('winter_tree3.jpg');
summer_tree = imread('summer_tree3.jpg');

% make images bigger
winter_tree = imresize(winter_tree, [750 NaN]);
summer_tree = imresize(summer_tree, [750 NaN]);

% gaussian, cutoff freq
cutoff_frequency2 = 5;
gaussian = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

% high pass on winter tree
winter_hp = imfilter(winter_tree, gaussian, 'replicate');
winter_hp = winter_tree - winter_hp;
winter_hp = winter_hp * 1.5;

%figure;
%imshow(winter_hp);

% make low pass of summer tree
cutoff_frequency2 = 6;
gaussian2 = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

summer_lp = imfilter(summer_tree, gaussian2, 'replicate');

%figure;
%imshow(summer_lp);

%combine images
combined = summer_lp + winter_hp;

figure;
imshow(combined);