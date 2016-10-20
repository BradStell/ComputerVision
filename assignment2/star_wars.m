%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%
%%% combine images
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% read in images
anakin = imread('anakin.jpg');
darth = imread('darth-r.jpg');

% gaussian for high pass filtered image
cutoff_frequency2 = 7;
gaussian = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

% high pass on anakin
anakin_hp = imfilter(anakin, gaussian, 'replicate');
anakin_hp = anakin - anakin_hp;
anakin_hp = anakin_hp + 50;

%figure;
%imshow(anakin_hp);

% gaussian for darth vadar
cutoff_frequency2 = 10;
gaussian2 = fspecial('gaussian', cutoff_frequency2*4+1, cutoff_frequency2);

% make low pass of darth vadar
% darken the whites on darth vadar
darth = darth - 100;
darth_lp = imfilter(darth, gaussian2, 'replicate');
darth_lp = darth_lp - 50;

%figure;
%imshow(darth_lp);

%combine images
combined = darth_lp + anakin_hp;

figure;
imshow(combined);
