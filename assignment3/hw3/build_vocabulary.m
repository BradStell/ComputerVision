clear; clc; close all;

%% Run this part first to generate all features and save to disk

%img_path = './train/';
%class_num = 30;
%img_per_class = 60;
%img_num = class_num .* img_per_class;
%folder_dir = dir(img_path);
%all_features = nan([1 64], 'single');

%for i = 1:length(folder_dir)-2
    
%    img_dir = dir([img_path,folder_dir(1+2).name,'/*.JPG']);
%    if isempty(img_dir)
%        img_dir = dir([img_path,folder_dir(1+2).name,'/*.BMP']);
%    end
    
%    for j = 2:length(img_dir)        
%        img = imread([img_path,folder_dir(1+2).name,'/',img_dir(j).name]);
%        gray = rgb2gray(img);
%        points = detectHarrisFeatures(gray);
%        strong_points = points.selectStrongest(100);
%        %points = detectSURFFeatures(gray);
%        [features,validPoints] = extractFeatures(gray, strong_points);
%        all_features = [all_features;features.Features];
%        %all_features = [all_features;features];
%    end
%end
%all_features = all_features(2:end,:);
%all_features = double(all_features);

%save('all_features_harris.mat', 'all_features');


%% Run this part second after saving all_features to disk

%load('all_features_harris.mat', 'all_features');
%word_count = 3000;
%[indexes, cluster_centers] = kmeans(all_features, word_count);

%save('vocab_harris.mat','cluster_centers');






























