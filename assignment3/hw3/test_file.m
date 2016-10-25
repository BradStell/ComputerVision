% Please do NOT change any thing in this script.
% I will use my own script for grading. 
% It will be exactly the same as this one but with different testing image.
clear; clc; close all;

img_path = './val/';
class_num = 30;
img_per_class = 20;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329060.JPG')),2);

folder_dir = dir(img_path);
feat = zeros(img_num,feat_dim);
label = zeros(img_num,1);

for i = 1:1
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label((i-1)*img_per_class+1:i*img_per_class) = i;
    
    for j = 1:1
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        feat((i-1)*img_per_class+j,:) = feature_extraction(img);
    end
    
end

    load('model_harris.mat', 'feat_train', 'label_train');
    predict_label = zeros([size(feat,1), 1]);
    dists = zeros([1, size(feat_train), 1]);
    
    
    for i = 1:size(feat,1)
       for j = 1:size(feat_train,1)
          dists(j) = sqrt(sum((feat(i,:) - feat_train(j,:)) .^ 2)); 
       end
       dists_sorted = sort(dists);
       top_5_dists = dists_sorted(1:5);
       
       top_5_images = zeros([1, 5]);
       for k = 1:5
          for l = 1:size(dists,2)
             if (top_5_dists(k) == dists(l))
                 top_5_images(k) = l;
             end
          end
       end
       most_freq_image = mode(top_5_images);
       predict_label(i,1) = label_train(most_freq_image,1);
    end

accuracy = sum(predict_label==label) ./ img_num;
display(accuracy);




