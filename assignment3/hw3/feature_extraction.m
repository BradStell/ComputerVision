function feat = feature_extraction(img)

    load('vocab_harris.mat', 'cluster_centers');
    feat = zeros([1 3000], 'uint16');
    min = realmax;
    word = 0;
    
    gray = rgb2gray(img);
    points = detectHarrisFeatures(gray);
    strong_points = points.selectStrongest(100);
    [features,validPoints] = extractFeatures(gray, strong_points);
    feature_vector = features.Features;
    
    for i = 1:length(feature_vector)
        for j = 1:length(cluster_centers)
           dist = sqrt(sum((feature_vector(i) - cluster_centers(j)) .^ 2));
            if dist < min
                min = dist;
                word = j;
            end 
        end
        feat(word) = feat(word) + 1;
    end
end