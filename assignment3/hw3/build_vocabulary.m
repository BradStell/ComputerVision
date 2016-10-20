clear; clc; close all;

img_path = './train/';
class_num = 30;
img_per_class = 60;
img_num = class_num .* img_per_class;
folder_dir = dir(img_path);
%allFeatures = nan(1, 100);

for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(1+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(1+2).name,'/*.BMP']);
    end
        
    img = imread([img_path,folder_dir(1+2).name,'/',img_dir(1).name]);
    gray = rgb2gray(img);
    points = detectHarrisFeatures(gray);
    [allFeatures,validPoints] = extractFeatures(gray, points);
    all_features = allFeatures.Features;
    
    for j = 2:length(img_dir)        
        img = imread([img_path,folder_dir(1+2).name,'/',img_dir(j).name]);
        gray = rgb2gray(img);
        points = detectHarrisFeatures(gray);
        [features,validPoints] = extractFeatures(gray, points);
        all_features = [all_features;features.Features];
    end
    
    [indexes, cluster_centers] = kmeans(double(all_features), 5000);
    
end

save('vocab.mat','cluster_centers');