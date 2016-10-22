function predict_label = your_kNN(feat)
    % Output should be a fixed length vector [num of img, 1]. 
    % Please do NOT change the interface.
    
    load('model_harris.mat', 'feat_train', 'label_train');
    predict_label = zeros([size(feat,1), 1]);
    dists = zeroes([1, size(feat_train), 1]);
    
    
    for i = 1:length(feat)
       for j = 1:length(feat_train)
          dists(j) = sqrt(sum((feat(i) - feat_train(j)) .^ 2)); 
       end
       dists_sorted = sort(dists);
       top_5_dists = dists_sorted(1:5);
       
       top_5_words = zeroes([1, 5]);
       for k = 1:5
          for l = 1:length(dists)
             if (top_5_dists(k) == dists(l))
                 top_5_words(k) = l;
             end
          end
       end
       
       
    end
    
end