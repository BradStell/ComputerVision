load('vocab.mat', 'cluster_centers');
    feat = zeros([1 3000], 'uint16');
    min = realmax;
    word = 0;

    img_path = './train/';
    folder_dir = dir(img_path);
    img_dir = dir([img_path,folder_dir(6).name,'/*.JPG']);
    img = imread([img_path,folder_dir(6).name,'/',img_dir(15).name]);
    
    gray = rgb2gray(img);
    points = detectSURFFeatures(gray);
    [features,valid_points] = extractFeatures(gray, points);
    
    dist = sqrt(sum((features(1) - cluster_centers(10)) .^ 2));
    
%    for i = 1:length(features)
%        for j = 1:length(cluster_centers)
%           dist = sqrt(sum((features(i) - cluster_centers(j)) .^ 2));
%            if dist < min
%                min = dist;
%                word = j;
%            end 
%        end
%        feat(word) = feat(word) + 1;
%        formatSpec = 'min is %8.8f word is %d\n';
%        fprintf(formatSpec,min,word);
%    end
    

feat = zeros([756 3000]);
predict_label = zeros([size(feat,1), 1]);
    
    
    
    
    
    
    